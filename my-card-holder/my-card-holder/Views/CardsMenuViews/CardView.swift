//
//  CardView.swift
//  my-card-holder
//
//  Created by Ronnie Li on 12/2/19.
//  Copyright © 2019 Ronnie Li. All rights reserved.
//

import SwiftUI

struct CardView: View {
    @Binding var cards: [String]
    @State var imageUrl: String
    @State var showAlert: Bool = false
    
    var body: some View {
        VStack(alignment: .center) {
            Image("\(imageUrl)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 428, height: 270)
                .clipped()
                .cornerRadius(12)
            Button(action: {
                self.showAlert.toggle()
            }) {
                Text("Remove")
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Color(red: 1.0, green: 0.3, blue: 0, opacity: 0.6))
                    .cornerRadius(12)
            }.padding(.bottom, 30)
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Are you sure?"), message: Text("Delete operation is inreversible."),primaryButton: .destructive(Text("Delete")){
                self.removeCard(name: self.imageUrl)
                print(self.$imageUrl)
                }, secondaryButton: .default(Text("Cancel")))
        }
    }
    
    func removeCard(name: String) {
        for (index, card) in cards.enumerated() {
            if card == name {
                cards.remove(at: index)
            }
        }
    }
        
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(cards: .constant(["hkid"]), imageUrl: "hkid")
    }
}
