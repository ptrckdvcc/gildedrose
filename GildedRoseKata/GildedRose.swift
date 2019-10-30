//
//  GildedRose.swift
//  GildedRoseKata
//
//  Created by Patrick Diviacco on 29/10/2019.
//  Copyright © 2019 Patrick. All rights reserved.
//

public class GildedRose {
    var items:[Item]
    
    required public init(items:[Item]) {
        self.items = items
    }
    
    public func updateQuality() {
        for item in items {
            guard let strategy = ItemStrategyFactory.strategyFor(item: item) else { continue }
            strategy.updateQuality(item: item)
            strategy.updateSellIn(item: item)
        }
     }
}
