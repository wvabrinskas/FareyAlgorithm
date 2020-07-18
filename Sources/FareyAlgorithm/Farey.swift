public struct Fraction: Equatable {
  public var numerator: Int
  public var denominator: Int
  
  public var description: String {
    return "\(self.numerator)/\(self.denominator)"
  }
  
  public static func == (lhs: Fraction, rhs: Fraction) -> Bool {
    return
      lhs.denominator == rhs.denominator &&
      lhs.numerator == rhs.numerator
  }
  
  public init(numerator: Int, denominator: Int) {
    self.numerator = numerator
    self.denominator = denominator
  }
  
  /// Computes the value of the fraction
  /// - Returns: value of fraction as Float
  public func callAsFunction() -> Float {
    return Float(numerator) / Float(denominator)
  }
  
  /// Min value for Farey
  /// - Returns: Fraction with fraction of 0 and 1
  public static func min() -> Fraction {
    return Fraction(numerator: 0, denominator: 1)
  }
  
  /// Max value for Farey
  /// - Returns: Fraction with fraction of 1 and 1
  public static func max() -> Fraction {
    return Fraction(numerator: 1, denominator: 1)
  }

}

public struct Farey {
  /// Main function to get the fraction of the provided number
  /// - Parameters:
  ///   - number: number as Float to get the fraction representation.
  ///   - maxTries: max number of tries for the algorithm to loop before bailing out and returning a result
  /// - Returns: Fraction with denominator and numerator representing the given number as close as possible
  public static func get(number: Float, maxTries: Int = 1000) -> Fraction {
    var currentMin = Fraction.min()
    var currentMax = Fraction.max()
    var result = Fraction(numerator: 0, denominator: 1)
    
    for _ in 0..<maxTries {
      let newN = currentMin.numerator + currentMax.numerator
      let newD = currentMin.denominator + currentMax.denominator
      let value: Float = Float(newN) / Float(newD)
      
      result = Fraction(numerator: newN, denominator: newD)
      
      if number > value && number < currentMax() {
        let minF = Fraction(numerator: newN, denominator: newD)
        currentMin = minF
        
      } else if number < value && number > currentMin() {
        
        let maxF = Fraction(numerator: newN, denominator: newD)
        currentMax = maxF
        
      } else {
        return result
      }
    }
    return result
  }
}

