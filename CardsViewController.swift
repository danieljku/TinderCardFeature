//
//  CardsViewController.swift
//  TinderCardFeature
//
//  Created by Daniel Ku on 8/3/17.
//  Copyright © 2017 djku. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var cardImageView: UIImageView!
    var cardInitialCenter: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didDragCard(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: view)
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            cardImageView.transform = CGAffineTransform(rotationAngle: CGFloat(0))
            cardInitialCenter = cardImageView.center
            
        } else if sender.state == .changed {
            let rotation = (translation.x > 0) ? CGFloat(0.018) : CGFloat(-0.018)

            if translation.x > 100 {
                UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options:[] , animations: { () -> Void in
                    self.cardImageView.center = CGPoint(x: CGFloat(1000) , y: self.cardImageView.center.y)
                }, completion: nil)
            } else if translation.x < -100 {
                UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options:[] , animations: { () -> Void in
                    self.cardImageView.center = CGPoint(x: CGFloat(-1000) , y: self.cardImageView.center.y)
                }, completion: nil)
            }
        
            
            
            if location.y < cardImageView.center.y {
                cardImageView.transform = cardImageView.transform.rotated(by: rotation)
            } else {
                cardImageView.transform = cardImageView.transform.rotated(by: -1 * rotation)
            }
            
            cardImageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y + translation.y)
            
        } else if sender.state == .ended {
            cardImageView.center = cardInitialCenter
            cardImageView.transform = CGAffineTransform.identity
        }
        
        
    }



}
