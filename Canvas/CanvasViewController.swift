//
//  CanvasViewController.swift
//  Canvas
//
//  Created by Parker, Bryan on 10/5/16.
//  Copyright © 2016 Parker, Bryan. All rights reserved.
//

import UIKit

class CanvasViewController: UIViewController {

    @IBOutlet weak var trayView: UIView!
    
    var trayOriginalCenter: CGPoint!
    var trayDownOffset: CGFloat!
    var trayUp: CGPoint!
    var trayDown: CGPoint!
    var newlyCreatedFace: UIImageView!
    var newlyCreatedFaceOriginalCenter: CGPoint!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        trayDownOffset = 160
        trayUp = trayView.center
        trayDown = CGPoint(x: trayView.center.x ,y: trayView.center.y + trayDownOffset)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPanTray(_ sender: UIPanGestureRecognizer) {

        let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        
//        print("translation \(translation)")

        if sender.state == UIGestureRecognizerState.began {
            print("Gesture began")
            trayOriginalCenter = trayView.center
        } else if sender.state == UIGestureRecognizerState.changed {
            print("Gesture is changing")
            trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
        } else if sender.state == UIGestureRecognizerState.ended {
            print("Gesture ended")
            if velocity.y > 0 {
                UIView.animate(withDuration: 0.3, animations: { () -> Void in
                    self.trayView.center = self.trayDown
                })
            } else {
                UIView.animate(withDuration: 0.3, animations: { () -> Void in
                    self.trayView.center = self.trayUp                 
                })
            }
        }
    }
    
    @IBAction func didPanFace(_ sender: UIPanGestureRecognizer) {
        
        if sender.state == UIGestureRecognizerState.began {
            var imageView = sender.view as! UIImageView.imageView
            newlyCreatedFace = UIImageView(image: imageView.image)
            view.addSubview(newlyCreatedFace)
            newlyCreatedFace.center = imageView.center
            newlyCreatedFace.center.y += trayView.frame.origin.y
            
        } else if sender.state == UIGestureRecognizerState.changed {
            
        } else if sender.state == UIGestureRecognizerState.ended {
            
        }
    }
    
    
    
}
