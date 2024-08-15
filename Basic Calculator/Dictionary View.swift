//
//  Dictionary View.swift
//  Basic Calculator
//
//  Created by Zach Gorino on 8/7/24.
//

import SwiftUI

struct Dictionary_View: View {
    @Binding var focusedField: ContentView.Field?
    
    var body: some View {
        List {
            Text("Terms, Keywords, and Abreviations Used in this Program")
                .bold()
                .foregroundColor(.blue)
            Text("Cu(CU) = Cubic\nYd(YD) = Yard\nSq(SQ) = Square\nFt(FT) = Feet\nIn(IN) = Inch\nAvg(AVG) = Averagage\n")
                .bold()
                .foregroundColor(.blue)
        }

    }

}
