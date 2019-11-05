//
//  SignInViewController.swift
//  ZaloraAssignment
//
//  Created by Frank Emmanuel on 11/2/19.
//  Copyright © 2019 Frank Thamel. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SignInViewController: UIViewController,Connectivity {
    
    @IBOutlet weak var signInWithTwitterButton: RoundedUIButton!
    
    /// Defining a dispose bag to dispose observables
    var disposeBag = DisposeBag()
    
    /// This view model responsible for all the interactions inside the SignInViewController.
    let signInViewModel : SignInViewModel = SignInViewModel()
    
    /// override func viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Bind UI Elements
        bindSignInWithTwitterButton()
    }
    
    /**
     This function binds the signInWithTwitterButton.
     
     ### Usage Example: ###
     ````
     bindSignInWithTwitterButton()
     
     ````
     */
    func bindSignInWithTwitterButton() {
        signInWithTwitterButton.rx.tap.debounce(.seconds(1), scheduler: MainScheduler.instance).subscribe(onNext : { [unowned self] in
            // Authenticate using Twitter
            if self.isConnectedToInternet(inViewController: self) {
                self.signInViewModel.authorize(inViewController: self)
            }
            
        }).disposed(by: disposeBag)
    }
}
