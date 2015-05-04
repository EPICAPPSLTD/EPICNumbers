//
//  NSNumbers+Extensions.swift
//  EPICNumbers
//
//  Created by Danny Bravo on 28/04/2015.
//  Copyright (c) 2015 EPIC. All rights reserved.
//

import Foundation

//MARK: - algebra functions
func + (left:NSNumber, right:NSNumber) -> NSNumber {
    assert(left.isNumberType && right.isNumberType, "you can only perform arithmetics on numbers that are of numeric types")
    return NSNumber(double:(left.doubleValue + right.doubleValue))
}

func - (left:NSNumber, right:NSNumber) -> NSNumber {
    assert(left.isNumberType && right.isNumberType, "you can only perform arithmetics on numbers that are of numeric types")
    return NSNumber(double:(left.doubleValue - right.doubleValue))
}

func / (left:NSNumber, right:NSNumber) -> NSNumber {
    assert(left.isNumberType && right.isNumberType, "you can only perform arithmetics on numbers that are of numeric types")
    assert(right != 0, "you cannot divide by zero")
    return NSNumber(double:(left.doubleValue / right.doubleValue))
}

func * (left:NSNumber, right:NSNumber) -> NSNumber {
    assert(left.isNumberType && right.isNumberType, "you can only perform arithmetics on numbers that are of numeric types")
    return NSNumber(double:(left.doubleValue * right.doubleValue))
}

func % (left:NSNumber, right:NSNumber) -> NSNumber {
    assert(left.isNumberType && right.isNumberType, "you can only perform arithmetics on numbers that are of numeric types")
    return NSNumber(double:(left.doubleValue % right.doubleValue))
}

//MARK: - extended algebra functions
func += (inout left: NSNumber, right: NSNumber) {
    left = left + right
}

func -= (inout left: NSNumber, right: NSNumber) {
    left = left - right
}

func *= (inout left: NSNumber, right: NSNumber) {
    left = left * right
}

func /= (inout left: NSNumber, right: NSNumber) {
    left = left / right
}

func %= (inout left: NSNumber, right: NSNumber) {
    left = left % right
}

prefix func - (number:NSNumber) -> NSNumber {
    return NSNumber(double: -number.doubleValue)
}

postfix func ++ (inout number:NSNumber) -> NSNumber {
    number = NSNumber(double: number.doubleValue + 1.0)
    return number
}

postfix func -- (inout number:NSNumber) -> NSNumber {
    number = NSNumber(double: number.doubleValue - 1.0)
    return number
}

//MARK: - batch algebra functions
func + (left:[NSNumber], right:NSNumber) -> [NSNumber] {
    return NSNumber.batchModifyNumbers(left) { (number) -> NSNumber in number + right }
}

func - (left:[NSNumber], right:NSNumber) -> [NSNumber] {
    return NSNumber.batchModifyNumbers(left) { (number) -> NSNumber in number - right }
}

func / (left:[NSNumber], right:NSNumber) -> [NSNumber] {
    return NSNumber.batchModifyNumbers(left) { (number) -> NSNumber in number / right }
}

func * (left:[NSNumber], right:NSNumber) -> [NSNumber] {
    return NSNumber.batchModifyNumbers(left) { (number) -> NSNumber in number * right }
}

func % (left:[NSNumber], right:NSNumber) -> [NSNumber] {
    return NSNumber.batchModifyNumbers(left) { (number) -> NSNumber in number % right }
}

//MARK: - extended batch algebra functions
func += (inout left: [NSNumber], right: NSNumber) {
    left = left + right
}

func -= (inout left: [NSNumber], right: NSNumber) {
    left = left - right
}

func *= (inout left: [NSNumber], right: NSNumber) {
    left = left * right
}

func /= (inout left: [NSNumber], right: NSNumber) {
    left = left / right
}

func %= (inout left: [NSNumber], right: NSNumber) {
    left = left % right
}

prefix func - (numbers:[NSNumber]) -> [NSNumber] {
    return NSNumber.batchModifyNumbers(numbers) { (number) -> NSNumber in NSNumber(double: -number.doubleValue) }
}

postfix func ++ (inout numbers:[NSNumber]) -> [NSNumber] {
    numbers = NSNumber.batchModifyNumbers(numbers) { (number) -> NSNumber in
        var number = number
        return number++
    }
    return numbers
}

postfix func -- (inout numbers:[NSNumber]) -> [NSNumber] {
    numbers = NSNumber.batchModifyNumbers(numbers) { (number) -> NSNumber in
        var number = number
        return number--
    }
    return numbers
}

//MARK: - comparisons
func < (left:NSNumber, right:NSNumber) -> Bool {
    return left.compare(right) == NSComparisonResult.OrderedAscending
}

func > (left:NSNumber, right:NSNumber) -> Bool {
    return left.compare(right) == NSComparisonResult.OrderedDescending
}

func <= (left:NSNumber, right:NSNumber) -> Bool {
    let result = left.compare(right)
    return result == NSComparisonResult.OrderedAscending || result == NSComparisonResult.OrderedSame
}

func >= (left:NSNumber, right:NSNumber) -> Bool {
    let result = left.compare(right)
    return result == NSComparisonResult.OrderedDescending || result == NSComparisonResult.OrderedSame
}

//MARK: - batch comparisons
func < (left:[NSNumber], right:NSNumber) -> Bool {
    return NSNumber.batchCompareNumbers(left, block: { (number) -> Bool in
        number < right
    })
}

func > (left:[NSNumber], right:NSNumber) -> Bool {
    return NSNumber.batchCompareNumbers(left, block: { (number) -> Bool in
        number > right
    })
}

func <= (left:[NSNumber], right:NSNumber) -> Bool {
    return NSNumber.batchCompareNumbers(left, block: { (number) -> Bool in
        number <= right
    })
}

func >= (left:[NSNumber], right:NSNumber) -> Bool {
    return NSNumber.batchCompareNumbers(left, block: { (number) -> Bool in
        number >= right
    })
}

func == (left:[NSNumber], right:NSNumber) -> Bool {
    return NSNumber.batchCompareNumbers(left, block: { (number) -> Bool in
        number == right
    })
}

func != (left:[NSNumber], right:NSNumber) -> Bool {
    return NSNumber.batchCompareNumbers(left, block: { (number) -> Bool in
        number != right
    })
}

//MARK: - private static vars
private let booleanNumber : NSNumber = true

//MARK: - class extensions
extension NSNumber {
    
    //MARK: - class functions
    class func squarePower(numbers: [NSNumber]) -> [NSNumber] {
        return batchModifyNumbers(numbers) { (number) -> NSNumber in number.squarePower }
    }
    
    class func squareRoot(numbers: [NSNumber]) -> [NSNumber] {
        return batchModifyNumbers(numbers) { (number) -> NSNumber in number.squareRoot }
    }
    
    class func isNumberType(numbers: [NSNumber]) -> Bool {
        for number in numbers {
            if !number.isNumberType {
                return false
            }
        }
        return true
    }
    
    class func sum(numbers: [NSNumber]) -> NSNumber {
        var total : NSNumber = 0
        for number in numbers {
            total += number
        }
        return total
    }

    class func average(numbers: [NSNumber]) -> NSNumber {
        return NSNumber(double: sum(numbers).doubleValue/Double(numbers.count))
    }
    
    class func maximum(numbers: [NSNumber]) -> NSNumber {
        var maximum : NSNumber = 0
        for number in numbers {
            maximum = maximum.maximum(number)
        }
        return maximum
    }
    
    class func minimum(numbers: [NSNumber]) -> NSNumber {
        var minimum : NSNumber = DBL_MAX
        for number in numbers {
            minimum = minimum.minimum(number)
        }
        return minimum
    }
    
    class func limit(numbers: [NSNumber], minimum : NSNumber, maximum : NSNumber) -> [NSNumber] {
        return batchModifyNumbers(numbers) { (number) -> NSNumber in number.limit(minimum: minimum, maximum: maximum) }
    }
    
    class func powerOf(numbers: [NSNumber], power : NSNumber) -> [NSNumber] {
        return batchModifyNumbers(numbers) { (number) -> NSNumber in number.powerOf(power) }
    }
    
    class func rootOf(numbers: [NSNumber], root : NSNumber) -> [NSNumber] {
        return batchModifyNumbers(numbers) { (number) -> NSNumber in number.rootOf(root) }
    }
    
    //MARK: - calculated vars
    var squarePower : NSNumber {
        assert(self.isNumberType, "you can only perform arithmetics on numbers that are of numeric types")
        return self * self
    }
    
    var squareRoot : NSNumber {
        assert(self.isNumberType, "you can only perform arithmetics on numbers that are of numeric types")
        let value = sqrt(self.doubleValue)
        return NSNumber(double: value)
    }
    
    var isNumberType : Bool {
        return self.objCType != booleanNumber.objCType
    }
    
    //MARK: - functions
    func maximum(number : NSNumber) -> NSNumber {
        let value = max(number.doubleValue, self.doubleValue)
        return NSNumber(double: value)
    }
    
    func minimum(number : NSNumber) -> NSNumber {
        let value = min(number.doubleValue, self.doubleValue)
        return NSNumber(double: value)
    }
    
    func limit(#minimum : NSNumber, maximum : NSNumber) -> NSNumber {
        assert(minimum < maximum, "minimum in limit calculation cannot be greater than maximum")
        var value = max(minimum.doubleValue, self.doubleValue)
        value = min(value, maximum.doubleValue)
        return NSNumber(double: value)
    }
    
    func powerOf(number : NSNumber) -> NSNumber {
        assert(self.isNumberType && number.isNumberType, "you can only perform arithmetics on numbers that are of numeric types")
        return NSNumber(double:pow(self.doubleValue, number.doubleValue))
    }
    
    func rootOf(number : NSNumber) -> NSNumber {
        assert(self.isNumberType && number.isNumberType, "you can only perform arithmetics on numbers that are of numeric types")
        return NSNumber(double:pow(self.doubleValue, 1/number.doubleValue))
    }
    
    //MARK: - private utilities
    private class func batchModifyNumbers(var array:[NSNumber], block:(number:NSNumber) -> NSNumber) -> [NSNumber] {
        for var i = 0; i < array.count; i++ {
            array[i] = block(number: array[i])
        }
        return array
    }
    
    private class func batchCompareNumbers(array:[NSNumber], block:(number:NSNumber) -> Bool) -> Bool {
        for number in array {
            if !block(number: number) {
                return false
            }
        }
        return true
    }
    
}