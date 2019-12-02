//
//  CardsStackView.swift
//  my-card-holder
//
//  Created by Ronnie Li on 12/2/19.
//  Copyright © 2019 Ronnie Li. All rights reserved.
//

import SwiftUI

struct CardsStackView: View {
    @State var cards = ["hkid", "mainland", "studentid", "credit1","credit2","credit3","debit1","octopus"]
    
    var body: some View {
        ScrollView(.vertical) {
            ForEach(cards, id: \.self) { c in
                CardView(cards: self.$cards, imageUrl: c)
            }
            
        }
    }
}

struct CardsStackView_Previews: PreviewProvider {
    static var previews: some View {
        CardsStackView()
    }
}
