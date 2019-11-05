//
//  FunctionalHelper.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/3/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import Foundation

/// This is a class that contains all the reusable functions.
class FunctionalHelper {
    
    /**
     This method is used to retrieve the app document path.
     
     ### Usage Example: ###
     ````
     FunctionalHelper().getDocumentsDirectory()
     
     ````
     */
    class func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        log.info("document directory path: \(documentsDirectory)")
        return documentsDirectory
    }
}
