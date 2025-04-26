//
//  diceroller.swift
//  diceroller
//
//  Created by student on 4/26/25.
//

import SwiftUI

struct diceroller: View {
   
    @State var numberofPips : Int = 1
    
    var body: some View {
        VStack {
            Image(systemName: "die.face.\(numberofPips)")
                .resizable()
                .frame(maxWidth: 100 , maxHeight: 100)
                .aspectRatio(1, contentMode: .fit)
            
            Button("roll") {
                numberofPips = Int.random(in: 1...6)
            }
            .frame(maxWidth: 90 , maxHeight: 20)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .bold()
            .cornerRadius(10)
            .aspectRatio(1, contentMode: .fit)
        }
        
      
    }
}

#Preview {
    diceroller()
}
