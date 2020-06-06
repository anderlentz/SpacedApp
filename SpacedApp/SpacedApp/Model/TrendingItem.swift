//
//  TrendingItem.swift
//  SpacedApp
//
//  Created by Anderson on 03/06/20.
//  Copyright © 2020 Anderson Lentz. All rights reserved.
//

import Foundation

struct TrendingItem: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let subtitle: String
    let buttonTitle: String
}

extension TrendingItem {
    static let mock = TrendingItem(imageName: "roberto-nickson-g-549146-unsplash", title: "Ophiuchi", subtitle: "KADUNA", buttonTitle: "0.4 BTC")
}
