//
//  AmongUsMiniGame.swift
//  TestSwiftUI
//
//  Created by Teacher on 04.05.2021.
//

import SwiftUI

struct AmongUsMiniGame: View {
    @State private var showingAlert = false
    @State var first: CGFloat = 50
    @State var second: CGFloat = 50
    @State var third: CGFloat = 50
    @State var fourth: CGFloat = 50
    
    let width = UIScreen.main.bounds.width - 100

    @State var firstRandom = CGFloat(Int.random(in: 1..<Int(UIScreen.main.bounds.width - 100)))
    @State var secondRandom = CGFloat(Int.random(in: 1..<Int(UIScreen.main.bounds.width - 100)))
    @State var thirdRandom = CGFloat(Int.random(in: 1..<Int(UIScreen.main.bounds.width - 100)))
    @State var fourthRandom = CGFloat(Int.random(in: 1..<Int(UIScreen.main.bounds.width - 100)))
    
    var body: some View {
        VStack {
            VStack {
                HStack(spacing: 0) {
                    AdditionalCustomView().frame(width: firstRandom, height: 50)
                    BackgroundCustomView().frame(width: width - firstRandom, height: 50)
                }
                HStack(spacing: 0) {
                    AdditionalCustomView().frame(width: secondRandom, height: 50)
                    BackgroundCustomView().frame(width: width - secondRandom, height: 50)
                }
                HStack(spacing: 0) {
                    AdditionalCustomView().frame(width: thirdRandom, height: 50)
                    BackgroundCustomView().frame(width: width - thirdRandom, height: 50)
                }
                HStack(spacing: 0) {
                    AdditionalCustomView().frame(width: fourthRandom, height: 50)
                    BackgroundCustomView().frame(width: width - fourthRandom, height: 50)
                }
            }
            
            Text("First slider value is \(Int(first))")
            Text("Second slider value is \(Int(second))")
            Text("Third slider value is \(Int(third))")
            Text("Fourth slider value is \(Int(fourth))")

            HStack {
                Text("0")
                Slider(value: $first, in: 0...100)
                    .frame(width: width)
                Text("100")
            }
            
            HStack {
                Text("0")
                Slider(value: $second, in: 0...100)
                    .frame(width: width)
                Text("100")
            }
            
            HStack {
                Text("0")
                Slider(value: $third, in: 0...100)
                    .frame(width: width)
                Text("100")
            }
            
            HStack {
                Text("0")
                Slider(value: $fourth, in: 0...100)
                    .frame(width: width)
                Text("100")
            }
            
            Button(action: {
                showingAlert = true
            }, label: {
                Text("Show Result").alert(isPresented: $showingAlert) {
                    Alert(title: Text("Result"), message: Text(calculateResult()), dismissButton: .default(Text("OK")))
                }
            })
        }
    }
    
    private func calculateResult() -> String {
        let deviationSum = abs(first - firstRandom*100/width) +
            abs(second - secondRandom*100/width) +
            abs(third - thirdRandom*100/width) +
            abs(fourth - fourthRandom*100/width)
        return "\(Int(100 - deviationSum/4))"
    }
}

struct AmongUsMiniGame_Previews: PreviewProvider {
    static var previews: some View {
        AmongUsMiniGame()
    }
}

struct BackgroundCustomView: View {
    var body: some View {
        GeometryReader { proxy in
            Rectangle()
                .fill(Color.gray)
        }
    }
}

struct AdditionalCustomView: View {
    var body: some View {
        GeometryReader { proxy in
            Rectangle()
                .fill(Color.yellow)
        }
    }
}
