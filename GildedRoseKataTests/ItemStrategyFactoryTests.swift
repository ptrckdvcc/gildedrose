//
//  ItemStrategyFactoryTests.swift
//  GildedRoseKataTests
//
//  Created by Patrick Diviacco on 30/10/2019.
//  Copyright © 2019 Patrick. All rights reserved.
//

import Foundation

import XCTest
@testable import GildedRoseKata

class ItemStrategyFactoryTests : XCTestCase {

    func testStrategyForNormalItem() {
        let input = Item(name: Names.normal1.rawValue, sellIn: 2, quality: 7)
        let sut = ItemStrategyFactory()
        let output = sut.strategyFor(item: input)
        XCTAssertTrue(output is NormalItemStrategy)
    }
    
    func testStrategyForBrieItem() {
        let input = Item(name: Names.brie.rawValue, sellIn: 2, quality: 7)
        let sut = ItemStrategyFactory()
        let output = sut.strategyFor(item: input)
        XCTAssertTrue(output is BrieItemStrategy)
    }
    
    func testStrategyForBackstageItem() {
        let input = Item(name: Names.backstage.rawValue, sellIn: 2, quality: 7)
        let sut = ItemStrategyFactory()
        let output = sut.strategyFor(item: input)
        XCTAssertTrue(output is BackstageItemStrategy)
    }
    
    func testStrategyForSulfurasItem() {
        let input = Item(name: Names.sulfuras.rawValue, sellIn: 2, quality: 7)
        let sut = ItemStrategyFactory()
        let output = sut.strategyFor(item: input)
        XCTAssertTrue(output is SulfurasItemStrategy)
    }
}
