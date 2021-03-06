//
//  dataControllerTest.swift
//  notes2
//
//  Created by Marek Newton on 1/27/17.
//  Copyright © 2017 Marek Newton. All rights reserved.
//

import XCTest
@testable import notes2

class dataControllerTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testGetContext() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        XCTAssertTrue(getContext() == appDelegate.persistentContainer.viewContext)
    }
    
    func testGetTransaction() {
        getTranscriptions()
    }
}
