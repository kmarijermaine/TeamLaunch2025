//
//  WantedPosterView.swift
//  Wanted
//
//  Created by student on 5/3/25.
//

import SwiftUI

extension ShapeStyle where Self == Color {
    static var darkBrown: Color {
        Color(red: 0.3, green: 0.2, blue: 0.1)
    }
}

struct WantedPosterView: View {
    var image: Image?
    var crime: String
    var reward: String
    var contact: String
    var paperOpacity: Double
    
    var body: some View {
        ZStack {
            Color.white
            Image(.paper)
                .resizable()
                .frame(minWidth: .zero, maxWidth: .infinity, minHeight: .zero, maxHeight: .infinity)
                .opacity(paperOpacity)
            VStack(spacing: 0) {
                Text("WANTED")
                    .font(.custom("Superclarendon", size: 60))
                    .fontWeight(.black)
                    .tracking(5)
                    .foregroundStyle(.darkBrown)
                    .padding(.bottom, -10)
                
                Text("DEAD OR ALIVE")
                    .font(.custom("Copperplate", size:24))
                    .bold()
                    .tracking(2)
                    .foregroundStyle(.darkBrown)
                
                image?
                    .resizable()
                    .scaledToFit()
                    .frame(width: 270, height: 270 )
                    .clipShape(.circle)
                    .grayscale(1)
                    .blendMode(.multiply)
                    .overlay{
                        Circle()
                            .strokeBorder(.darkBrown, lineWidth: 8)
                    }
                    .padding(.vertical)
                
                Text("For \(crime)")
                    .font(.custom("Copperplate", size: 22))
                    .multilineTextAlignment(.center)
                    .bold()
                    .tracking(1)
                    .foregroundStyle(.darkBrown)
                
                Spacer()
                
                Text("REWARD")
                    .font(.custom("Copperplate", size: 30))
                    .tracking(3)
                    .bold()
                    .foregroundStyle(.darkBrown)
                Text(reward)
                    .font(.custom("Copperplate", size: 44))
                    .bold()
                    .tracking(2)
                    .foregroundStyle(.darkBrown)
                Spacer()
                
                Text(contact)
            }
        }
        .frame(width: 420, height: 594)
        .shadow(color: .white, radius: 3)
        .padding(.horizontal)
    }
}

#Preview {
    WantedPosterView(crime: "Bank Robbery", reward: "$1000", contact:"Call 1-800-GOTCHA", paperOpacity: 0.75)
}
