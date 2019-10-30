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

class NormalItemStrategy : ItemStrategy {
    func updateQuality(item: Item) {
        if item.quality > 0 {
            switch item.sellIn {
            case Int.min...0: item.quality -= 2
            default:  item.quality -= 1
            }
        }
    }
    
    func updateSellIn(item: Item) {
        item.sellIn -= 1
    }
}

class BrieItemStrategy : ItemStrategy {
    func updateQuality(item: Item) {
        if item.quality < 50 {
             item.quality += 1
        }
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
        if item.quality < 50 {
            switch item.sellIn {
            case Int.min...0: item.quality = 0
            case 0..<6: item.quality += 3
            case 6..<11: item.quality += 2
            default: item.quality += 1
            }
        }
    }
    
    func updateSellIn(item: Item) {
        item.sellIn -= 1
    }
}

