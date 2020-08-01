//
//  InfoLabel.swift
//  numberGame
//
//  Created by Кирилл Крамар on 31.07.2020.
//  Copyright © 2020 Кирилл Крамар. All rights reserved.
//

import SwiftUI

struct InfoText: View {
    
    // MARK: Public Property
    var number: Int
    
    var body: some View {
        Text("Подвиньте слайдер, как можно ближе к: \(number)")
    }
}
struct InfoLabel_Previews: PreviewProvider {
    static var previews: some View {
        InfoText(number: 2)
    }
}
