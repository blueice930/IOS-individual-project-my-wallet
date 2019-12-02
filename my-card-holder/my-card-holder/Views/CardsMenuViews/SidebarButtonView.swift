//
//  SidebarButtonView.swift
//  my-card-holder
//
//  Created by Ronnie Li on 12/2/19.
//  Copyright © 2019 Ronnie Li. All rights reserved.
//

import SwiftUI

struct SidebarButtonView: View {
    @State var showAddCardForm: Bool = false
    @State var showCardReader: Bool = false
    @State var showCardDetail: Bool = false
    
    
    var body: some View {
        VStack {
            Spacer()
            
            Button(action: {
                self.showCardDetail.toggle()
            }) {
                Image(systemName: "rectangle.on.rectangle.angled")
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
            }.sheet(isPresented: $showCardDetail, content: {CardListView()})
            
            Spacer()
            
            Button(action: {
                self.showAddCardForm.toggle()
            }) {
                Image(systemName: "plus.circle")
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
            }.sheet(isPresented: $showAddCardForm, content: {AddCardForm()})
            
            Spacer()
            
            Button(action: {
                self.showCardReader.toggle()
            }) {
                Image(systemName: "doc.text.viewfinder")
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
            }.sheet(isPresented: $showCardReader, content: {CardScanIntegratedViewController()})
            
            Spacer()
        }.padding(.horizontal, 44)
    }
}

struct SidebarButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarButtonView()
    }
}
