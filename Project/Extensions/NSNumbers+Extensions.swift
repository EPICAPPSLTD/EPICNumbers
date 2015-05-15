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
    return NSNumber(double:(left.doubleValue + right.doubleValue))
}

func - (left:NSNumber, right:NSNumber) -> NSNumber {
    return NSNumber(double:(left.doubleValue - right.doubleValue))
}

func / (left:NSNumber, right:NSNumber) -> NSNumber {
    assert(right != 0, "you cannot divide by zero")
    return NSNumber(double:(left.doubleValue / right.doubleValue))
}

func * (left:NSNumber, right:NSNumber) -> NSNumber {
    return NSNumber(double:(left.doubleValue * right.doubleValue))
}

func % (left:NSNumber, right:NSNumber) -> NSNumber {
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
    /**
    Applies a square power (or power of 2) to the values in an array of `NSNumbers`.
    
    :param: numbers An array of `NSNumbers` to calculate from.
    
    :returns: A new array equivalent to the input array `numbers` where the value of all its `NSNumber` objects have been altered by the calculation.
    */
    class func squarePower(numbers: [NSNumber]) -> [NSNumber] {
        return batchModifyNumbers(numbers) { (number) -> NSNumber in number.squarePower }
    }
    
    /**
    Applies a square root to the values in an array of `NSNumbers`.
    
    :param: numbers An array of `NSNumbers` to calculate from.
    
    :returns: A new array equivalent to the input array `numbers` where the value of all its `NSNumber` objects have been altered by the calculation.
    */
    class func squareRoot(numbers: [NSNumber]) -> [NSNumber] {
        return batchModifyNumbers(numbers) { (number) -> NSNumber in number.squareRoot }
    }
    
    /**
    Calculates the total sum of an array of `NSNumbers`
    
    :param: numbers An array of `NSNumbers` to calculate a sum from.
    
    :returns: a `NSNumber` with a value equivalent to the sum of `numbers`
    */
    class func sum(numbers: [NSNumber]) -> NSNumber {
        var total : NSNumber = 0
        for number in numbers {
            total += number
        }
        return total
    }

    /**
    Calculates the average value of an array of `NSNumbers`
    
    :param: numbers An array of `NSNumbers` to calculate an average from.
    
    :returns: a `NSNumber` with a value equivalent to the average of `numbers`
    */
    class func average(numbers: [NSNumber]) -> NSNumber {
        return NSNumber(double: sum(numbers).doubleValue/Double(numbers.count))
    }
    
    /**
    Iterates through an array of `NSNumbers`, and returns the object with the greatest value.
    
    :param: numbers An array of `NSNumbers` to compare.
    
    :returns: The `NSNumber` with the highest value in `numbers`.
    */
    class func maximum(numbers: [NSNumber]) -> NSNumber {
        var maximum : NSNumber = 0
        for number in numbers {
            maximum = maximum.maximum(number)
        }
        return maximum
    }
    
    /**
    Iterates through an array of `NSNumbers`, and returns the object with the least value.

    :param: numbers An array of `NSNumbers` to compare.
    
    :returns: The `NSNumber` with the lowest value of `numbers`.
    */
    class func minimum(numbers: [NSNumber]) -> NSNumber {
        var minimum : NSNumber = DBL_MAX
        for number in numbers {
            minimum = minimum.minimum(number)
        }
        return minimum
    }
    
    /**
    Checks all values in an array of `NSNumbers`, making sure that they are within the lower and upper bounds specified by `minimum` and `maximum`. If the original number is within the bounds, where the values of `minimum` and `maximum` are inclusive, then the object's value remains unaltered. If the original number is outside of the bounds, then the value of the number is set to the upper or lower bound, depending on which is closest.
    
    :param: numbers An array of `NSNumbers` to check.
    :param: minimum The minimum value accepted for the returned numbers.
    :param: maximum The maximum value accepted for the returned numbers.
    
    :returns: A new array equivalent to the input array `numbers` where the value of all its `NSNumber` objects have been checked by the calculation.
    
    :warning: If the value of `minimum` is not less than or equal to `maximum` this method will throw an assertion failure.
    */
    class func limit(numbers: [NSNumber], minimum : NSNumber, maximum : NSNumber) -> [NSNumber] {
        return batchModifyNumbers(numbers) { (number) -> NSNumber in number.limit(minimum: minimum, maximum: maximum) }
    }
    
    /**
    Applies the "power of" a `NSNumber`, specified by `power`, to the values contained in an array of `NSNumbers`.
    
    :param: numbers An array of `NSNumbers` to calculate from.
    :param: power   The "power of" value, as a `NSNumber`, to apply to `numbers`.
    
    :returns: A new array equivalent to the input array `numbers` where the value of all its `NSNumber` objects have been altered by the calculation.
    */
    class func powerOf(numbers: [NSNumber], power : NSNumber) -> [NSNumber] {
        return batchModifyNumbers(numbers) { (number) -> NSNumber in number.powerOf(power) }
    }
    
    /**
    Applies the "root of" (or inverse power of) a `NSNumber`, specified by `root`, to the values contained in an array of `NSNumbers`.
    
    :param: numbers An array of `NSNumbers` to calculate from.
    :param: root    The "root of" value, as a `NSNumber`, to apply to `numbers`.

    :returns: A new array equivalent to the input array `numbers` where the value of all its `NSNumber` objects have been altered by the calculation.
    */
    class func rootOf(numbers: [NSNumber], root : NSNumber) -> [NSNumber] {
        return batchModifyNumbers(numbers) { (number) -> NSNumber in number.rootOf(root) }
    }
    
    //MARK: - calculated vars
    /// Calculated variable that returns a new `NSNumber` with the square power (power of 2) value of the calling object.
    var squarePower : NSNumber {
        return self * self
    }
    
    /// Calculated variable that returns a new `NSNumber` with the square root value of the calling object.
    var squareRoot : NSNumber {
        let value = sqrt(self.doubleValue)
        return NSNumber(double: value)
    }
    
    //MARK: - functions
    /**
    Creates a new `NSNumber` with the greater value compared between two `NSNumbers`.
    
    :param: number A `NSNumber` to compare the calling object's value against.
    
    :returns: A new instance of `NSNumber` with the result value of this comparison.
    */
    func maximum(number : NSNumber) -> NSNumber {
        let value = max(number.doubleValue, self.doubleValue)
        return NSNumber(double: value)
    }
    
    /**
    Creates a new `NSNumber` with the lesser value compared between two `NSNumbers`.
    
    :param: number A `NSNumber` to compare the calling object's value against.
    
    :returns: A new instance of `NSNumber` with the result value of this comparison.
    */
    func minimum(number : NSNumber) -> NSNumber {
        let value = min(number.doubleValue, self.doubleValue)
        return NSNumber(double: value)
    }
    
    /**
    Limits the value of a `NSNumber` to the specified `minimum` and `maximum` bounds. If the original number is within the bounds, where the values of `minimum` and `maximum` are inclusive, then the return object's value remains unaltered. If the original number is outside of the bounds, then the value of the number is set to the upper or lower bound, depending on which is closest.
    
    :param: minimum The minimum value accepted for the returned number.
    :param: maximum The maximum value accepted for the returned number.
    
    :returns: A new instance of `NSNumber` with the result value of this calculation.
    
    :warning: If the value of `minimum` is not less than or equal to `maximum` this method will throw an assertion failure.
    */
    func limit(#minimum : NSNumber, maximum : NSNumber) -> NSNumber {
        assert(minimum <= maximum, "minimum in limit calculation cannot be greater than maximum")
        var value = max(minimum.doubleValue, self.doubleValue)
        value = min(value, maximum.doubleValue)
        return NSNumber(double: value)
    }
    
    /**
    Creates a new `NSNumber` object by applying the root (or inverse power) of `number`.

    :param: number The "power of" value, as a `NSNumber`, to apply to the current value of the calling object.
    
    :returns: A new instance of `NSNumber` with the result value of this calculation.
    */
    func powerOf(number : NSNumber) -> NSNumber {
        return NSNumber(double:pow(self.doubleValue, number.doubleValue))
    }
    
    /**
    Creates a new `NSNumber` object by applying the root (or inverse power) of `number`.
    
    :param: number The "root of" value, as a `NSNumber`, to apply to the current value of the calling object.
    
    :returns: A new instance of `NSNumber` with the result value of this calculation.
    */
    func rootOf(number : NSNumber) -> NSNumber {
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