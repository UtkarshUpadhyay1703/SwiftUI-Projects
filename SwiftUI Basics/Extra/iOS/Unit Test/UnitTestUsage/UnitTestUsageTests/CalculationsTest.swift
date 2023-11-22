//
//  CalculationsTest.swift
//  UnitTestUsageTests
//
//  Created by admin on 11/22/23.
//

import XCTest
@testable import UnitTestUsage

class CalculationsTest: XCTestCase {
    func testAdd(){
        // Given (Arrange)
        let num1 = 20.3
        let num2 = 20.4
        let calc = Calculation()
        // When (Act)
        let realResult = calc.Add(num1: num1, num2: num2)
        // Then (Assert)
        XCTAssertEqual(realResult, 40.7)
        
    }


}
