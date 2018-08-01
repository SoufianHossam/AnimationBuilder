//
//  ChainAnimationVC.swift
//  AnimationBuilder
//
//  Created by Soufian Hossam on 8/1/18.
//  Copyright © 2018 Soufian Hossam. All rights reserved.
//

import UIKit

class ChainAnimationVC: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var animateBtn: UIButton!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideAllComponents()
        startChainAnimation()
    }
    
    // MARK: - IBActions
    @IBAction func animateBtnHandler(_ sender: Any) {
        hideAllComponents()
        startChainAnimation()
    }
    
    // MARK: - Functions
    func hideAllComponents() {
        titleLbl.alpha = 0
        emailTF.alpha = 0
        passwordTF.alpha = 0
        animateBtn.alpha = 0
    }
    
    func startChainAnimation() {
        titleAnimation()
    }
    
    func titleAnimation() {
        // Here we use the completion block of the animation to start a new one
        AnimationBuilder(for: titleLbl)
            .translateY(-view.frame.height)
            .damping(0.8)
            .duration(1)
            .execute(type: .transitional, completion: {
                self.emailTFAnimation()
            })
    }
    
    func emailTFAnimation() {
        AnimationBuilder(for: emailTF)
            .translateY(-view.frame.height)
            .damping(0.8)
            .duration(0.8)
            .execute(type: .transitional, completion: {
                self.passwordTFAnimation()
            })
    }
    
    func passwordTFAnimation() {
        AnimationBuilder(for: passwordTF)
            .translateY(-view.frame.height)
            .damping(0.8)
            .duration(0.8)
            .execute(type: .transitional, completion: {
                self.animateBtnAnimation()
            })
    }
    
    func animateBtnAnimation() {
        AnimationBuilder(for: animateBtn)
            .translateY(view.frame.height)
            .damping(0.8)
            .duration(0.8)
            .execute(type: .transitional)
    }
}










