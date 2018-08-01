//
//  BasicAnimationVC.swift
//  AnimationBuilder
//
//  Created by Soufian Hossam on 8/1/18.
//  Copyright © 2018 Soufian Hossam. All rights reserved.
//

import UIKit

class BasicAnimationVC: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var animateBtn: UIButton!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - IBActions
    @IBAction func animateBtnHandler(_ sender: Any) {
        titleAnimation()
        emailTFAnimation()
        passwordTFAnimation()
        animateBtnAnimation()
    }
    
    // MARK: - Functions
    func titleAnimation() {
        // This will be a "fade in + rotation" animation
        AnimationBuilder(for: titleLbl)
            .alpha(0, 1)    // Setting initial alpha to 0 and final alpha to 1, to make "fade in" animaiton
            .rotate(90)     // Rotation angle in degrees
            .duration(1)    // The duration of the animation in seconds
            .execute(type: .transitional)
    }
    
    func emailTFAnimation() {
        // This will be a "slide from left" animation
        AnimationBuilder(for: emailTF)
            .translateX(-view.frame.width) // To shift the textField all the way to the left
            .damping(0.6)                  // Setting spring value to 0.4 to make it bouns
            .duration(1.2)
            .execute(type: .transitional)  // ".transional" to make the emailTF go back to it's original place
    }
    
    func passwordTFAnimation() {
        // This will be a "slide from right" animation
        AnimationBuilder(for: passwordTF)
            .translateX(view.frame.width) // To shift the textField all the way to the right
            .damping(0.6)
            .duration(1.2)
            .execute(type: .transitional)
    }
    
    func animateBtnAnimation() {
        // This will be a scalling animation with bouns
        AnimationBuilder(for: animateBtn)
            .scaleX(1.5) // Means scale view's width 1.5 times it's original width
            .scaleY(1.5) // Means scale view's height 1.5 times it's original height
            .damping(0.4)
            .duration(1)
            .options(.allowUserInteraction) // Allows the user to use the button while animating
            .execute(type: .transitional)
    }
}












