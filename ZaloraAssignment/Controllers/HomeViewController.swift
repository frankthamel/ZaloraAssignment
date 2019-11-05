//
//  HomeViewController.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/3/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController, Connectivity {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var createTweetButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var signOutButton: UIBarButtonItem!
    
    // Defining a dispose bag to dispose observables
    var disposeBag = DisposeBag()
    
    var homeViewModel : BehaviorRelay<HomeViewModel?> = BehaviorRelay(value: nil)
    var tweetListViewModel : TweetListViewModel = TweetListViewModel()
    
    /// override func viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup observers
        setupHomeViewModelObservable()
        bindCreateTweetButton()
        bindSignOutButton()
        
        // setup view
        setupTableView()
        tweetListViewModel.bindDataSource(tableView: tableView)
    }
    
    /// override func viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if isConnectedToInternet(inViewController: self) {
            tweetListViewModel.fetchTweets(tableView: tableView)
        }
        
    }
    
    /**
     This function setup the home view model as an observable to refresh UI when the model changes.
     
     ### Usage Example: ###
     ````
     setupHomeViewModelObservable()
     
     ````
     */
    private func setupHomeViewModelObservable() {
        homeViewModel.asObservable().subscribe(onNext: {  [ unowned self ] (hvm) in
            if let homeViewModel = hvm {
                self.title = APP_NAME
                homeViewModel.configureView(profileImageView: self.profileImageView, profileNameLabel: self.profileNameLabel)
            }
            }, onError: { (error) in
                log.error(error.localizedDescription)
        }, onCompleted: {
            log.info("Completed")
        }) {
            log.info("Disposed")
        }.disposed(by: disposeBag)
    }
    
    /**
     This function binds the createTweetButton.
     
     ### Usage Example: ###
     ````
     bindCreateTweetButton()
     
     ````
     */
    private func bindCreateTweetButton() {
        createTweetButton.rx.tap.throttle(.milliseconds(500), scheduler: MainScheduler.instance).subscribe(onNext : {  [ weak self ] in
            
            // Navigate to Create Tweet ViewController
            self?.performSegue(withIdentifier: NAVIGATE_TO_CREATE_TWEET_VIEW_CONTROLLER_SEGUE, sender: nil)
            
        }).disposed(by: disposeBag)
    }
    
    /**
     This function binds the sign out button.
     
     ### Usage Example: ###
     ````
     bindSignOutButton()
     
     ````
     */
    private func bindSignOutButton() {
        signOutButton.rx.tap.throttle(.milliseconds(500), scheduler: MainScheduler.instance).subscribe(onNext : {  [ weak self ] in
            
            // Navigate to SignIn ViewController
            _ = TwitterService()
            self?.performSegue(withIdentifier: NAVIGATE_TO_SIGN_IN_VIEW_CONTROLLER_SEGUE, sender: nil)
            
        }).disposed(by: disposeBag)
    }
    
    /**
     This function is responsible for setup the posted tweets table view.
     
     ### Usage Example: ###
     ````
     setupTableView()
     
     ````
     */
    private func setupTableView() {
        tableView.separatorColor = UIColor.clear
        tableView.estimatedRowHeight = 75.0
        tableView.rowHeight = UITableView.automaticDimension
        
        //pull to refresh
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.tintColor = #colorLiteral(red: 0.1764705882, green: 0.662745098, blue: 0.9921568627, alpha: 1)
        tableView.refreshControl?.attributedTitle = NSAttributedString(string: "Fetching Tweets ...", attributes: .none)
        tableView.refreshControl?.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
    
    /**
     This function is responsible for refreshing table data.
     
     ### Usage Example: ###
     ````
     refreshData()
     
     ````
     */
    @objc func refreshData() {
        if isConnectedToInternet(inViewController: self) {
            tableView.refreshControl?.attributedTitle = NSAttributedString(string: "Fetching Tweets ...", attributes: .none)
            tweetListViewModel.fetchTweets(tableView: tableView)
        } else {
            tableView.refreshControl?.attributedTitle = NSAttributedString(string: "No internet connection", attributes: .none)
        }
    }
    
}
