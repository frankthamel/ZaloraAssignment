//
//  Constants.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/2/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import Foundation

// MARK: App Keys
/// This is the name of the app.
internal let APP_NAME : String = "Zalora Assignment"

/// This url scheme is used as the callback url for Twitter app.
internal let APP_URL_SCHEME : String = "ZaloraAssignment://"

/// This is the cunsumer key for the connected Twitter app.
internal let TWITTER_CONSUMER_KEY : String = "j5zeCmD26fpAPcjJYp37mEMbC"

/// This is the cunsumer  secret key for the connected Twitter app.
internal let TWITTER_CONSUMER_SECRET : String = "pOQKVT6YwNr6j9ai4sJx8AnGKHBq1HgOkKdtzUC9Ri8mUWoaJ5"


// MARK: Segues
/// This is the segue identifier of home navigation segue.
internal let NAVIGATE_TO_HOME_VIEW_CONTROLLER_SEGUE : String = "NavigateToHomeViewControllerSegue"

/// This is the segue identifier for the create-tweet-page navigation segue.
internal let NAVIGATE_TO_CREATE_TWEET_VIEW_CONTROLLER_SEGUE : String = "NavigateToCreateTweetViewControllerSegue"

/// This is the segue identifier for the signout navigation segue.
internal let NAVIGATE_TO_SIGN_IN_VIEW_CONTROLLER_SEGUE : String = "NavigateToSignInViewControllerSegue"


// MARK: View Controller Names
/// This is the identifier for the Home-Navigation-Controller
internal let HOME_VIEW_CONTROLLER_NAVIGATION_CONTROLLER : String = "HomeViewControllerNavigationController"

/// This is the identifier for the Home-Controller
internal let HOME_VIEW_CONTROLLER : String = "HomeViewController"


// MARK: Table view Cells
/// This is the identifier for the Home-Table-View-Cell
internal let HOME_TABLE_VIEW_CELL : String = "HomeTableViewCell"

/// This is the identifier for the Create-Tweet-Table-Cell
internal let CREATE_TWEET_TABLE_VIEW_CELL : String = "CreateTweetTableViewCell"
