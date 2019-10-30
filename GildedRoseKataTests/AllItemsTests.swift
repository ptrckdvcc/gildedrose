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

class AllItemsTests: XCTestCase {
 
    func testUpdateEmptyArray() {
        let input:[Item] = []
        let sut = GildedRose(items: input)
        sut.updateQuality()
        XCTAssertEqual(sut.items.count, 0, "Items array should be empty")
    }

    func testUpdateQualityMoreOrEqualTo0() throws {
        let input = Seeds.allItems
        let sut = GildedRose(items: input)
        sut.updateQuality()
        XCTAssertGreaterThanOrEqual(sut.items.first!.quality, 0, "Quality should be >= 0")
    }
        
    func testUpdateQualityNearMin() {
        let input = Seeds.itemsWithQualityEqual1
        let sut = GildedRose(items: input)
        sut.updateQuality()
        XCTAssertEqual(sut.items.first!.quality, 0, "Quality should be 0")
    }
    
    func testUpdateQualityAtMin() {
        let input = Seeds.itemsWithQualityEqual0
        let sut = GildedRose(items: input)
        sut.updateQuality()
        XCTAssertEqual(sut.items.first!.quality, 0, "Quality should be 0")
    }
}
