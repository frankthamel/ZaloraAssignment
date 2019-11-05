//
//  CreateTweetViewController.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/3/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CreateTweetViewController: UIViewController, Alert, Connectivity {
    
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var clearButton: UIView!
    @IBOutlet weak var closeButton: RoundedUIButton!
    @IBOutlet weak var tweetButton: RoundedUIButton!
    @IBOutlet weak var characterCountLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageContainerView: CustomUIView!
    
    // Defining a dispose bag to dispose observables
    var disposeBag = DisposeBag()
    
    let createTweetViewModel : CreateTweetViewModel = CreateTweetViewModel()
    
    /// override viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindDismissKeyboard()
        bindTweetButton()
        bindCharacterCountlabel()
        bindClearButton()
        bindCloseButton()
        
        // setup view
        setupTableView()
        createTweetViewModel.bindDataSource(tableView: tableView)
    }
    
    /**
     This function binds the tweetButton.
     
     ### Usage Example: ###
     ````
     bindTweetButton()
     
     ````
     */
    private func bindTweetButton() {
        tweetButton.rx.tap.debounce(.seconds(2), scheduler: MainScheduler.instance).subscribe(onNext : { [weak self] in
            guard (self?.isConnectedToInternet(inViewController: self))! else {
                return
            }
            
            self?.tweetButton.isUserInteractionEnabled = false
            self?.createTweetViewModel.postTweet(message: self?.messageTextView.text ?? "") { (completed , success , error) in
                
                if let error = error {
                    self?.messageContainerView.layer.borderColor = #colorLiteral(red: 0.998462975, green: 0.207790792, blue: 0.2040672898, alpha: 1)
                    self?.showAlert(message: error.errorDescription ?? "Error in message text.", withTitle: "Error", inViewController: self, withHandler: { (action) in
                        self?.messageContainerView.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
                    })
                    log.error(error.errorDescription ?? "Error in message text.")
                }
                
                if completed {
                    self?.tweetButton.isUserInteractionEnabled = true
                }
                
                if success {
                    self?.messageTextView.text = ""
                }
            }
        }).disposed(by: disposeBag)
    }
    
    /**
     This function binds the messageTextView to characterCountLabel.
     
     ### Usage Example: ###
     ````
     bindCharacterCountlabel()
     
     ````
     */
    private func bindCharacterCountlabel() {
        messageTextView.rx.text
            .map {
                if let msg = $0 {
                    return "Character count: \(msg.count)"
                } else {
                    return ""
                }
        }
        .bind(to: characterCountLabel.rx.text).disposed(by: disposeBag)
    }
    
    /**
     This function binds the swipeGesture to messageTextView.
     
     ### Usage Example: ###
     ````
     bindClearButton()
     
     ````
     */
    private func bindClearButton() {
        let swipeGesture = UISwipeGestureRecognizer()
        swipeGesture.direction = .left
        clearButton.addGestureRecognizer(swipeGesture)
        swipeGesture.rx.event.bind {[weak self] (gesture) in
            if gesture.direction == .left {
                self?.messageTextView.text = ""
            }
        }.disposed(by: disposeBag)
    }
    
    /**
     This function binds the closeButton.
     
     ### Usage Example: ###
     ````
     bindCloseButton()
     
     ````
     */
    private func bindCloseButton() {
        closeButton.rx.tap.subscribe(onNext : {  [ weak self ] in
            _ = self?.navigationController?.popViewController(animated: true)
        }).disposed(by: disposeBag)
    }
    
    /**
     This function binds tap-Gesture to dismiss the keyboard.
     
     ### Usage Example: ###
     ````
     bindDismissKeyboard()
     
     ````
     */
    private func bindDismissKeyboard() {
        let tapGesture = UITapGestureRecognizer()
        self.view.addGestureRecognizer(tapGesture)
        tapGesture.rx.event.bind {[weak self] (gesture) in
            self?.messageTextView.resignFirstResponder()
        }.disposed(by: disposeBag)
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
        tableView.estimatedRowHeight = 40.0
        tableView.rowHeight = UITableView.automaticDimension
    }
}


