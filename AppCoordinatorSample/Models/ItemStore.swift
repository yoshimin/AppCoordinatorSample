//
//  ItemStore.swift
//  AppCoordinatorSample
//
//  Created by SHINGAI YOSHIMI on 2018/11/26.
//  Copyright © 2018 SHINGAI YOSHIMI. All rights reserved.
//

import Foundation
import DefaultsKit

extension DefaultsKey {
    static let items = Key<[Item]>("items")
}

struct ItemStore {
    static func items() -> [Item] {
        return Defaults.shared.get(for: .items) ?? []
    }

    static func addItem(_ item: Item) {
        var items = self.items()
        items.append(item)
        Defaults.shared.set(items, for: .items)
    }

    static func removeItem(at index: Int) {
        var items = self.items()
        items.remove(at: index)
        Defaults.shared.set(items, for: .items)
    }
}
