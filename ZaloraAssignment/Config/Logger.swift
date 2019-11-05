//
//  Logger.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/4/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import Foundation
import SwiftyBeaver

/// This class is used to setup 'SwiftyBeaver' logger inside the application.
class Logger {
    
    /**
     This function is used to setup the logger inside the application.
     Here it creates two destinations. One for the console and the other for recording logs inside a log file.
     
     ### Usage Example: ###
     ````
     Logger().setupLogger()
     
     ````
     */
    func setupLogger() {
        // add log destinations.
        let console = ConsoleDestination()
        let file = FileDestination()
        
        // use custom format and set console output to short time, log level & message
        console.format = "$DHH:mm:ss$d $L $M"
        
        // add the destinations to SwiftyBeaver
        log.addDestination(console)
        log.addDestination(file)
        
    }
}



