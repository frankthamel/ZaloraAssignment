//
//  String+Extension.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/3/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import Foundation

extension String {
    
    /**
     This function is used to replace the first occurrence of the given pattern with the given replacement.
     - Parameters:
     - pattern: String
     - replacement: String
     
     - parameter pattern: This is the pattern that needs to replaced.
     - parameter replacement: This is the replacement string.
     
     ### Usage Example: ###
     ````
     "***String".replaceFirst(of:"***",with:"")
     
     ````
     */
    public func replaceFirst(of pattern:String, with replacement:String) -> String {
        if let range = self.range(of: pattern){
            return self.replacingCharacters(in: range, with: replacement)
        }else{
            return self
        }
    }
}
