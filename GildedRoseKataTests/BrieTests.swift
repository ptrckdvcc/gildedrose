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

class BrieItemsTests : XCTestCase {
    
    func testUpdateSellInDecreasing() {
        let input = Item(name: Names.brie.rawValue, sellIn: 5, quality: 7)
        let sut = GildedRose(items: [input])
        sut.updateQuality()
        XCTAssertEqual(sut.items.first!.sellIn, 4, "SellIn should be decreased by 1")
    }
    
    func testUpdateQualityIncreasingBy1() {
        let input = Item(name: Names.brie.rawValue, sellIn: 5, quality: 7)
        let sut = GildedRose(items: [input])
        sut.updateQuality()
        XCTAssertEqual(sut.items.first!.quality, 8, "Quality should be increased by 1")
    }
    
    func testUpdateQualityNearMax() {
        let input = Item(name: Names.brie.rawValue, sellIn: 14, quality: 49)
        let sut = GildedRose(items: [input])
        sut.updateQuality()
        XCTAssertEqual(sut.items.first!.quality, 50, "Quality should be 50")
    }
    
    func testUpdateQualityAtMax() {
        let input = Item(name: Names.brie.rawValue, sellIn: 14, quality: 50)
        let sut = GildedRose(items: [input])
        sut.updateQuality()
        XCTAssertEqual(sut.items.first!.quality, 50, "Quality should not increase more than 50")
    }
}
