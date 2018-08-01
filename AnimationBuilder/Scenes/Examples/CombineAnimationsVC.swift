//
//  CombineAnimationsVC.swift
//  AnimationBuilder
//
//  Created by Soufian Hossam on 8/1/18.
//  Copyright © 2018 Soufian Hossam. All rights reserved.
//

import UIKit

class CombineAnimationsVC: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var cardView: UIView!
    
    // MARK: - View life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        animateCardView()
    }

    // MARK: - Functions
    func animateCardView() {
        // Here we will combine some animations to show our card view
        AnimationBuilder(for: cardView)
            .translateX(-view.frame.width)
            .translateY(-view.frame.height)
            .rotate(-90)
            .damping(0.7)
            .initialVeclocity(1)
            .options(.curveEaseOut)
            .duration(0.5)
        .execute(type: .transitional)
    }
    
    func dismissAnimation() {
        // Remove animation
        AnimationBuilder(for: cardView)
            .alpha(1, 0)
            .translateX(view.frame.width)
            .damping(0.8)
            .initialVeclocity(1)
            .options(.curveEaseOut)
            .duration(0.2)
            .execute(type: .permanent, completion: { // to dismiss VC after ".permanent" animation
                self.dismiss(animated: true)
            })
    }
    
    // MARK: - IBActions
    @IBAction func dismissBtnHandler(_ sender: Any) {
        dismissAnimation()
    }
}









