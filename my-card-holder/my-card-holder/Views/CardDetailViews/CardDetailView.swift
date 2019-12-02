//
//  CardDetailView.swift
//  my-card-holder
//
//  Created by Ronnie Li on 12/2/19.
//  Copyright © 2019 Ronnie Li. All rights reserved.
//

import SwiftUI

struct CardDetailView: View {
    @State var cardType: String
    @State var cardUrl: String
    @State var cardNum: String?
    @State var expireDate: String?
    
    var body: some View {
        VStack {
            VStack {
                HStack{
                    Text("Card Type:")
                    Spacer()
                    Text("\(self.cardType)")
                }.padding(.horizontal, 40)
                HStack{
                    Text("Card Number:")
                    Spacer()
                    Text("\(self.cardNum!)")
                }.padding(.horizontal, 40)
                HStack {
                    Text("Expire Date:")
                    Spacer()
                    Text("\(self.expireDate!)")
                }.padding(.horizontal, 40)
                Text("Card Image:")
            }
            Image("\(cardUrl)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 428, height: 270)
                .cornerRadius(12)
                .clipped()
        }
    }
}

struct CardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailView(cardType: "Credit Card", cardUrl: "credit1")
    }
}
