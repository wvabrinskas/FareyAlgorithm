import XCTest
@testable import FareyAlgorithm

final class FareyAlgorithmTests: XCTestCase {
  
  /// Test Farey against known positive result
  func testKnownValue() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct
    // results.
    let expected = Fraction(numerator: 1, denominator: 2)
    let numToTest: Float = 0.5
    
    let result = Farey.get(number: numToTest)
    
    XCTAssertEqual(result, expected)
  }
  
  /// Test Farey against known negative result
  func testNegativeResult() {
    let notExpected = Fraction(numerator: 1, denominator: 3)
    let numToTest: Float = 0.5
    
    let result = Farey.get(number: numToTest)
    
    XCTAssertNotEqual(result, notExpected)
  }
  
  static var allTests = [
    ("testKnownValue", testKnownValue),
    ("testNegativeResult", testNegativeResult)
  ]
}
