//
//  MessageFormatter.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/3/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import Foundation

/// This is a struct that can be used to split a given message into a provided length sub-messages.
struct MessageFormatter {
    
    private let CHARACTER_LIMIT : Int = 50
    
    /// This struct is used to store text and its status.
    struct Word {
        let text : String
        var isAdded : Bool
    }
    
    /**
     This function can be used to split a given message into a provided length sub-messages. An identifier appends as a prefix for each sub-messages.
     - Parameters:
     - source: String
     
     - parameter source: This is the source message that needs to split into multiple parts.
     
     ### Usage Example: ###
     ````
     let messages : [String] = try! splitSubMessagesUsing(source : "String")
     
     ````
     */
    func splitSubMessagesUsing(source : String) throws -> [String] {
        
        guard source.count > 0 else {
            throw MessageSplittingError.emptyMessageError(message: "Message cannot be blank!")
        }
        
        // if message count less than CHARACTER_LIMIT return as it is
        guard source.count > CHARACTER_LIMIT else {
            return [source]
        }
        
        var words : [Word] = source.split(separator: " ").map {   Word(text: "\($0)", isAdded: false) }
        words.append(Word(text: "", isAdded: false))
        
        var messges : [String]  = []
        var messgesModified : [String] = []
        var messageString : String = ""
        var partIndicatorSeperatorLength : Int = 1 // '/' for seperator
        var partIndicatorFromString : String = "*"
        
        func messageSeperator() throws {
            words = source.split(separator: " ").map {   Word(text: "\($0)", isAdded: false) }
            words.append(Word(text: "", isAdded: false))
            
            messges = [String]()
            messageString = ""
            var isIndicatorAdded = false
            var messagePrefix : String = ""
            for i in 0..<words.count {
                
                let mesasgeIndicator : String = "\(messges.count + 1)"
                if messges.count > 0 && (partIndicatorFromString.count <  mesasgeIndicator.count) {
                    partIndicatorFromString += "*"
                    do {
                        try messageSeperator()
                        return
                    } catch {
                        throw error
                    }
                }
                
                if !isIndicatorAdded {
                    messagePrefix = "\(messges.count + 1)/\(partIndicatorFromString)"
                    messageString = messagePrefix
                    isIndicatorAdded = true
                }
                
                if words[i].text.count > CHARACTER_LIMIT || (((CHARACTER_LIMIT - 1) - messagePrefix.count) < words[i].text.count){
                    throw MessageSplittingError.characterLimitError(message: "Word '\(words[i].text)' can not send via messenger.")
                }
                
                if i>0 && !words[i-1].isAdded && ((CHARACTER_LIMIT - 1) - messageString.count >= words[i-1].text.count) {
                    messageString += " \(words[i-1].text)"
                    words[i-1].isAdded = true
                }
                
                // reducing one for the traling space
                if i < words.count {
                    if (((CHARACTER_LIMIT - 1) - messageString.count) >= words[i].text.count) {
                        if !words[i].isAdded {
                            messageString += " \(words[i].text)"
                            words[i].isAdded = true
                        }
                    } else if (messageString.count > 0) {
                        isIndicatorAdded = false
                        messges.append(messageString)
                        messageString = ""
                    }
                }
            }
        }
        
        do {
            try messageSeperator()
        } catch {
            log.error(error.localizedDescription)
            throw error
        }
        
        if messageString.count > 0 && messageString.split(separator: " ").count > 1 {
            messges.append(messageString)
            messageString = ""
        }
        
        messgesModified = messges.map{$0.replaceFirst(of: partIndicatorFromString, with: "\(messges.count)")}
        
        return messgesModified
    }
    
}

/// This is a custom error that used in MesageFormatter.
enum MessageSplittingError : Error {
    case characterLimitError(message : String)
    case emptyMessageError (message : String)
    
    var errorDescription: String? {
        switch self {
        case let .characterLimitError(message), let .emptyMessageError(message):
            return message
        }
    }
}
