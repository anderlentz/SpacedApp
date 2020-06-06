//
//  Profile.swift
//  SpacedApp
//
//  Created by Anderson on 01/05/20.
//  Copyright © 2020 Anderson Lentz. All rights reserved.
//

import SwiftUI

struct Profile: View {
    
    let image: String
    let style: Style
    
    public init(image: String, style: Style) {
        self.image = image
        self.style = style
    }
    
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: CGFloat(style.width), height: CGFloat(style.height))
            .clipShape(Circle())
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile(image: "kal-loftus-unsplash", style: .small)
    }
}

extension Profile {
    public struct Style {
        let width: Double
        let height: Double
        
        private init(width: Double, height: Double) {
            self.width = width
            self.height = height
        }
    }
}

extension Profile.Style {
    static let small = Self(width: 40, height: 40)
}
