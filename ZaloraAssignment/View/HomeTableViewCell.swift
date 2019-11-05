//
//  HomeTableViewCell.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/3/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    /// Message label that displays the fetched Tweet message.
    @IBOutlet weak var messageLabel: UILabel!
    
    /// This displays the fetched message identifier.
    @IBOutlet weak var messageIdentifierLabel: UILabel!
    
    /**
     This method is used to configure the table view cell.
     - Parameters:
     - tweet: TweetViewModel
     
     - parameter tweet: This is the view model responsible for this cell view.
     
     ### Usage Example: ###
     ````
     configureCell(tweet: TweetViewModel)
     
     ````
     */
    func configureCell(tweet: TweetViewModel) {
        messageLabel.text = tweet.mesasge
        messageIdentifierLabel.text = tweet.identifier
    }
    
}
