//
//  Seeds.swift
//  GildedRoseKataTests
//
//  Created by Patrick Diviacco on 29/10/2019.
//  Copyright © 2019 Patrick. All rights reserved.
//

import Foundation
@testable import GildedRoseKata

enum Names : String {
    case normal1 = "+5 Dexterity Vest"
    case normal2 = "Elixir of the Mongoose"
    case brie = "Aged Brie"
    case sulfuras = "Sulfuras, Hand of Ragnaros"
    case backstage = "Backstage passes to a TAFKAL80ETC concert"
    case conjured = "Conjured Mana Cake"
}

struct Seeds {
    static var allItems = normalItems +
                        brie +
                        sulfuras +
                        backstage +
                        conjured
    
    static let normalItems = [
        Item(name: Names.normal1.rawValue, sellIn: 10, quality: 20),
        Item(name: Names.normal2.rawValue, sellIn: 5, quality: 7),
    ]
    
    static let brie = [
        Item(name: Names.brie.rawValue, sellIn: 2, quality: 0)
    ]
    
    static let sulfuras = [
        Item(name: Names.sulfuras.rawValue, sellIn: 0, quality: 80),
        Item(name: Names.sulfuras.rawValue, sellIn: -1, quality: 80)
    ]
    
    static let backstage = [
        Item(name: Names.backstage.rawValue, sellIn: 15, quality: 20),
        Item(name: Names.backstage.rawValue, sellIn: 10, quality: 49),
        Item(name: Names.backstage.rawValue, sellIn: 5, quality: 49),
    ]
    
    static let conjured = [
        Item(name: Names.conjured.rawValue, sellIn: 3, quality: 6)
    ]
    
    static let itemsWithQualityEqual1 = [
        Item(name: Names.normal1.rawValue, sellIn: 10, quality: 1),
        Item(name: Names.normal2.rawValue, sellIn: 5, quality: 1),
        Item(name: Names.backstage.rawValue, sellIn: 15, quality: 1),
        Item(name: Names.brie.rawValue, sellIn: 2, quality: 1),
        Item(name: Names.conjured.rawValue, sellIn: 3, quality: 1)
    ]
    
    static let itemsWithQualityEqual0 = [
        Item(name: Names.normal1.rawValue, sellIn: 10, quality: 0),
        Item(name: Names.normal2.rawValue, sellIn: 5, quality: 0),
        Item(name: Names.backstage.rawValue, sellIn: 15, quality: 0),
        Item(name: Names.brie.rawValue, sellIn: 2, quality: 0),
        Item(name: Names.conjured.rawValue, sellIn: 3, quality: 0)
    ]
    
    static let invalidItems = [
        Item(name: Names.normal1.rawValue, sellIn: 10, quality: -300),
        Item(name: Names.backstage.rawValue, sellIn: 150, quality: -10),
        Item(name: Names.brie.rawValue, sellIn: 2, quality: -12),
        Item(name: Names.conjured.rawValue, sellIn: 2314, quality: -16),
        Item(name: Names.sulfuras.rawValue, sellIn: -123, quality: 20),
        Item(name: Names.sulfuras.rawValue, sellIn: -9999, quality: -12),
        Item(name: Names.normal1.rawValue, sellIn: 100, quality: 120),
        Item(name: Names.backstage.rawValue, sellIn: 15, quality: 900),
        Item(name: Names.brie.rawValue, sellIn: 20, quality: 67),
        Item(name: Names.conjured.rawValue, sellIn: 3, quality: 1023),
        Item(name: Names.sulfuras.rawValue, sellIn: -1, quality: 100)
    ]
}

