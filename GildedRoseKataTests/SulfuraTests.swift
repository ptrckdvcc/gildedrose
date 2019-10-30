//
//  AllItemsTests.swift
//  GildedRoseKataTests
//
//  Created by Patrick Diviacco on 29/10/2019.
//  Copyright © 2019 Patrick. All rights reserved.
//

import Foundation

import XCTest
@testable import GildedRoseKata

class SulfuraItemsTests : XCTestCase {
    
    func testUpdateSellInNotChanging() {
        let input = Item(name: Names.sulfuras.rawValue, sellIn: 5, quality: 80)
        let sut = GildedRose(items: [input])
        sut.updateQuality()
        XCTAssertEqual(sut.items.first!.sellIn, 5, "SellIn should not change")
    }
    
    func testUpdateSellInDecreasingAfterNiterations() {
        let input = Item(name: Names.sulfuras.rawValue, sellIn: 2, quality: 80)
  
        let sut = GildedRose(items: [input])
        for _ in 0..<4 { sut.updateQuality() }
        
        XCTAssertEqual(sut.items.first!.sellIn, 2, "SellIn should not change")
    }
    
    func testUpdateQualityIsAlways80() {
        let input = Item(name: Names.sulfuras.rawValue, sellIn: 14, quality: 80)
        let sut = GildedRose(items: [input])
        sut.updateQuality()
        XCTAssertEqual(sut.items.first!.quality, 80, "Quality should always be 80")
    }
}
