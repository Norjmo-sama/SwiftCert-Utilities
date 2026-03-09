//
//  ColorPicker.swift
//  SwiftCert-Utilities
//
//  Created by Molly Norman on 3/9/26.
//

import SwiftUI

enum RGBColor {
    case superColor1(red: Double, green: Double, blue: Double)
}

extension RGBColor {
    
    var red: Double {
        switch self {
        case .superColor1(let r, _, _):
            return r
        }
    }

    var green: Double {
        switch self {
        case .superColor1(_, let g, _):
            return g
        }
    }

    var blue: Double {
        switch self {
        case .superColor1(_, _, let b):
            return b
        }
    }
}

struct ColorPicker: View {

    @State var redIsOn = true
    @State var greenIsOn = true
    @State var blueIsOn = true
    
    @State var superColor2: RGBColor

    init() {
        _superColor2 = State(initialValue: RGBColor.superColor1(red: 1.0, green: 1.0, blue: 1.0))
    }

    @State var redAmount = 1.0
    @State var greenAmount = 1.0
    @State var blueAmount = 1.0

    @State var hexidecimal = "ffffff"
    func updateColor() {
        superColor2 = .superColor1(
            red: redAmount,
            green: greenAmount,
            blue: blueAmount
        )
        hexidecimal = hexString(r: superColor2.red, g: superColor2.green, b: superColor2.blue)
    }
    
    func hexString(r: Double, g: Double, b: Double) -> String {
        print(r,g,b)
        let r2: Int = Int(r*255)
        let g2: Int = Int(g*255)
        let b2: Int = Int(b*255)
        print (String(format: "#%02x%02x%02x", r2, g2, b2))
        return (String(format: "#%02x%02x%02x", r2, g2, b2))
    }
    
    var body: some View {
        VStack (spacing:40){
            Rectangle()
                .foregroundStyle(
                    Color(
                        red: superColor2.red,
                        green: superColor2.green,
                        blue: superColor2.blue
                    )
                )
                .border(.black, width: 3)
                .shadow(radius: 10)
                .frame(height: 200)
                
            HStack {
                Slider(value: $redAmount, in: 0...1)
                    .tint(redIsOn ? .red: .black)

                    .onChange(of: redAmount) {
                        updateColor()
                    }
            }
            HStack {
                
                Slider(value: $greenAmount, in: 0...1)
                    .tint(greenIsOn ? .green: .black)
                    .onChange(of: greenAmount) {
                        updateColor()
                    }
            }
            
            HStack {
                
                Slider(value: $blueAmount, in: 0...1)
                    .tint(blueIsOn ? .blue: .black)
                    .onChange(of: blueAmount) {
                        updateColor()
                    }
            }
            HStack {
                Text("RGB: \(Int(redAmount*255)), \(Int(greenAmount*255)), \(Int(blueAmount*255))")
                    .onTapGesture {
                        UIPasteboard.general.string = "RGB: \(Int(redAmount*255)), \(Int(greenAmount*255)), \(Int(blueAmount*255))"                    }


            }
            Text(hexidecimal)
                .onTapGesture {
                    UIPasteboard.general.string = hexString(r: redAmount, g: greenAmount, b: blueAmount)
                }
            Spacer()
            Button {
                hexString(r: redAmount, g: greenAmount, b: blueAmount)
            } label: {
                Text("Press Me")
            }

            Button(action: {
                redAmount = 1.0
                greenAmount = 1.0
                blueAmount = 1.0
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
