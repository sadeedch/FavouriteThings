//
//  FavouriteThingsTests.swift
//  FavouriteThingsTests
//
//  Created by Sadeed Ahmed  on 22/4/20.
//  Copyright © 2020 Sadeed Ahmad. All rights reserved.
//

import XCTest
import SwiftUI
@testable import FavouriteThings

class FavouriteThingsTests: XCTestCase {
    
    var thingsList = ThingsList()
    
    // testGroundValues is the data which will be used for unit tests.
    let testGroundValues = Things (
        "",
        "SCG",
        "Sydney",
        "48601",
        "1848",
        "Sydney Cricket Ground Trust",
        "Iconic Cricket Ground",
        "Capacity",
        "Opened",
        "Owner"
    )

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /*
    This function testGround tests that the values are equal to the test data
     by using the Ground class and XCTAssertEqual function.
    */
    func testGround() {
        let url = ""
        let name = "MCG"
        let location = "Melbourne"
        let capacity = "1000242"
        let opened = "1853"
        let owner = "Melbourne Cricket Club"
        let notes = "Home of Cricket"
        let title_field1 =  "Capacity"
        let title_field2 = "Opened"
        let title_field3 = "Owner"
        
        let test_values = Things(url, name, location, capacity, opened, owner, notes, title_field1, title_field2, title_field3)
        
        XCTAssertEqual(test_values.name, name)
        XCTAssertEqual(test_values.location, location)
        XCTAssertEqual(test_values.capacity, capacity)
        XCTAssertEqual(test_values.opened, opened)
        XCTAssertEqual(test_values.owner, owner)
        XCTAssertEqual(test_values.notes, notes)
        XCTAssertEqual(test_values.title_field1, title_field1)
        XCTAssertEqual(test_values.title_field2, title_field2)
        XCTAssertEqual(test_values.title_field3, title_field3)
    }
    
    /*
       The following functions tests for different values of Ground and comparing them against the
     test data. They check if they are equal to the given data and whether they are nil or not.
    */
    func testGroundName() {
        XCTAssertNotNil(testGroundValues.name)
        XCTAssertEqual(testGroundValues.name, "SCG")
    }
    
    func testGroundLocation() {
        XCTAssertNotNil(testGroundValues.location)
        XCTAssertEqual(testGroundValues.location, "Sydney")
    }
    
    func testGroundCapacity() {
        XCTAssertNotNil(testGroundValues.capacity)
        XCTAssertEqual(testGroundValues.capacity, "48601")
    }
    func testGroundOpened() {
        XCTAssertNotNil(testGroundValues.opened)
        XCTAssertEqual(testGroundValues.opened, "1848")
    }
    func testGroundOwner() {
        XCTAssertNotNil(testGroundValues.owner)
        XCTAssertEqual(testGroundValues.owner, "Sydney Cricket Ground Trust")
    }
    
    func testGroundNotes (){
        XCTAssertEqual(testGroundValues.notes, "Iconic Cricket Ground")
    }
    
    func testGroundTitle_Field1 (){
        XCTAssertEqual(testGroundValues.title_field1, "Capacity")
    }
    
    func testGroundTitle_Field2 (){
        XCTAssertEqual(testGroundValues.title_field2, "Opened")
    }
    
    func testGroundTitle_Field3 (){
        XCTAssertEqual(testGroundValues.title_field3, "Owner")
    }
    
    
    /*
    function : testDownloadedImage
    Checks that if the url is valid to download an image.
     */
    
    func testDownloadedImage() {
        // Checks that if the url is valid to download an image.
        guard let imageURL = URL(string:"https://cdn.pixabay.com/photo/2015/02/24/15/41/dog-647528_1280.jpg")
            else {
                return XCTFail("URL is invalid. Insert correct URL")
        }
        
        // checks that if the data can be derived from the given url.
        guard let imageData = try? Data(contentsOf: imageURL)
            else {
               return XCTFail("Could not download the image")
        }
        
        // checks that if the image can be derived from the given data.
        guard let uiImage = UIImage(data: imageData)
            else {
             return XCTFail("Data does not contain any image")
           }
        
        // checks the the image created from the imageData is not nill.
        let downloadedImage = Image(uiImage: uiImage)
        XCTAssertNotNil(downloadedImage)
    }
    
    /// testJSON function to test the encoding and decoding of JSON data
    func testJSON() {
        
        // Do catch block to decode the JSON data and showing error if unable to decode the data
        do {
            let t = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let decodedModel = try decoder.decode(ThingsList.self, from: t)
            thingsList = decodedModel
            }
            catch {
                print("Unable to decode the data \(fileURL.path) \(error)")
            }
    
        // Do catch block to encode the JSON data and showing error if unable to encode the data
        do {
            let json = JSONEncoder()
            let data = try json.encode(thingsList)
            try data.write(to: fileURL)
            }
            catch {
               print("Unable to encode the data \(fileURL.path) \(error)")
            }
    }
    
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
