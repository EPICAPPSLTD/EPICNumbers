# EPICNumbers

EPICNumbers is a category extension on NSNumber written in swift that adds the following functionality to the base framework:

Operator overloads for basic algebra
------
* + (additions)
* - (substraction)
* * (multiplication)
* / (division)
* % (modulus)
* += (assigned addition)
* -= (assigned substraction)
* *= (assigned multiplication)
* /= (assigned division)
* %= (assigned modulus)
* prefix - (negative casting)
* postfix ++ (negative casting)
* prefix ++ (negative casting)

#### Usage:
```swift
var num1 : NSNumber = 1.0 //1.0
let num2 : NSNumber = 2.0 //2.0

let num3 = num1 + num2 //3.0
let num4 = num1 - num2 //-1.0
let num5 = num1 * num2 //2.0
let num6 = num1 / num2 //0.5
let num7 = num1 % num2 //1.0

num1 += 2.0 //3.0
num1 -= 2.0 //1.0
num1 *= 2.0 //2.0
num1 /= 2.0 //1.0
num1 %= 2.0 //1.0

-mum1 //-1.0
mum1++ //0.0
mum1-- //-1.0
```

Operator overloads for batch algebra on NSNumber arrays
------
* + (additions)
* - (substraction)
* * (multiplication)
* / (division)
* % (modulus)
* += (assigned addition)
* -= (assigned substraction)
* *= (assigned multiplication)
* /= (assigned division)
* %= (assigned modulus)
* prefix - (negative casting)
* postfix ++ (negative casting)
* prefix ++ (negative casting)

#### Usage:
```swift
var array1 : [NSNumber] = [1.0, 2.0] //[1.0, 2.0]

let array2 = array1 + 2.0 //[3.0, 4.0]
let array3 = array1 - 2.0 //[-1.0, 0.0]
let array4 = array1 * 2.0 //[2.0, 4.0]
let array5 = array1 / 2.0 //[0.5, 1.0]
let array6 = array1 % 2.0 //[1.0, 0.0]

array1 += 2.0 //[3.0, 4.0]
array1 -= 2.0 //[1.0, 2.0]
array1 *= 2.0 //[2.0, 4.0]
array1 /= 2.0 //[1.0, 2.0]
array1 %= 2.0 //[1.0, 0.0]

-array1 //[-1.0, 0.0]
array1++ //[0.0, 1.0]
array1-- //[-1.0, 0.0]
```

Operator overloads for object comparison
------
* < (less than)
* > (greater than)
* <= (less equal than)
* >= (greater equal than)

#### Usage:
```swift
var num1 : NSNumber = 1.0
let num2 : NSNumber = 2.0

num1 < num2 //returns true
num1 > num2 //returns false
num1 <= num2 //returns true
num1 >= num2 //returns false
```

Operator overloads for batch object comparison on NSNumber arrays
------
* < (less than)
* > (greater than)
* <= (less equal than)
* >= (greater equal than)
* == (equals)
* != (not equals)

#### Usage:
```swift
var array1 : NSNumber = [1.0, 2.0]

array1 < 2.0 //returns false if one of the numbers does not match the condition
array1 > -1.0 //returns true if all numbers match the condition
array1 <= 3.0 //returns true if all numbers match the condition
array1 >= 1.5 //returns false if one of the numbers does not match the condition
array1 == 2.0 //returns false if one of the numbers does not match the condition
array1 != 3.0 //returns true if all numbers match the condition
```

Class function extensions for batch operations on NSNumber arrays
------
* squarePower(numbers: [NSNumber]) -> [NSNumber] 

⋅⋅⋅*modifies all NSNumbers in the array to their square power*

* squareRoot(numbers: [NSNumber]) -> [NSNumber]

⋅⋅⋅*modifies all NSNumbers in the array to their square power*

* sum(numbers: [NSNumber]) -> NSNumber

⋅⋅⋅*returns the sum of all NSnumbers in an array*

* average(numbers: [NSNumber]) -> NSNumber

⋅⋅⋅*returns the average of all NSnumbers in an array*

* maximum(numbers: [NSNumber]) -> NSNumber

⋅⋅⋅*returns the NSNumber with the maximum value in the array*

* minimum(numbers: [NSNumber]) -> NSNumber

⋅⋅⋅*returns the NSNumber with the minimum value in the array*

* limit(numbers: [NSNumber], minimum : NSNumber, maximum : NSNumber) -> [NSNumber]

⋅⋅⋅*limits all NSNumbers in an array to the lower and upper limits defined in the method*

* powerOf(numbers: [NSNumber], power : NSNumber) -> [NSNumber]

⋅⋅⋅*modifies all NSNumbers in an array to the power specified in the method*

* rootOf(numbers: [NSNumber], root : NSNumber) -> [NSNumber]

⋅⋅⋅*modifies all NSNumbers in an array to the root specified in the method*

#### Usage:
```swift
let array1 : NSNumber = [2, 10]

let array2 = NSNumber.squarePower(array1) // [4, 100]
let array3 = NSNumber.squareRoot(array2) // [2, 10]
let num1 = NSNumber.sum(array1) // 12
let num2 = NSNumber.average(array1) // 6
let num3 = NSNumber.maximum(array1) // 10
let num4 = NSNumber.minimum(array1) // 2
let array5 = NSNumber.limit(array1, minimum: 3, maximum: 9) // [3, 9]
let array6 = NSNumber.powerOf(array1, 2) // [4, 100]
let array7 = NSNumber.rootOf(array6, 2) // [2, 10]
```

function extensions for operations on NSNumbers
------
* squarePower : NSNumber 

⋅⋅⋅*returns the square power of the NSNumber*

* squareRoot : NSNumber

⋅⋅⋅*returns the square root of the NSNumber*

* maximum(number : NSNumber) -> NSNumber

⋅⋅⋅*returns the NSNumber with the highest value of two NSNumbers*

* minimum(number : NSNumber) -> NSNumber

⋅⋅⋅*returns the NSNumber with the lowest value of two NSNumbers*

* limit(#minimum : NSNumber, maximum : NSNumber) -> NSNumber

⋅⋅⋅*limits an NSNumbers to the lower and upper limits defined in the method*

* powerOf(number : NSNumber) -> NSNumber

⋅⋅⋅*returns the NSNumber to the power specified in the method*

* rootOf(number : NSNumber) -> NSNumber

⋅⋅⋅*returns the NSNumber to the root specified in the method*

#### Usage:
```swift
let num1 : NSNumber = 10

let num2 = num1.squarePower // 100
let num3 = num2.squareRoot // 10
let num5 = num1.maximum(102) // 102
let num6 = num1.minimum(5) // 5
let num7 = num1.limit(0, maximum: 5) // 5
let num8 = num1.powerOf(2) // 100
let num9 = num8.rootOf(2) // 10
```

This class serves as an extension to the tutorial of the blog article: ["Smarter Numbers"](http://epic-apps.uk/2015/05/04/smarter-numbers/).
Usage is free for all based on the attached license details, if you find this code useful, please consider [making a donation](http://epic-apps.uk/donations/). :)

Copyright (c) EPIC 
[www.epic-apps.uk](www.epic-apps.uk)



