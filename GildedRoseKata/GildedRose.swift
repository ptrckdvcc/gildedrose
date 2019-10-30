//
//  GildedRose.swift
//  GildedRoseKata
//
//  Created by Patrick Diviacco on 29/10/2019.
//  Copyright © 2019 Patrick. All rights reserved.
//

public class GildedRose {
    var items:[Item]
    var strategyFactory:ItemStrategyFactory = ItemStrategyFactory()
    
    required public init(items:[Item]) {
        self.items = items
    }
    
    public func updateQuality() {
        for item in items {
            let strategy = strategyFactory.strategyFor(item: item)
            strategy.updateQuality(item: item)
            strategy.updateSellIn(item: item)
        }
     }
}
