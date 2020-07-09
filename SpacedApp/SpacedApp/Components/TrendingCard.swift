//
//  TrendingCard.swift
//  SpacedApp
//
//  Created by Anderson on 01/05/20.
//  Copyright © 2020 Anderson Lentz. All rights reserved.
//

import SwiftUI

struct TrendingCard: View {
    
    var trendingItem: TrendingItem
    var size: CGSize
    
    
    var body: some View {
        ZStack(alignment: .init(horizontal: .center, vertical: .bottom)) {
            Image(self.trendingItem.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: self.size.width, height: self.size.height)
                .overlay(LinearGradient(gradient:
                Gradient(
                    colors: [
                        Color(red: 19/255, green: 19/255, blue: 19/255, opacity: 0),
                        Color(red: 19/255, green: 19/255, blue: 19/255, opacity: 0.95)
                    ]),
                    startPoint: .center, endPoint: .bottom))
            
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing:  5) {
                        Image("VRIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20.0, height: 20.0, alignment: .center)
                        Text("VR")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.system(size: 16))
                    }
                    Text(self.trendingItem.title)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .font(.system(size: 24))
                    
                    Text(self.trendingItem.subtitle)
                        .foregroundColor(Color(red: 175/255, green: 182/255, blue: 193/255))
                        .fontWeight(.bold)
                        .font(.system(size: 12))
                    
                }
                
                Spacer()
                
                Button(action: {
                    print("Do something")
                }) {
                    HStack(spacing: 8) {
                        Image("Rocket")
                            .foregroundColor(.white)
                        Text(self.trendingItem.buttonTitle)
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                    .padding(10)
                    .frame(height: 40, alignment: .center)
                    
                }
                .background(Color(red: 1, green: 51/255, blue: 102/255))
                .cornerRadius(8)
            }
            .padding([.leading, .bottom, .trailing], 20)
        }
            .frame(width: self.size.width, height: self.size.height)
            .cornerRadius(8)
    }
}

struct TrendingCard_Previews: PreviewProvider {
    static var previews: some View {
        TrendingCard(trendingItem: .mock, size: CGSize(width: 300, height: 372))
    }
}
