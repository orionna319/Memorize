//
//  ContentView.swift
//  Memorize
//
//  Created by orion on 2024/2/3.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["👻","🎃","🕷️","👿","🤡","💀","😸"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            cards
            cardCountAdjuesters
        }
        .padding()
    }
    
    var cards: some View {
        HStack {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index], isFaceUp: true)
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardCountAdjuesters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuesters(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: "rectangle.stack.fill.badge.minus")
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuesters(by: -1, symbol: "rectangle.stack.fill.badge.minus")
    }
    
    var cardAdder: some View {
        cardCountAdjuesters(by: +1, symbol: "rectangle.stack.fill.badge.plus")
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base
                    .fill(.white)
                base
                    .strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            } else {
                base
                    .fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
            print("tapped")
        }
    }
}

#Preview {
    ContentView()
}
