//
//  ViewController.swift
//  led
//
//  Created by Loc Tran on 2/10/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numBall: UITextField!
    
    let marginX: CGFloat = 40
    let marginY: CGFloat = 70
    var lastOnLed = 0
    var running = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func drawBallButton(_ sender: Any) {
        removeSubView()
        drawBall()
        
    }
    
    @IBAction func simpleLedButton(_ sender: Any) {
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(ViewController.runningLedSimple), userInfo: nil, repeats: true)
    }
    
    @IBAction func advanceLedButton(_ sender: Any) {
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(ViewController.runningLedAdvance), userInfo: nil, repeats: true)
    }
    
    
    func runningLedSimple(){
        
        let n = Int(numBall.text!)!
        if running == 1{
            if (lastOnLed != 0){
                turnOffLed()
            }
            
            if (lastOnLed != n){
                lastOnLed = lastOnLed + 1
            }else{
                running = -1
            }
            turnOnLed()
        }
        if running == -1{
            if (lastOnLed == n){
                turnOffLed()
            }
            if (lastOnLed != n){
                turnOffLed()
            }
            
            if (lastOnLed != 0){
                lastOnLed = lastOnLed - 1
                turnOnLed()
            }else{
                running = 1
            }
            turnOnLed()
        }
    }
    
    func turnOnLed(){
        if let ball = self.view.viewWithTag(100 + lastOnLed) as? UIImageView{
            ball.image = UIImage(named: "green")
        }
    }
    
    func turnOffLed(){
        if let ball = self.view.viewWithTag(100 + lastOnLed) as? UIImageView{
            ball.image = UIImage(named: "grey")
        }
    }
    
    func runningLedAdvance(){
        let n = Int(numBall.text!)!
        
        var Top = 1
        var Left = 1
        var Right = n
        var Bottom = n
//
//        while (Top <= Bottom && Left <= Right){
//            if (running == 1){ //chay sang phai
//                for i in Left...Right{
//                    Top += 1
//                }
//                if (lastOnLed != 0){
//                    turnOffLed()
//                }
//                if(lastOnLed != n){
//                    lastOnLed += 1
//                }
//                else{
//                    running = 2
//                }
//                turnOnLed()
//            }
//            if running == 2{ //chay xuong
//                for i in Top...Bottom{
//                    Right -= 1
//                }
//                if (lastOnLed == n){
//                    turnOffLed()
//                }
//                if (lastOnLed != n){
//                    turnOffLed()
//                }
//                if (lastOnLed != n*n){
//                    lastOnLed += n
//                }
//                else{
//                    running = 3
//                }
//                turnOnLed()
//            }
//            if (running == 3){
//                for i in (Right*(-1))...(Left*(-1)){
//                    Bottom -= 1
//                }
//                if (lastOnLed == n*n){
//                    turnOffLed()
//                }
//                if (lastOnLed != n*n){
//                    turnOffLed()
//                }
//                if (lastOnLed != n*n - n + 1){
//                    lastOnLed -= 1
//                }
//                else{
//                    running = 4
//                }
//                turnOnLed()
//            }
//            if (running == 4){
//                for i in (Bottom*(-1))...(Top*(-1)){
//                    Left += 1
//                }
//                if (lastOnLed == n*n - n + 1){
//                    turnOffLed()
//                }
//                if (lastOnLed != n*n - n + 1){
//                    turnOffLed()
//                }
//                if (lastOnLed != 1){
//                    lastOnLed -= n
//                }
//                else{
//                    running = 1
//                }
//                turnOnLed()
//            }
//        }
        
        if (running == 1){
            if (lastOnLed != 0){
                turnOffLed()
            }
            if(lastOnLed != n){
                lastOnLed += 1
            }
            else{
                running = 2
            }
            turnOnLed()
        }
        if running == 2{
            if (lastOnLed == n){
                turnOffLed()
            }
            if (lastOnLed != n){
                turnOffLed()
            }
            if (lastOnLed != n*n){
                lastOnLed += n
            }
            else{
                running = 3
            }
            turnOnLed()
        }
        if (running == 3){
            if (lastOnLed == n*n){
                turnOffLed()
            }
            if (lastOnLed != n*n){
                turnOffLed()
            }
            if (lastOnLed != n*n - n + 1){
                lastOnLed -= 1
            }
            else{
                running = 4
            }
            turnOnLed()
        }
        if (running == 4){
            if (lastOnLed == n*n - n + 1){
                turnOffLed()
            }
            if (lastOnLed != n*n - n + 1){
                turnOffLed()
            }
            if (lastOnLed != 1){
                lastOnLed -= n
            }
            else{
                running = 1
            }
            turnOnLed()
        }
    }
    
    func drawBall(){
        
        let n = Int(numBall.text!)!
        var count = 0
        
        for indexY in 0..<n{
            for indexX in 0..<n{
                count += 1
                let image = UIImage(named: "green")
                let ball =  UIImageView(image: image)
                ball.tag = 100 + count
                ball.center = CGPoint(x: marginX + CGFloat(indexX) * spaceX(), y: marginY + CGFloat(indexY) * spaceY())
                self.view.addSubview(ball)
                print(ball.tag)
            }
        }
    }
    
    func removeSubView(){
        let subViews = self.view.subviews
        for subView in subViews{
            if subView.tag >= 100{
                subView.removeFromSuperview()
            }
        }
    }
    
    func spaceX() -> CGFloat{
        let n = Int(numBall.text!)!

        let space = (self.view.bounds.size.width - 2 * marginX)/CGFloat(n-1)
        return space
    }
    
    func spaceY() -> CGFloat{
        let n = Int(numBall.text!)!

        let space = (self.view.bounds.size.height - 2 * marginY)/CGFloat(n-1)
        return space
    }
}

