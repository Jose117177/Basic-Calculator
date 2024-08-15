import SwiftUI

struct NumberPadView: View {

    let rows = [
        ["7", "8", "9", "→"],
        ["4", "5", "6", "="],
        ["1", "2", "2", "⌫"],
        ["⤓", "0", "/", "C/A"]
    ]
    
    var onButtonTap: (String) -> Void
    @Binding var focusedField: ContentView.Field?
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(rows, id: \.self) { row in
                HStack(spacing: 0) {
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
