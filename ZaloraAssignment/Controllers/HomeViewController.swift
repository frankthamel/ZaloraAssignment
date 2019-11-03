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

class HomeViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var createTweetButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    // Defining a dispose bag to dispose observables
    var disposeBag = DisposeBag()
    
    var homeViewModel : BehaviorRelay<HomeViewModel?> = BehaviorRelay(value: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup observers
        setupHomeViewModelObservable()
        bindCreateTweetButton()
        
        // setup view
        setupTableView()
    }
    
    private func setupHomeViewModelObservable() {
        homeViewModel.asObservable().subscribe(onNext: { (hvm) in
            if let homeViewModel = hvm {
                self.title = APP_NAME
                homeViewModel.configureView(profileImageView: self.profileImageView, profileNameLabel: self.profileNameLabel)
            }
        }, onError: { (error) in
            print(error)
        }, onCompleted: {
            print("Completed")
        }) {
            print("Disposed")
        }.disposed(by: disposeBag)
    }
    
    func bindCreateTweetButton() {
        createTweetButton.rx.tap.throttle(.milliseconds(500), scheduler: MainScheduler.instance).subscribe(onNext : {
           
            // Navigate to Create Tweet ViewController
            print("createTweetButton tapped")
            
        }).disposed(by: disposeBag)
    }
    
    private func setupTableView() {
        tableView.separatorColor = UIColor.clear
    }
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
