//
//  Tests.swift
//  EPICNumbersTests
//
//  Created by Danny Bravo on 18/04/2015.
//  Copyright (c) 2015 EPIC. All rights reserved.
//  See LICENSE.txt for this sample’s licensing information
//

import Foundation
import XCTest

class NSNumberExtensionsTests: XCTestCase {
    
    //MARK: - vars 
    //not numbers
    let number_empty = NSNumber()
    let number_boolean = NSNumber(bool: true)
    let number_booleanLiteral = NSNumber(booleanLiteral: false)
    let number_char = NSNumber(char: 1)
    let number_unsignedChar = NSNumber(unsignedChar:  2)
    
    //numbers
    let number_double = NSNumber(double: 4.0)
    let number_float = NSNumber(float: 8.0)
    let number_floatLiteral = NSNumber(floatLiteral: 16.0)
    let number_int = NSNumber(int: 32)
    let number_integer = NSNumber(integer: 64)
    let number_integerLiteral = NSNumber(integerLiteral: 128)
    let number_long = NSNumber(long: 256)
    let number_longLong = NSNumber(longLong: 512)
    let number_short = NSNumber(short: 1024)
    let number_unsignedShort = NSNumber(unsignedShort: 2048)
    let number_unsignedInt = NSNumber(unsignedInteger: 4096)
    let number_unsignedLong = NSNumber(unsignedLong: 8192)
    let number_unsignedLongLong = NSNumber(unsignedLongLong: 16384)

    //MARK: - language modifier tests
    func testAlgebraFunctions() {
        let add = number_int + 10.5
        let minus = number_int - 10.5
        let multiply = number_int * 10.5
        let divide = number_int / number_floatLiteral
        let mod = number_int % number_int
        let mod2 = number_int % 10.5
        
        XCTAssertEqual(add.doubleValue, 42.5)
        XCTAssertEqual(minus.doubleValue, 21.5)
        XCTAssertEqual(multiply.doubleValue, 336.0)
        XCTAssertEqual(divide.doubleValue, 2.0)
        XCTAssertEqual(mod.doubleValue, 0.0)
        XCTAssertEqual(mod2.doubleValue, 0.5)
    }

    func testExtendedAlgebraFunctions() {
        var add = number_int
        var minus = number_int
        var multiply = number_int
        var divide = number_int
        var mod = number_int
        var mod2 = number_int
        
        add += 10.5
        minus -= 10.5
        multiply *= 10.5
        divide /= number_floatLiteral
        mod %= number_int
        mod2 %= 10.5
        
        //prefix functions
        let negative = -number_int
        var plusOne = number_int
        var minusOne = number_int
        
        plusOne++
        minusOne--

        XCTAssertEqual(add.doubleValue, 42.5)
        XCTAssertEqual(minus.doubleValue, 21.5)
        XCTAssertEqual(multiply.doubleValue, 336.0)
        XCTAssertEqual(divide.doubleValue, 2.0)
        XCTAssertEqual(mod.doubleValue, 0)
        XCTAssertEqual(mod2.doubleValue, 0.5)
        XCTAssertEqual(negative.doubleValue, -32.0)
        XCTAssertEqual(plusOne.doubleValue, 33.0)
        XCTAssertEqual(minusOne.doubleValue, 31.0)
    }
    
    func testBatchAlgebraFunctions() {
        let array = [number_double, number_float, number_floatLiteral, number_integerLiteral, number_long, number_longLong]
        
        let add = array + 2.0
        let minus = array - 2.0
        let multiply = array * 2.0
        let divide = array / 2.0
        let mod = array % 2.0
        let mod2 = array % 10.5
        
        XCTAssertEqual(add.description, "[6, 10, 18, 130, 258, 514]")
        XCTAssertEqual(minus.description, "[2, 6, 14, 126, 254, 510]")
        XCTAssertEqual(multiply.description, "[8, 16, 32, 256, 512, 1024]")
        XCTAssertEqual(divide.description, "[2, 4, 8, 64, 128, 256]")
        XCTAssertEqual(mod.description, "[0, 0, 0, 0, 0, 0]")
        XCTAssertEqual(mod2.description, "[4, 8, 5.5, 2, 4, 8]")
    }
    
    func testExtendedBatchAlgebraFunctions() {        
        let array = [number_double, number_float, number_floatLiteral, number_integerLiteral, number_long, number_longLong]
        var addArray = array
        var minusArray = array
        var multiplyArray = array
        var divideArray = array
        var modArray = array
        var mod2Array = array

        addArray += 2.0
        minusArray -= 2.0
        multiplyArray *= 2.0
        divideArray /= 2.0
        modArray %= 2.0
        mod2Array %= 10.5
        
        let negativeArray = -array
        var plusOneArray = array
        var minusOneArray = array

        plusOneArray++
        minusOneArray--
        
        XCTAssertEqual(addArray.description, "[6, 10, 18, 130, 258, 514]")
        XCTAssertEqual(minusArray.description, "[2, 6, 14, 126, 254, 510]")
        XCTAssertEqual(multiplyArray.description, "[8, 16, 32, 256, 512, 1024]")
        XCTAssertEqual(divideArray.description, "[2, 4, 8, 64, 128, 256]")
        XCTAssertEqual(modArray.description, "[0, 0, 0, 0, 0, 0]")
        XCTAssertEqual(mod2Array.description, "[4, 8, 5.5, 2, 4, 8]")
        XCTAssertEqual(negativeArray.description, "[-4, -8, -16, -128, -256, -512]")
        XCTAssertEqual(plusOneArray.description, "[5, 9, 17, 129, 257, 513]")
        XCTAssertEqual(minusOneArray.description, "[3, 7, 15, 127, 255, 511]")
    }
    
    func testComparisons() {
        XCTAssertTrue(number_boolean > number_booleanLiteral)
        XCTAssertTrue(number_unsignedChar > number_char)
        XCTAssertTrue(number_unsignedShort > number_short)
        XCTAssertFalse(number_booleanLiteral > number_boolean)
        XCTAssertFalse(number_char > number_unsignedChar)
        XCTAssertFalse(number_short > number_unsignedShort)
        XCTAssertFalse(number_unsignedShort > number_unsignedShort)
        
        XCTAssertTrue(number_booleanLiteral < number_boolean)
        XCTAssertTrue(number_char < number_unsignedChar)
        XCTAssertTrue(number_short < number_unsignedShort)
        XCTAssertFalse(number_boolean < number_booleanLiteral)
        XCTAssertFalse(number_unsignedChar < number_char)
        XCTAssertFalse(number_unsignedShort < number_short)
        XCTAssertFalse( number_unsignedShort < number_unsignedShort)
        
        XCTAssertTrue(number_boolean >= number_booleanLiteral)
        XCTAssertTrue(number_unsignedChar >= number_char)
        XCTAssertTrue(number_unsignedShort >= number_short)
        XCTAssertFalse(number_booleanLiteral >= number_boolean)
        XCTAssertFalse(number_char >= number_unsignedChar)
        XCTAssertFalse(number_short >= number_unsignedShort)
        XCTAssertTrue(number_unsignedShort >= number_unsignedShort)
        
        XCTAssertTrue(number_booleanLiteral <= number_boolean)
        XCTAssertTrue(number_char <= number_unsignedChar)
        XCTAssertTrue(number_short <= number_unsignedShort)
        XCTAssertFalse(number_boolean <= number_booleanLiteral)
        XCTAssertFalse(number_unsignedChar <= number_char)
        XCTAssertFalse(number_unsignedShort <= number_short)
        XCTAssertTrue(number_unsignedShort <= number_unsignedShort)
        
        XCTAssertTrue(number_unsignedShort == number_unsignedShort)
        XCTAssertTrue(number_unsignedShort != number_short)
        XCTAssertFalse(number_unsignedShort == number_short)
        XCTAssertFalse(number_unsignedShort != number_unsignedShort)

    }
    
    func testBatchComparisons() {
        let array = [NSNumber(int: 1), NSNumber(int: 2), NSNumber(int: 3)]
        
        XCTAssertTrue(array < 4)
        XCTAssertFalse(array < 3)
        XCTAssertFalse(array < 2)
        
        XCTAssertTrue(array > -1)
        XCTAssertTrue(array > 0)
        XCTAssertFalse(array > 1)
        XCTAssertFalse(array > 2)
        
        XCTAssertTrue(array <= 4)
        XCTAssertTrue(array <= 3)
        XCTAssertFalse(array <= 2)
        
        XCTAssertTrue(array >= -1)
        XCTAssertTrue(array >= 0)
        XCTAssertTrue(array >= 1)
        XCTAssertFalse(array >= 2)
        
        let equalArray = [NSNumber(int: 10), NSNumber(int: 10), NSNumber(int: 10)]
        let notEqualArray = [NSNumber(int: 1), NSNumber(int: 10), NSNumber(int: 10)]
        let notEqualArray2 = [NSNumber(int: 1), NSNumber(int: 2), NSNumber(int: 3)]

        XCTAssertTrue(equalArray == 10)
        XCTAssertFalse(notEqualArray == 10)
        XCTAssertFalse(notEqualArray2 == 10)

        XCTAssertFalse(equalArray != 10)
        XCTAssertFalse(notEqualArray != 10)
        XCTAssertTrue(notEqualArray2 != 10)
    }

    //MARK: class function tests
    func testClassSquarePower() {
        var numbers : [NSNumber] = [2, 4, 6]
        numbers = NSNumber.squarePower(numbers)
        XCTAssertEqual(numbers[0], 4)
        XCTAssertEqual(numbers[1], 16)
        XCTAssertEqual(numbers[2], 36)
    }
    
    func testClassSquareRoot() {
        var numbers : [NSNumber] = [4, 16, 36]
        numbers = NSNumber.squareRoot(numbers)
        XCTAssertEqual(numbers[0], 2)
        XCTAssertEqual(numbers[1], 4)
        XCTAssertEqual(numbers[2], 6)
    }

    func testClassSum() {
        let numbers : [NSNumber] = [2, 4, 6.5]
        let sum = NSNumber.sum(numbers)
        XCTAssertEqual(sum, 12.5)
    }
    
    func testClassAverage() {
        let numbers : [NSNumber] = [2, 4, 6]
        let average = NSNumber.average(numbers)
        XCTAssertEqual(average, 4)
    }
    
    func testClassMaximum() {
        let numbers : [NSNumber] = [2, 4, -6]
        let max = NSNumber.maximum(numbers)
        XCTAssertEqual(max, 4)
    }
    
    func testClassMinimum() {
        let numbers : [NSNumber] = [2, 4, -6]
        let min = NSNumber.minimum(numbers)
        XCTAssertEqual(min, -6)
    }
    
    func testClassLimit() {
        var numbers : [NSNumber] = [2, 4, -6]
        numbers = NSNumber.limit(numbers, minimum: -1, maximum: 3)
        XCTAssertEqual(numbers.description, "[2, 3, -1]")
    }
    
    func testClassPowerOf() {
        let numbers : [NSNumber] = [2, 4, 6]
        let pow2 = NSNumber.powerOf(numbers, power: 2)
        XCTAssertEqual(pow2.description, "[4, 16, 36]")
        
        let pow3 = NSNumber.powerOf(numbers, power: 3)
        XCTAssertEqual(pow3.description, "[8, 64, 216]")
    }

    func testClassRootOf() {
        let numbers : [NSNumber] = [100, 4, 36]
        let root2 = NSNumber.rootOf(numbers, root: 2)
        XCTAssertEqual(root2.description, "[10, 2, 6]")
        
        let root3 = NSNumber.rootOf(numbers, root: 3)
        XCTAssertEqualWithAccuracy(root3[0].doubleValue, 4.641588833612778, accuracy: 0.0000001)
        XCTAssertEqualWithAccuracy(root3[1].doubleValue, 1.587401051968199, accuracy: 0.0000001)
        XCTAssertEqualWithAccuracy(root3[2].doubleValue, 3.301927248894626, accuracy: 0.0000001)
    }

    //MARK: instance function tests
    func testSquarePower() {
        var number : NSNumber = 2
        number = number.squarePower
        XCTAssertEqual(number, 4)
        
        number = number.squarePower
        XCTAssertEqual(number, 16)
        
        number = number.squarePower
        XCTAssertEqual(number, 256)
    }
    
    func testSquareRoot() {
        var number : NSNumber = 256
        number = number.squareRoot
        XCTAssertEqual(number, 16)
        
        number = number.squareRoot
        XCTAssertEqual(number, 4)
        
        number = number.squareRoot
        XCTAssertEqual(number, 2)
    }
    
    func testMaximum() {
        let number : NSNumber = 100
        XCTAssertEqual(number.maximum(50), 100)
        XCTAssertEqual(number.maximum(1050), 1050)
        XCTAssertEqual(number.maximum(-100), 100)
    }
    
    func testMinimum() {
        let number : NSNumber = 100
        XCTAssertEqual(number.minimum(50), 50)
        XCTAssertEqual(number.minimum(1050), 100)
        XCTAssertEqual(number.minimum(-100), -100)
    }
    
    func testLimit() {
        let number : NSNumber = 100
        XCTAssertEqual(number.limit(minimum: 0, maximum: 50), 50)
        XCTAssertEqual(number.limit(minimum: 110, maximum: 1050), 110)
        XCTAssertEqual(number.limit(minimum: 0, maximum: 150), 100)
        XCTAssertEqual(number.limit(minimum: -100, maximum: -10), -10)
    }
    
    func testPowerOf() {
        let number : NSNumber = 2
        
        let squarePower = number.powerOf(2)
        let thirdPower = number.powerOf(3)
        let fourthPower = number.powerOf(4)
        
        XCTAssertEqual(squarePower, 4)
        XCTAssertEqual(thirdPower, 8)
        XCTAssertEqual(fourthPower, 16)
    }
    
    func testRootOf() {
        let number : NSNumber = 256
        
        let squareRoot = number.rootOf(2)
        let thirdRoot = number.rootOf(3)
        let fourthRoot = number.rootOf(4)
        
        XCTAssertEqualWithAccuracy(squareRoot.doubleValue, 16, accuracy: 0.0000001)
        XCTAssertEqualWithAccuracy(thirdRoot.doubleValue, 6.34960420787297, accuracy: 0.0000001)
        XCTAssertEqualWithAccuracy(fourthRoot.doubleValue, 4, accuracy: 0.0000001)
    }
    
}
