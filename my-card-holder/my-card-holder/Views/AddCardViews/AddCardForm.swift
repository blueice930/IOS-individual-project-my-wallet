import SwiftUI

struct AddCardForm: View {
    @State private var newCard: Card = Card()
    @State private var cardType: String = ""
    @State private var cardNum: String = ""
    @State private var expireDate: String = ""
    @State private var cardHolder: String = ""
    
    let otherInfos = [
        CustomizedInfo()
    ]
    
    var body: some View {
        Form {
            Section(header: Text("Card Type")) {
                Text("Card Type")
                TextField("Credit Card / ID Card / Student Card ...", text: self.$cardType)
            }
            Section(header: Text("Photo")) {
                ImagePickerView()
            }
            Section(header: Text("Other Information")) {
                Text("Card Number")
                TextField("8888 8888 8888 8888", text: self.$cardNum)
                Text("Expire Date")
                TextField("MM / YYYY", text: self.$expireDate)
                Text("Card Holder")
                TextField("CHAN Dai Man", text: self.$cardHolder)
                Button(action:{print("save")}){
                    Text("Save")
                }
                
            }
        }
    }
    
}

struct AddCardForm_Previews: PreviewProvider {
    static var previews: some View {
        AddCardForm()
    }
}
