//
//  ItemStrategy.swift
//  GildedRoseKata
//
//  Created by Patrick Diviacco on 30/10/2019.
//  Copyright © 2019 Patrick. All rights reserved.
//

import Foundation

protocol ItemStrategy {
    func updateQuality(item: Item)
    func updateSellIn(item: Item)
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
}

class NormalItemStrategy : ItemStrategy {
    func updateQuality(item: Item) {
        switch item.sellIn {
        case Int.min...0: item.quality -= 2
        default: item.quality -= 1
        }
        adjustQualityLowerBound(item: item)
    }
    
    func updateSellIn(item: Item) {
        item.sellIn -= 1
    }
}

class BrieItemStrategy : ItemStrategy {
    func updateQuality(item: Item) {
        item.quality += 1
        adjustQualityUpperBound(item: item)
    }
    
    func updateSellIn(item: Item) {
        item.sellIn -= 1
    }
}

class SulfurasItemStrategy : ItemStrategy {
    func updateQuality(item: Item) {}
    func updateSellIn(item: Item) {}
}

class BackstageItemStrategy : ItemStrategy {
    func updateQuality(item: Item) {
        switch item.sellIn {
        case Int.min...0: item.quality = 0
        case 0..<6: item.quality += 3
        case 6..<11: item.quality += 2
        default: item.quality += 1
        }
        adjustQualityLowerBound(item: item)
        adjustQualityUpperBound(item: item)
    }
    
    func updateSellIn(item: Item) {
        item.sellIn -= 1
    }
}

class ConjuredItemStrategy : ItemStrategy {
    func updateQuality(item: Item) {
        switch item.sellIn {
        case Int.min...0: item.quality -= 4
        default: item.quality -= 2
        }
        adjustQualityLowerBound(item: item)
    }
    
    func updateSellIn(item: Item) {
        item.sellIn -= 1
    }
}
