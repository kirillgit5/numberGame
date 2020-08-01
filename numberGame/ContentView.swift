//
//  ContentView.swift
//  numberGame
//
//  Created by Кирилл Крамар on 31.07.2020.
//  Copyright © 2020 Кирилл Крамар. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    // MARK : State Property
    @State private var targetNumber = Int.random(in: 0...100)
    @State private var currentValue = Double.random(in: 20...80)
    @State private var representResultAlert = false
    
    var body: some View {
        VStack(spacing: 15) {
            InfoText(number: targetNumber)
            HStack {
                RangeText(number: 0)
                ColorUISlider(currentNumber: $currentValue,
                              targetNumber: targetNumber)
                RangeText(number: 100)
            }
            Button(action: { self.representResultAlert = true } ) {
                Text("Проверить результат!")
            }
            .alert(isPresented: $representResultAlert) {
                Alert(title: Text("Ваш результат :"),
                      message: Text("\(computeScore())"),
                      dismissButton: .default(Text("OK")))
            }
            Button(action: { self.changeNumber() }) {
                Text("Начать заново!")
            }
            
        }
    }
    
    // MARK : Private Methods
    private func changeNumber() {
        targetNumber = Int.random(in: 0...100)
        currentValue = Double.random(in: 20...100)
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetNumber - lround(currentValue))
        return 100 - difference
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

