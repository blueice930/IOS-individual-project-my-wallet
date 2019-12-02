import SwiftUI
import LocalAuthentication

struct SwipeView: View {
    @Binding var isLocked: Bool
    @State var viewState = CGSize.zero
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("——————————————\n<<<     Swipe to Unlock    >>>\n——————————————")
                .font(.system(size: 32))
                .fontWeight(.heavy)
                .shadow(radius: 1)
                .foregroundColor(Color.white)
                .padding([.top, .leading, .bottom], 30)
        }
        .blur(radius: self.viewState.width > 250 || self.viewState.width < -250 ? 7 : 0 )
        .animation(.easeInOut)
        .edgesIgnoringSafeArea(.top)
        .offset(x: viewState.width)
        .gesture(DragGesture()
        .onChanged { value in
            self.viewState = value.translation
        }
        .onEnded { value in
            if self.viewState.width > 300 || self.viewState.width < -300 {
                self.authenticate()
            }
            self.viewState = .zero
        })
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                DispatchQueue.main.async {
                    if success {
                        self.isLocked = false
                    } else {
                        print("Unlock Unsuccessful...")
                    }
                }
            }
        } else {
            // no biometrics
        }
    }
}

struct SwipeView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeView(isLocked: .constant(true))
    }
}
