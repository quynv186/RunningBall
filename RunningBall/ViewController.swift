//
//  ViewController.swift
//  RunningBall
//
//  Created by admin on 10/21/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var ball = UIImageView()
    var radians = CGFloat()
    var ballRadious = CGFloat()
    var deltaAngel = CGFloat()
    
    var moveX = CGFloat()
    var moveY = CGFloat()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        deltaAngel = 0.1
        ballRadious = 32.0
        moveX = ballRadious * deltaAngel
        moveY = ballRadious * deltaAngel
        
        addBall()
        
        Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(rollBall), userInfo: nil, repeats: true)
    }
    
    func addBall() {
        let mainViewSize = self.view.bounds.size
        ball = UIImageView(image: UIImage(named: "ball2.png"))
        
        ball.center = CGPoint(x: mainViewSize.width * 0.1, y: mainViewSize.height * 0.5)
        
        self.view.addSubview(ball)
        
    }
    
    func rollBall() {
        if (ball.center.x + ballRadious >= self.view.bounds.size.width) || (ball.center.x - ballRadious <= 0) {
            radians = 0
            deltaAngel = -deltaAngel
            moveX = -moveX
        }
        
        if (ball.center.y + ballRadious >= self.view.bounds.size.height) || (ball.center.y - ballRadious <= 0) {
            radians = 0
            deltaAngel = -deltaAngel
            moveY = -moveY
        }
        
        radians = radians + deltaAngel
        ball.transform = CGAffineTransform(rotationAngle: radians)
        ball.center = CGPoint(x: ball.center.x + moveX, y: ball.center.y + moveY)
    }


}

