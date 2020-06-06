//
//  Notification.swift
//  SpacedApp
//
//  Created by Anderson on 01/05/20.
//  Copyright © 2020 Anderson Lentz. All rights reserved.
//

import SwiftUI

struct Notification: View {
    var body: some View {
        VStack(spacing: 16) {
            ZStack(alignment: .trailing) {

                RoundedRectangle(cornerRadius: 32)
                    .frame(height: 20.0, alignment: .trailing)
                
                
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.white)
                    .frame(width: 50.0, alignment: .trailing)

                
                Color(.red)
                
                .clipShape(Circle())
                .frame(width: 30.0, height: 30.0, alignment: .trailing)
                
            }
            
            RoundedRectangle(cornerRadius: 32)
                 .frame(height: 20.0)
            RoundedRectangle(cornerRadius: 32)
                 .frame(height: 20.0)
        }
        .frame(width: 200.0, height: 30.0)
        .padding()
        
    }
}

struct Notification_Previews: PreviewProvider {
    static var previews: some View {
        Notification()
    }
}
