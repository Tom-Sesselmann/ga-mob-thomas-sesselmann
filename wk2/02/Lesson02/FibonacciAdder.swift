//
//  FibonacciAdder.swift
//  Lesson02
//
//  Created by Thomas Sesselmann on 9/03/2015.
//  Copyright (c) 2015 General Assembly. All rights reserved.
//

import Foundation


class FibonacciAdder {
    
    func fibonacciNumberAtIndex(indexOfFibonacciNumber: Int) -> Int {
        
        var seq : [Int] = [0, 1]
        
        while seq.count < indexOfFibonacciNumber {
            seq.append(seq[seq.count-2] + seq[seq.count-1])
        }
        
        return seq[indexOfFibonacciNumber-1]
        
    }
    
}