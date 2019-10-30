//
//  ItemStrategy.swift
//  GildedRoseKata
//
//  Created by Patrick Diviacco on 30/10/2019.
//  Copyright © 2019 Patrick. All rights reserved.
//

import Foundation

protocol ItemStrategy {
    func update(item: Item)
}

extension ItemStrategy {
    func adjustQualityLowerBound(item: Item) {
        if item.quality < 0 {
            item.quality = 0
        }
    }
    
    func adjustQualityUpperBound(item: Item) {
        if item.quality > 50 {
            item.quality = 50
        }
    }
    
    func updateSellIn(item: Item) {
        item.sellIn -= 1
    }
}

class NormalItemStrategy : ItemStrategy {
    func update(item: Item) {
        switch item.sellIn {
        case Int.min...0: item.quality -= 2
        default: item.quality -= 1
        }
        adjustQualityLowerBound(item: item)
        updateSellIn(item: item)
    }
}

class BrieItemStrategy : ItemStrategy {
    func update(item: Item) {
        item.quality += 1
        adjustQualityUpperBound(item: item)
        updateSellIn(item: item)
    }
}

class SulfurasItemStrategy : ItemStrategy {
    func update(item: Item) {}
}

class BackstageItemStrategy : ItemStrategy {
    func update(item: Item) {
        switch item.sellIn {
        case Int.min...0: item.quality = 0
        case 0..<6: item.quality += 3
        case 6..<11: item.quality += 2
        default: item.quality += 1
        }
        adjustQualityLowerBound(item: item)
        adjustQualityUpperBound(item: item)
        updateSellIn(item: item)
    }
}

class ConjuredItemStrategy : ItemStrategy {
    func update(item: Item) {
        switch item.sellIn {
        case Int.min...0: item.quality -= 4
        default: item.quality -= 2
        }
        adjustQualityLowerBound(item: item)
        updateSellIn(item: item)
    }
}
