//
//  CaclulatorMVC.swift
//  test
//
//  Created by Madiyar Almen on 1/25/20.
//  Copyright © 2020 kbtu. All rights reserved.
//

import Foundation


class CalculatorMVC {
    // MARK: - Constants
    
    enum Operation {
        case equals
        case constant(value: Double)
        case unary(function: (Double) -> Double)
//        case unaryInt(function: (Int) -> Int)
        case binary(function: (Double, Double) -> Double)
    }
    
   static func factorial(a: Double) -> Double {
    if  a == 0  {
            return 1
    }
        return a * factorial(a: a-1)
    
    }
    
    var map: [String : Operation] = [
        "+" : .binary { $0 + $1 },
        "-" : .binary { $0 - $1 },
        "x" : .binary { $0 * $1 },
        "÷" : .binary { $0 / $1 },
        "x^y" : .binary { pow($0, $1) },
        "√" : .unary { $0.squareRoot() },
        "x!" : .unary { factorial( a: $0 ) },
        "%" : .unary { $0 / 100 },
        "Rand": .constant(value: Double.random( in: 0.0..<10000.0 )),
        "Pi": .constant(value:Double.pi),
        "=" : .equals,
    ]
        
    // MARK: - Variables
    
    var result: Double = 0
    var lastBinaryOperation: ((Double, Double) -> Double)?
    var reminder: Double = 0
    
    // MARK: - Methods
    
    func setOperand(number: Double) {
        result = number
    }
    
    func executeOperation(symbol: String) {
        guard let operation = map[symbol] else {
            print("ERROR 404: symbol not found")
            return
        }
        
        switch operation {

        case .constant(let value):
            result = value
        case .unary(let function):
            result = function(result)
        case .binary(let function):
         lastBinaryOperation = function
                    reminder = result
            
        case .equals:
            if let lastOperation = lastBinaryOperation {
                result = lastOperation(reminder, result)
                lastBinaryOperation = nil
                reminder = 0
            }
            

            
        }
    }

}


