//
//  Logger.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/4/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import Foundation
import SwiftyBeaver

class Logger {
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



