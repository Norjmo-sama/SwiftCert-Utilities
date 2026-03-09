//
//  ColorPicker.swift
//  SwiftCert-Utilities
//
//  Created by Molly Norman on 3/9/26.
//

import SwiftUI

struct ColorPicker: View {
    @State var redIsOn = true
    @State var greenIsOn = true
    @State var blueIsOn = true
    
    @State var redAmount = 255.0
    @State var greenAmount = 255.0
    @State var blueAmount = 255.0
    var body: some View {
        VStack (spacing:40){
            Rectangle()
                .foregroundStyle(Color(red: redIsOn ? redAmount: 0, green: greenIsOn ? greenAmount: 0, blue: blueIsOn ? blueAmount: 0))
                .border(.black, width: 3)
                .shadow(radius: 10)
                .frame(height: 200)
                
            HStack {
                Toggle(isOn: $redIsOn, label: { Text("Turn on Red")
                }).labelsHidden()
                    .tint(.red)
                
                Slider(value: $redAmount, in: 0...1)
                    .tint(redIsOn ? .red: .black)
            }
            HStack {
                Toggle(isOn: $greenIsOn, label: { Text("Turn on Green")
                }).labelsHidden()
                    .tint(.green)
                
                Slider(value: $greenAmount, in: 0...1)
                    .tint(greenIsOn ? .green: .black)
            }
            
            HStack {
                Toggle(isOn: $blueIsOn, label: { Text("Turn on Blue")
                }).labelsHidden()
                    .tint(.blue)
                
                Slider(value: $blueAmount, in: 0...1)
                    .tint(blueIsOn ? .blue: .black)
            }
            Spacer()
            
            Button(action: {
                redAmount = 1
                greenAmount = 1
                blueAmount = 1
                redIsOn = true
                greenIsOn = true
                blueIsOn = true
            }, label: {
                Text("Reset")
                    .frame(maxWidth: .infinity)
            })
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    ColorPicker()
}
