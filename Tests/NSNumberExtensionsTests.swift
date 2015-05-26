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
        
        XCTAssertEqual(add.doubleValue, 42.5, "arithmetic is incorrect")
        XCTAssertEqual(minus.doubleValue, 21.5, "arithmetic is incorrect")
        XCTAssertEqual(multiply.doubleValue, 336.0, "arithmetic is incorrect")
        XCTAssertEqual(divide.doubleValue, 2.0, "arithmetic is incorrect")
        XCTAssertEqual(mod.doubleValue, 0.0, "arithmetic is incorrect")
        XCTAssertEqual(mod2.doubleValue, 0.5, "arithmetic is incorrect")
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

        XCTAssertEqual(add.doubleValue, 42.5, "arithmetic is incorrect")
        XCTAssertEqual(minus.doubleValue, 21.5, "arithmetic is incorrect")
        XCTAssertEqual(multiply.doubleValue, 336.0, "arithmetic is incorrect")
        XCTAssertEqual(divide.doubleValue, 2.0, "arithmetic is incorrect")
        XCTAssertEqual(mod.doubleValue, 0, "arithmetic is incorrect")
        XCTAssertEqual(mod2.doubleValue, 0.5, "arithmetic is incorrect")
        XCTAssertEqual(negative.doubleValue, -32.0, "arithmetic is incorrect")
        XCTAssertEqual(plusOne.doubleValue, 33.0, "arithmetic is incorrect")
        XCTAssertEqual(minusOne.doubleValue, 31.0, "arithmetic is incorrect")
    }
    
    func testBatchAlgebraFunctions() {
        var one = number_double
        var two = number_float
        var three = number_floatLiteral
        var four = number_integerLiteral
        var five = number_long
        var six = number_longLong
        
        let array = [number_double, number_float, number_floatLiteral, number_integerLiteral, number_long, number_longLong]
        
        let add = array + 2.0
        let minus = array - 2.0
        let multiply = array * 2.0
        let divide = array / 2.0
        let mod = array % 2.0
        let mod2 = array % 10.5
        
        XCTAssertEqual(add.description, "[6, 10, 18, 130, 258, 514]", "arithmetic is incorrect")
        XCTAssertEqual(minus.description, "[2, 6, 14, 126, 254, 510]", "arithmetic is incorrect")
        XCTAssertEqual(multiply.description, "[8, 16, 32, 256, 512, 1024]", "arithmetic is incorrect")
        XCTAssertEqual(divide.description, "[2, 4, 8, 64, 128, 256]", "arithmetic is incorrect")
        XCTAssertEqual(mod.description, "[0, 0, 0, 0, 0, 0]", "arithmetic is incorrect")
        XCTAssertEqual(mod2.description, "[4, 8, 5.5, 2, 4, 8]", "arithmetic is incorrect")
    }
    
    func testExtendedBatchAlgebraFunctions() {
        var one = number_double
        var two = number_float
        var three = number_floatLiteral
        var four = number_integerLiteral
        var five = number_long
        var six = number_longLong
        
        var array = [number_double, number_float, number_floatLiteral, number_integerLiteral, number_long, number_longLong]
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
        
        var negativeArray = -array
        var plusOneArray = array
        var minusOneArray = array

        plusOneArray++
        minusOneArray--
        
        XCTAssertEqual(addArray.description, "[6, 10, 18, 130, 258, 514]", "arithmetic is incorrect")
        XCTAssertEqual(minusArray.description, "[2, 6, 14, 126, 254, 510]", "arithmetic is incorrect")
        XCTAssertEqual(multiplyArray.description, "[8, 16, 32, 256, 512, 1024]", "arithmetic is incorrect")
        XCTAssertEqual(divideArray.description, "[2, 4, 8, 64, 128, 256]", "arithmetic is incorrect")
        XCTAssertEqual(modArray.description, "[0, 0, 0, 0, 0, 0]", "arithmetic is incorrect")
        XCTAssertEqual(mod2Array.description, "[4, 8, 5.5, 2, 4, 8]", "arithmetic is incorrect")
        XCTAssertEqual(negativeArray.description, "[-4, -8, -16, -128, -256, -512]", "arithmetic is incorrect")
        XCTAssertEqual(plusOneArray.description, "[5, 9, 17, 129, 257, 513]", "arithmetic is incorrect")
        XCTAssertEqual(minusOneArray.description, "[3, 7, 15, 127, 255, 511]", "arithmetic is incorrect")
    }
    
    func testComparisons() {
        XCTAssertTrue(number_boolean > number_booleanLiteral, "should be true")
        XCTAssertTrue(number_unsignedChar > number_char, "should be true")
        XCTAssertTrue(number_unsignedShort > number_short, "should be true")
        XCTAssertFalse(number_booleanLiteral > number_boolean, "should be false")
        XCTAssertFalse(number_char > number_unsignedChar, "should be false")
        XCTAssertFalse(number_short > number_unsignedShort, "should be false")
        XCTAssertFalse(number_unsignedShort > number_unsignedShort, "should be false")
        
        XCTAssertTrue(number_booleanLiteral < number_boolean, "should be true")
        XCTAssertTrue(number_char < number_unsignedChar, "should be true")
        XCTAssertTrue(number_short < number_unsignedShort, "should be true")
        XCTAssertFalse(number_boolean < number_booleanLiteral, "should be false")
        XCTAssertFalse(number_unsignedChar < number_char, "should be false")
        XCTAssertFalse(number_unsignedShort < number_short, "should be false")
        XCTAssertFalse( number_unsignedShort < number_unsignedShort, "should be false")
        
        XCTAssertTrue(number_boolean >= number_booleanLiteral, "should be true")
        XCTAssertTrue(number_unsignedChar >= number_char, "should be true")
        XCTAssertTrue(number_unsignedShort >= number_short, "should be true")
        XCTAssertFalse(number_booleanLiteral >= number_boolean, "should be false")
        XCTAssertFalse(number_char >= number_unsignedChar, "should be false")
        XCTAssertFalse(number_short >= number_unsignedShort, "should be false")
        XCTAssertTrue(number_unsignedShort >= number_unsignedShort, "should be true")
        
        XCTAssertTrue(number_booleanLiteral <= number_boolean, "should be true")
        XCTAssertTrue(number_char <= number_unsignedChar, "should be true")
        XCTAssertTrue(number_short <= number_unsignedShort, "should be true")
        XCTAssertFalse(number_boolean <= number_booleanLiteral, "should be false")
        XCTAssertFalse(number_unsignedChar <= number_char, "should be false")
        XCTAssertFalse(number_unsignedShort <= number_short, "should be false")
        XCTAssertTrue(number_unsignedShort <= number_unsignedShort, "should be true")
        
        XCTAssertTrue(number_unsignedShort == number_unsignedShort, "should be true")
        XCTAssertTrue(number_unsignedShort != number_short, "should be true")
        XCTAssertFalse(number_unsignedShort == number_short, "should be true")
        XCTAssertFalse(number_unsignedShort != number_unsignedShort, "should be true")

    }
    
    func testBatchComparisons() {
        let array = [NSNumber(int: 1), NSNumber(int: 2), NSNumber(int: 3)]
        
        XCTAssertTrue(array < 4, "should be true")
        XCTAssertFalse(array < 3, "should be false")
        XCTAssertFalse(array < 2, "should be false")
        
        XCTAssertTrue(array > -1, "should be true")
        XCTAssertTrue(array > 0, "should be true")
        XCTAssertFalse(array > 1, "should be false")
        XCTAssertFalse(array > 2, "should be false")
        
        XCTAssertTrue(array <= 4, "should be true")
        XCTAssertTrue(array <= 3, "should be true")
        XCTAssertFalse(array <= 2, "should be false")
        
        XCTAssertTrue(array >= -1, "should be true")
        XCTAssertTrue(array >= 0, "should be true")
        XCTAssertTrue(array >= 1, "should be true")
        XCTAssertFalse(array >= 2, "should be false")
        
        let equalArray = [NSNumber(int: 10), NSNumber(int: 10), NSNumber(int: 10)]
        let notEqualArray = [NSNumber(int: 1), NSNumber(int: 10), NSNumber(int: 10)]
        let notEqualArray2 = [NSNumber(int: 1), NSNumber(int: 2), NSNumber(int: 3)]

        XCTAssertTrue(equalArray == 10, "should be true")
        XCTAssertFalse(notEqualArray == 10, "should be false")
        XCTAssertFalse(notEqualArray2 == 10, "should be false")

        XCTAssertFalse(equalArray != 10, "should be false")
        XCTAssertFalse(notEqualArray != 10, "should be false")
        XCTAssertTrue(notEqualArray2 != 10, "should be true")
    }

    //MARK: class function tests
    func testClassSquarePower() {
        var numbers : [NSNumber] = [2, 4, 6]
        numbers = NSNumber.squarePower(numbers)
        XCTAssertEqual(numbers[0], 4, "class square power calculation is incorrect")
        XCTAssertEqual(numbers[1], 16, "class square power calculation is incorrect")
        XCTAssertEqual(numbers[2], 36, "class square power calculation is incorrect")
    }
    
    func testClassSquareRoot() {
        var numbers : [NSNumber] = [4, 16, 36]
        numbers = NSNumber.squareRoot(numbers)
        XCTAssertEqual(numbers[0], 2, "class square root calculation is incorrect")
        XCTAssertEqual(numbers[1], 4, "class square root calculation is incorrect")
        XCTAssertEqual(numbers[2], 6, "class square root calculation is incorrect")
    }

    func testClassSum() {
        let numbers : [NSNumber] = [2, 4, 6.5]
        let sum = NSNumber.sum(numbers)
        XCTAssertEqual(sum, 12.5, "sum calculation is incorrect")
    }
    
    func testClassAverage() {
        let numbers : [NSNumber] = [2, 4, 6]
        let average = NSNumber.average(numbers)
        XCTAssertEqual(average, 4, "average calculation is incorrect")
    }
    
    func testClassMaximum() {
        let numbers : [NSNumber] = [2, 4, -6]
        let max = NSNumber.maximum(numbers)
        XCTAssertEqual(max, 4, "class maximum calculation is incorrect")
    }
    
    func testClassMinimum() {
        let numbers : [NSNumber] = [2, 4, -6]
        let min = NSNumber.minimum(numbers)
        XCTAssertEqual(min, -6, "class minimum calculation is incorrect")
    }
    
    func testClassLimit() {
        var numbers : [NSNumber] = [2, 4, -6]
        numbers = NSNumber.limit(numbers, minimum: -1, maximum: 3)
        XCTAssertEqual(numbers.description, "[2, 3, -1]", "class limit calculation is incorrect")
    }
    
    func testClassPowerOf() {
        let numbers : [NSNumber] = [2, 4, 6]
        let pow2 = NSNumber.powerOf(numbers, power: 2)
        XCTAssertEqual(pow2.description, "[4, 16, 36]", "class power of calculation is incorrect")
        
        let pow3 = NSNumber.powerOf(numbers, power: 3)
        XCTAssertEqual(pow3.description, "[8, 64, 216]", "class power of calculation is incorrect")
    }

    func testClassRootOf() {
        let numbers : [NSNumber] = [100, 4, 36]
        let root2 = NSNumber.rootOf(numbers, root: 2)
        XCTAssertEqual(root2.description, "[10, 2, 6]", "class power of calculation is incorrect")
        
        let root3 = NSNumber.rootOf(numbers, root: 3)
        XCTAssertEqualWithAccuracy(root3[0].doubleValue, 4.641588833612778, 0.0000001, "root calculation is incorrect")
        XCTAssertEqualWithAccuracy(root3[1].doubleValue, 1.587401051968199, 0.0000001, "root calculation is incorrect")
        XCTAssertEqualWithAccuracy(root3[2].doubleValue, 3.301927248894626, 0.0000001, "root calculation is incorrect")
    }

    //MARK: instance function tests
    func testSquarePower() {
        var number : NSNumber = 2
        number = number.squarePower
        XCTAssertEqual(number, 4, "square power calculation is incorrect")
        
        number = number.squarePower
        XCTAssertEqual(number, 16, "square power calculation is incorrect")
        
        number = number.squarePower
        XCTAssertEqual(number, 256, "square power calculation is incorrect")
    }
    
    func testSquareRoot() {
        var number : NSNumber = 256
        number = number.squareRoot
        XCTAssertEqual(number, 16, "square root calculation is incorrect")
        
        number = number.squareRoot
        XCTAssertEqual(number, 4, "square root calculation is incorrect")
        
        number = number.squareRoot
        XCTAssertEqual(number, 2, "square root calculation is incorrect")
    }
    
    func testMaximum() {
        let number : NSNumber = 100
        XCTAssertEqual(number.maximum(50), 100, "maximum calculation is incorrect")
        XCTAssertEqual(number.maximum(1050), 1050, "maximum calculation is incorrect")
        XCTAssertEqual(number.maximum(-100), 100, "maximum calculation is incorrect")
    }
    
    func testMinimum() {
        let number : NSNumber = 100
        XCTAssertEqual(number.minimum(50), 50, "minimum calculation is incorrect")
        XCTAssertEqual(number.minimum(1050), 100, "minimum calculation is incorrect")
        XCTAssertEqual(number.minimum(-100), -100, "minimum calculation is incorrect")
    }
    
    func testLimit() {
        let number : NSNumber = 100
        XCTAssertEqual(number.limit(minimum: 0, maximum: 50), 50, "limit calculation is incorrect")
        XCTAssertEqual(number.limit(minimum: 110, maximum: 1050), 110, "limit calculation is incorrect")
        XCTAssertEqual(number.limit(minimum: 0, maximum: 150), 100, "limit calculation is incorrect")
        XCTAssertEqual(number.limit(minimum: -100, maximum: -10), -10, "limit calculation is incorrect")
    }
    
    func testPowerOf() {
        let number : NSNumber = 2
        
        let squarePower = number.powerOf(2)
        let thirdPower = number.powerOf(3)
        let fourthPower = number.powerOf(4)
        
        XCTAssertEqual(squarePower, 4, "power calculation is incorrect")
        XCTAssertEqual(thirdPower, 8, "power calculation is incorrect")
        XCTAssertEqual(fourthPower, 16, "power calculation is incorrect")
    }
    
    func testRootOf() {
        let number : NSNumber = 256
        
        let squareRoot = number.rootOf(2)
        let thirdRoot = number.rootOf(3)
        let fourthRoot = number.rootOf(4)
        
        XCTAssertEqualWithAccuracy(squareRoot.doubleValue, 16, 0.0000001, "root calculation is incorrect")
        XCTAssertEqualWithAccuracy(thirdRoot.doubleValue, 6.34960420787297, 0.0000001, "root calculation is incorrect")
        XCTAssertEqualWithAccuracy(fourthRoot.doubleValue, 4, 0.0000001, "root calculation is incorrect")
    }
    
}
