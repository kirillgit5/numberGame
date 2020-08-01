//
//  ColorUISlider.swift
//  numberGame
//
//  Created by Кирилл Крамар on 31.07.2020.
//  Copyright © 2020 Кирилл Крамар. All rights reserved.
//

import SwiftUI

struct ColorUISlider: UIViewRepresentable {
    
    //MARK : Binding Property
    @Binding var currentNumber: Double
    
    // MARK : Public Property
    var targetNumber: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.maximumValue = 100
        slider.minimumValue = 0
        slider.thumbTintColor = .blue
        slider.value = Float(currentNumber)
        slider.alpha = computeAlpha()
        slider.addTarget(context.coordinator,
                         action: #selector(context.coordinator.currentNumberChange),
                         for: .valueChanged)
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(currentNumber)
        uiView.alpha = computeAlpha()
    }
    
    func makeCoordinator() -> ColorUISlider.Coordinator {
        Coordinator(currentNumber: $currentNumber)
    }
    
    private func computeAlpha() ->  CGFloat {
        let difference = abs(Double(targetNumber) - currentNumber)/100
        return CGFloat(1.0 - difference)
    }
    
}

extension ColorUISlider {
    class Coordinator: NSObject {
        @Binding var currentNumber: Double
        
        init(currentNumber: Binding<Double>) {
            self._currentNumber = currentNumber
        }
        
        @objc func currentNumberChange(sender: UISlider) {
            currentNumber = Double(sender.value)
        }
    }
}



struct ColorUISlider_Previews: PreviewProvider {
    static var previews: some View {
        ColorUISlider(currentNumber: .constant(7), targetNumber: 100)
    }
}
