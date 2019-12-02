//
//  TitleAndImageView.swift
//  my-card-holder
//
//  Created by Ronnie Li on 12/2/19.
//  Copyright © 2019 Ronnie Li. All rights reserved.
//

import SwiftUI

struct TitleAndImageView: View {
    @State private var search = String()
    @Binding var isLocked: Bool
    
    var body: some View {
        HStack {
            
            VStack(alignment: .leading) {
                Text("Digital")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                
                Text("Everything safe.")
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)
            }
            
            Spacer()
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.secondary)
                    .padding(.leading, 6)
                
                TextField("Search Card Type", text: $search)
            }
            .padding(6)
            .background(Color.secondary.opacity(0.3))
            .cornerRadius(12)
            .frame(width: 400)
            Spacer()
            
            Button(action: {self.isLocked = true}){
                if self.isLocked{
                    Image(systemName: "lock")
                        .font(.system(size: 40))
                        .foregroundColor(Color.white)
                } else {
                    Image(systemName: "lock.open")
                        .font(.system(size: 40))
                        .foregroundColor(Color.white)
                }
            }
        }
        .padding([.horizontal, .bottom], 40)
    }
}

struct TitleAndImageView_Previews: PreviewProvider {
    static var previews: some View {
        TitleAndImageView(isLocked: .constant(false))
    }
}
