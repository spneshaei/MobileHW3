//
//  Assistant.swift
//  MobileHW3
//
//  Created by Seyyed Parsa Neshaei on 6/8/21.
//

import Foundation

class Assistant {
    
    // MARK: Methods
    
    static func readNumber(from: Int , to: Int) -> Int?{
        let input = readLine()
        let numb = Int(input!) ?? (from - 1)
        if numb > to || numb < from{
            print("Invalid number... Try again later")
            return nil
        }
        return numb
    }
}
