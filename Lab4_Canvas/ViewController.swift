//
//  ViewController.swift
//  Lab4_Canvas
//
//  Created by Ian Campelo on 11/7/16.
//  Copyright © 2016 Ian Campelo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var trayView: UIView!
    
    var trayOriginalCenter: CGPoint!
    var trayCenterWhenOpen: CGFloat!
    var trayCenterWhenClosed: CGFloat!
    var newlyCreatedFace: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trayCenterWhenOpen = 280
        trayCenterWhenClosed = 470
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func onTrayEmoticon(_ sender: UIPanGestureRecognizer) {
        
        let imgView = sender.view as! UIImageView
        
        newlyCreatedFace = UIImageView(image: imgView.image)
        
        let point = sender.location(in: trayView)
        
        if sender.state == .ended{
            newlyCreatedFace.center = point
            view.addSubview(newlyCreatedFace)
        }
    }

    @IBAction func onTrayPanGesture(_ sender: UIPanGestureRecognizer) {
        
        let velocity = sender.velocity(in: trayView)
        
        trayOriginalCenter = trayView.center
        if(velocity.y > 0){
            
            UIView.animate(withDuration: 0.3){
                self.trayView.center = CGPoint(x: self.trayOriginalCenter.x, y: self.trayCenterWhenClosed)
            }
        }else{
            UIView.animate(withDuration: 0.3){
                self.trayView.center = CGPoint(x: self.trayOriginalCenter.x, y: self.trayCenterWhenOpen)
            }
        }
    }
}

//let point = sender.location(in: trayView)
//let translation = sender.translation(in: trayView)
//let velocity = sender.velocity(in: trayView)

/*
        if sender.state == .began {
            print("Gesture began at: x-\(point.x), y-\(point.y)")
          
        } else if sender.state == .changed {
            print("Gesture changed at: x-\(point.x), y-\(point.y)")
            trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
        } else if sender.state == .ended {
            print("Gesture ended at: x-\(point.x), y-\(point.y)")
        }
        */
