//
//  HostingController.swift
//  SpacedApp
//
//  Created by Anderson on 06/06/20.
//  Copyright © 2020 Anderson Lentz. All rights reserved.
//

import SwiftUI

class HostingController<ContentView> : UIHostingController<ContentView> where ContentView : View {
    override dynamic open var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
}
