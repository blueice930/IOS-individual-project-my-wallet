//
//  ImagePickerView.swift
//  my-card-holder
//
//  Created by Ronnie Li on 12/2/19.
//  Copyright © 2019 Ronnie Li. All rights reserved.
//

import SwiftUI

struct ImagePickerView: View {
    @State var showPicker: Bool = false
    @State var pickerType: String = "camera"
    @State var image: Image? = nil
    
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            if image == nil {
                Button(action: {
                    self.showPicker.toggle()
                }) {
                    Image(systemName: "plus")
                        .foregroundColor(Color(hex: 0x484848))
                        .font(.system(size: 40))
                        .frame(width: 428, height: 270)
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color(hex: 0x484848), lineWidth: 2)
                    )
                }
            }
            image?
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 428, height: 270)
                .cornerRadius(12)
                .clipped()
            if image != nil {
                Button(action: {self.showPicker.toggle()}){
                    Image(systemName: "arrow.counterclockwise.circle")
                        .font(.system(size: 40))
                        .foregroundColor(Color.blue)
                }
            }
            
        }
        .sheet(isPresented: $showPicker) {
            if self.pickerType == "camera" {
                CameraPicker(image: self.$image)
            } else if self.pickerType == "image" {
                ImagePicker(image: self.$image)
            } else {
                Text("Error!")
            }
        }
        
    }
}

struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView()
    }
}
