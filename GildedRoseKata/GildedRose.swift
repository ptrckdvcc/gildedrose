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
    
    private func strategyFor(item: Item) -> ItemStrategy? {
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
    
    public func updateQuality() {
        for item in items {
            guard let strategy = strategyFor(item: item) else { continue }
            strategy.updateQuality(item: item)
            strategy.updateSellIn(item: item)
        }
     }
}
