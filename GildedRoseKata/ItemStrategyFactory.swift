//
//  ItemStrategyFactory.swift
//  GildedRoseKata
//
//  Created by Patrick Diviacco on 30/10/2019.
//  Copyright © 2019 Patrick. All rights reserved.
//

import Foundation

class ItemStrategyFactory {
    
    enum Names : String {
        case brie = "Aged Brie"
        case sulfuras = "Sulfuras, Hand of Ragnaros"
        case backstage = "Backstage passes to a TAFKAL80ETC concert"
        case conjured = "Conjured Mana Cake"
    }
    
    func strategyFor(item: Item) -> ItemStrategy {
        if let name = Names(rawValue: item.name) {
            switch name {
            case .brie: return BrieItemStrategy()
            case .sulfuras: return SulfurasItemStrategy()
            case .backstage: return BackstageItemStrategy()
            case .conjured: ()
            }
        }
        return NormalItemStrategy()
    }
}
