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

class SignInViewController: UIViewController {
    
    @IBOutlet weak var signInWithTwitterButton: RoundedUIButton!
    
    // Defining a dispose bag to dispose observables
    var disposeBag = DisposeBag()
    
    //let signInViewModel : SignInViewModel
    let signInViewModel : SignInViewModel = SignInViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Bind UI Elements
        bindSignInWithTwitterButton()
    }
    
    func bindSignInWithTwitterButton() {
        signInWithTwitterButton.rx.tap.debounce(.seconds(1), scheduler: MainScheduler.instance).subscribe(onNext : { [unowned self] in
            // Authenticate using Twitter
            self.signInViewModel.authorize(inViewController: self)
            
        }).disposed(by: disposeBag)
    }
}
