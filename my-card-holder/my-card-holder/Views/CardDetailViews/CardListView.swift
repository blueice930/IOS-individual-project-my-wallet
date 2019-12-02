//
//  CardListView.swift
//  my-card-holder
//
//  Created by Ronnie Li on 12/2/19.
//  Copyright © 2019 Ronnie Li. All rights reserved.
//

import SwiftUI

struct CardListView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: CardDetailView(cardType: "ID Card", cardUrl: "hkid", cardNum: "C668668(E)", expireDate: "")){
                    Text("hkid")
                }
                NavigationLink(destination: CardDetailView(cardType: "ID Card", cardUrl: "mailand", cardNum: "H12345678", expireDate: "2022 / 12")){
                    Text("mainland")
                }
                NavigationLink(destination: CardDetailView(cardType: "ID Card", cardUrl: "studentid", cardNum: "12345678", expireDate: "")){
                    Text("studentid")
                }
                NavigationLink(destination: CardDetailView(cardType: "Credit Card", cardUrl: "credit1", cardNum: "1234 5678 9123 4567", expireDate: "11 / 19")){
                    Text("credit1")
                }
                NavigationLink(destination: CardDetailView(cardType: "Credit Card", cardUrl: "credit2", cardNum: "1234 5678 9123 4567", expireDate: "11 / 19")){
                    Text("credit2")
                }
                NavigationLink(destination: CardDetailView(cardType: "Credit Card", cardUrl: "credit3", cardNum: "7253 3256 7895 1245", expireDate: "11 / 50")){
                    Text("credit3")
                }
                NavigationLink(destination: CardDetailView(cardType: "Debit Card", cardUrl: "debit1", cardNum: "0123 4567 8910 0000", expireDate: "")){
                    Text("debit1")
                }
                NavigationLink(destination: CardDetailView(cardType: "Octopus", cardUrl: "octopus", cardNum: "", expireDate: "")){
                    Text("octopus")
                }
            }
        }.navigationBarTitle(Text("Card List"))
    }
}

struct CardListView_Previews: PreviewProvider {
    static var previews: some View {
        CardListView()
    }
}
