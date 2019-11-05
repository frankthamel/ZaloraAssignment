//
//  CreateTweetTableViewCell.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/4/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import UIKit

class CreateTweetTableViewCell: UITableViewCell {
    
    /// Message label that displays the sent Tweet message.
    @IBOutlet weak var messageLabel: UILabel!
    
    /// Indicator that indicates message status
    @IBOutlet weak var indicatorView: CustomUIView!
    
    /**
     This method is used to configure the table view cell.
     - Parameters:
     - tweetItemVM: CreateTweetItemViewModel
     
     - parameter tweetItemVM: This is the view model responsible for this cell view.
     
     ### Usage Example: ###
     ````
     configureCell(tweetItemVM: CreateTweetItemViewModel)
     
     ````
     */
    func configureCell(tweetItemVM: CreateTweetItemViewModel) {
        messageLabel.text = tweetItemVM.message
        indicatorView.backgroundColor = tweetItemVM.isSuccess ? #colorLiteral(red: 0.1411764706, green: 0.9490196078, blue: 0.2470588235, alpha: 1) : #colorLiteral(red: 0.9843137255, green: 0.3176470588, blue: 0.3176470588, alpha: 1)
    }
    
}
