//
//  ContentView.swift
//  diceroller
//
//  Created by student on 4/26/25.
//

import SwiftUI

struct ContentView: View {
    

    @State var numberOfDice: Int = 1
        
    var body: some View {
       // switching stack vertically
        VStack {
            //displaying for txt on the screen
            Text("dice game.")
                .font(.largeTitle)
                .bold()
            Text("you have \(numberOfDice) dice")
                .font(.headline)
                .padding(.bottom)
        
            // switching stack  horizontal
            HStack {
                ForEach(1...numberOfDice, id:\.description){ _ in
                    diceroller()
                }
            }
            HStack {
                withAnimation {
                    Button("add dice",systemImage: "plus.circle.fill") {
                        numberOfDice += 1
                    }
                }
                .disabled(numberOfDice == 5)
                .padding()
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                withAnimation{
                    Button("remove dice",systemImage: "minus.circle.fill") {
                        numberOfDice -= 1
                    }
                }
                .disabled(numberOfDice == 1)
                .padding()
                .background(Color.gray)
                .foregroundColor(.white)
                .cornerRadius(10)
            
                
            }
           
        }
        .padding()
        .frame(maxWidth: .infinity , maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}
