//
//  CreateTweetTableViewCell.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/4/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import UIKit

class CreateTweetTableViewCell: UITableViewCell {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var indicatorView: CustomUIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(tweetItemVM: CreateTweetItemViewModel) {
        messageLabel.text = tweetItemVM.message
        indicatorView.backgroundColor = tweetItemVM.isSuccess ? #colorLiteral(red: 0.1411764706, green: 0.9490196078, blue: 0.2470588235, alpha: 1) : #colorLiteral(red: 0.9843137255, green: 0.3176470588, blue: 0.3176470588, alpha: 1)
    }


}
