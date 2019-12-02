import SwiftUI
import RealmSwift

struct ContentView: View {
    @State var showingDetail = false


    var body: some View {

        VStack {
            Spacer()
            Button (action: {
                print(Realm.Configuration.defaultConfiguration.fileURL)
            }) {Text("show")}
            Spacer()
            Button (action: {
                self.showingDetail.toggle()
            }) {
                Text("Show Detail")
            }.sheet(isPresented: $showingDetail) {
                CardScanIntegratedViewController()
            }
            Spacer()
            Button (action: {
                addNewCard(card: newCard)
                newCard.addInfo(name: "card_number", value: "1234123412341234")
                newCard.addInfo(name: "card_number", value: "11111111111")
                newCard.addInfo(name: "a", value: "aasdfasf")
                newCard.addInfo(name: "b", value: "xvasdf")
                newCard.addInfo(name: "cc", value: "awerweqgs")
                newCard.addInfo(name: "d", value: "asdvda")
                newCard.addInfo(name: "e", value: "asvbdae")
                newCard.removeInfo(key: "card_number")
            }) {Text("create")}
            Button (action: {
                newCard.destroy()
            }) {Text("delete")}
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

