//
//  RangeText.swift
//  numberGame
//
//  Created by Кирилл Крамар on 31.07.2020.
//  Copyright © 2020 Кирилл Крамар. All rights reserved.
//

import SwiftUI

struct RangeText: View {
    var number: Int
    var body: some View {
        Text("\(number)")
        .frame(width: 30, height: 10)
    }
}

struct RangeText_Previews: PreviewProvider {
    static var previews: some View {
        RangeText(number: 12)
    }
}
