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

class BackstageItemsTests : XCTestCase {
    
    func testUpdateSellInDecreasing() {
        let input = Item(name: Names.backstage.rawValue, sellIn: 5, quality: 7)
        let sut = GildedRose(items: [input])
        sut.updateQuality()
        XCTAssertEqual(sut.items.first!.sellIn, 4, "SellIn should be decreased by 1")
    }
    
    func testUpdateQualityIncreasingBy1IfMore10DaysLeft() {
        let input = Item(name: Names.backstage.rawValue, sellIn: 12, quality: 7)
        let sut = GildedRose(items: [input])
        sut.updateQuality()
        XCTAssertEqual(sut.items.first!.quality, 8, "Quality should be increased by 1")
    }
    
    func testUpdateQualityIncreasingBy1IfNear10DaysLeft() {
        let input = Item(name: Names.backstage.rawValue, sellIn: 11, quality: 7)
        let sut = GildedRose(items: [input])
        sut.updateQuality()
        XCTAssertEqual(sut.items.first!.quality, 8, "Quality should be increased by 1")
    }
    
    func testUpdateQualityIncreasingBy2If10DaysLeft() {
        let input = Item(name: Names.backstage.rawValue, sellIn: 10, quality: 7)
        let sut = GildedRose(items: [input])
        sut.updateQuality()
        XCTAssertEqual(sut.items.first!.quality, 9, "Quality should be increased by 2")
    }
    
    func testUpdateQualityIncreasingBy2IfBetween5And10DaysLeft() {
        let input = Item(name: Names.backstage.rawValue, sellIn: 7, quality: 7)
        let sut = GildedRose(items: [input])
        sut.updateQuality()
        XCTAssertEqual(sut.items.first!.quality, 9, "Quality should be increased by 2")
    }
    
    func testUpdateQualityIncreasingBy2IfNear5DaysLeft() {
        let input = Item(name: Names.backstage.rawValue, sellIn: 6, quality: 7)
        let sut = GildedRose(items: [input])
        sut.updateQuality()
        XCTAssertEqual(sut.items.first!.quality, 9, "Quality should be increased by 2")
    }
    
    func testUpdateQualityIncreasingBy3If5DaysLeft() {
        let input = Item(name: Names.backstage.rawValue, sellIn: 5, quality: 7)
        let sut = GildedRose(items: [input])
        sut.updateQuality()
        XCTAssertEqual(sut.items.first!.quality, 10, "Quality should be increased by 3")
    }
    
    func testUpdateQualityIncreasingBy3IfBetween0And5DaysLeft() {
        let input = Item(name: Names.backstage.rawValue, sellIn: 1, quality: 7)
        let sut = GildedRose(items: [input])
        sut.updateQuality()
        XCTAssertEqual(sut.items.first!.quality, 10, "Quality should be increased by 3")
    }
    
    func testUpdateQualityIncreasingBy3NearSellDate() {
        let input = Item(name: Names.backstage.rawValue, sellIn: 1, quality: 7)
        let sut = GildedRose(items: [input])
        sut.updateQuality()
        XCTAssertEqual(sut.items.first!.quality, 10, "Quality should be increased by 3")
    }
    
    func testUpdateQualityIs0OnSellDate() {
        let input = Item(name: Names.backstage.rawValue, sellIn: 0, quality: 7)
        let sut = GildedRose(items: [input])
        sut.updateQuality()
        XCTAssertEqual(sut.items.first!.quality, 0, "Quality should be 0")
    }
    
    func testUpdateQualityIs0AfterSellDate() {
        let input = Item(name: Names.backstage.rawValue, sellIn: -2, quality: 7)
        let sut = GildedRose(items: [input])
        sut.updateQuality()
        XCTAssertEqual(sut.items.first!.quality, 0, "Quality should be 0")
    }
    
    func testUpdateQualityNearMax() {
        let input = Item(name: Names.backstage.rawValue, sellIn: 14, quality: 49)
        let sut = GildedRose(items: [input])
        sut.updateQuality()
        XCTAssertEqual(sut.items.first!.quality, 50, "Quality should be 50")
    }
    
    func testUpdateQualityAtMax() {
        let input = Item(name: Names.backstage.rawValue, sellIn: 14, quality: 50)
        let sut = GildedRose(items: [input])
        sut.updateQuality()
        XCTAssertEqual(sut.items.first!.quality, 50, "Quality should not increase more than 50")
    }
}
