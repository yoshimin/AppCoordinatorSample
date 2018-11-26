//
//  Item.swift
//  AppCoordinatorSample
//
//  Created by Yoshimi Shingai on 2018/11/25.
//  Copyright © 2018 SHINGAI YOSHIMI. All rights reserved.
//

import UIKit

enum Item: String, CaseIterable, Codable {
    case watch = "時計"
    case smartphoneCase = "iPhoneケース"
    case knitHat = "ニット帽"
    case stole = "ストール"
    case slipper = "スリッパ"
    case sneakers = "スニーカー"

    var url: String {
        switch self {
        case .watch:
            return "http://www.hmr.jp/shop/g/gNY91AW02626-"
        case .smartphoneCase:
            return "http://www.hmr.jp/shop/g/gNY83AU92426-"
        case .knitHat:
            return "http://www.hmr.jp/shop/g/gNY83AA60724F"
        case .stole:
            return "http://www.hmr.jp/shop/g/gNY83AD01006-"
        case .slipper:
            return "http://www.hmr.jp/shop/g/gNY83AZ68426F"
        case .sneakers:
            return "http://www.hmr.jp/shop/g/gNY91AJ4192615"
        }
    }
}
