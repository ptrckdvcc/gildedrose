//
//  GildedRose.swift
//  GildedRoseKata
//
//  Created by Patrick Diviacco on 29/10/2019.
//  Copyright © 2019 Patrick. All rights reserved.
//

enum Names : String {
    case brie = "Aged Brie"
    case sulfuras = "Sulfuras, Hand of Ragnaros"
    case backstage = "Backstage passes to a TAFKAL80ETC concert"
    case conjured = "Conjured Mana Cake"
}

public class GildedRose {
    var items:[Item]
    
    required public init(items:[Item]) {
        self.items = items
    }
    
    public func updateQuality() {
        for item in items {
            if item.name == Names.brie.rawValue {
                if item.quality < 50 {
                    item.quality += 1
                }
                item.sellIn -= 1
            } else if item.name == Names.sulfuras.rawValue {
              
            } else if item.name == Names.backstage.rawValue {
                if item.quality < 50 {
                    switch item.sellIn {
                    case Int.min...0: item.quality = 0
                    case 0..<6: item.quality += 3
                    case 6..<11: item.quality += 2
                    default: item.quality += 1
                    }
                }
                item.sellIn -= 1
            } else {
                //Normal items
                if item.quality > 0 {
                    switch item.sellIn {
                    case Int.min...0: item.quality -= 2
                    default:  item.quality -= 1
                    }
                }
                item.sellIn -= 1
            }
        }
     }
}
