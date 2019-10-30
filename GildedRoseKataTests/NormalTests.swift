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

class NormalItemsTests : XCTestCase {

    func testUpdateSellInDecreasing() {
        let input = Item(name: Names.normal1.rawValue, sellIn: 5, quality: 7)
        let sut = GildedRose(items: [input])
        sut.updateQuality()
        XCTAssertEqual(sut.items.first!.sellIn, 4, "SellIn should be decreased by 1")
    }
     
    func testUpdateSellInDecreasingAfterNiterations() {
        let input = Item(name: Names.normal1.rawValue, sellIn: 2, quality: 7)
        let iterations = 4
        let expectedSellIn = input.sellIn - iterations
        
        let sut = GildedRose(items: [input])
        for _ in 0..<iterations { sut.updateQuality() }
        
        XCTAssertEqual(sut.items.first!.sellIn, expectedSellIn, "SellIn should be decreased by 1 each iteration")
    }
    
    func testUpdateQualityDecreasingBy1NearSellDate() {
        let input = Item(name: Names.normal2.rawValue, sellIn: 1, quality: 7)
        let sut = GildedRose(items: [input])
        sut.updateQuality()
        XCTAssertEqual(sut.items.first!.quality, 6, "Quality should be decreased by 1")
    }
    
    func testUpdateQualityDecreasingBy2AtSellDate() {
        let input = Item(name: Names.normal1.rawValue, sellIn: 0, quality: 7)
        let sut = GildedRose(items: [input])
        sut.updateQuality()
        XCTAssertEqual(sut.items.first!.quality, 5, "Quality should be decreased by 1")
    }
    
    func testUpdateQualityDecreasingBy2AfterSellDate() {
        let input = Item(name: Names.normal2.rawValue, sellIn: -3, quality: 7)
        let sut = GildedRose(items: [input])
        sut.updateQuality()
        XCTAssertEqual(sut.items.first!.quality, 5, "Quality should be decreased by 1")
    }
}
