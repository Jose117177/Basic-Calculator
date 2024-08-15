//
//  ButtonSpaceView.swift
//  Basic Calculator
//
//  Created by Zach Gorino on 8/4/24.
//

import SwiftUI

struct ButtonSpaceView: View {

    let rows = [
        ["C/A","⤒", "="],
    ]
    
    var onButtonTap: (String) -> Void
    @Binding var focusedField: ContentView.Field?
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(rows, id: \.self) { row in
                HStack(spacing: 10) {
                    ForEach(row, id: \.self) { button in
                        Button(action: {
                            self.onButtonTap(button)
                        })
                        {
                            Text(button)
                                .font(.title)
                                .frame(width: 80, height: 60)
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(45)
                                .padding(5)
                        }
                    }
                }
            }
        }
        .padding(-5)
        .background(Color.white)
        .foregroundColor(Color.white)
    }
}

