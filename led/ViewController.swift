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
    
    
    func drawBall(){
        
        let n = Int(numBall.text!)!
        
        for indexX in 0..<n{
            for indexY in 0..<n{
                let image = UIImage(named: "green")
                let ball =  UIImageView(image: image)
                ball.tag = 100
                ball.center = CGPoint(x: marginX + CGFloat(indexX) * spaceX(), y: marginY + CGFloat(indexY) * spaceY())
                self.view.addSubview(ball)
            }
        }
    }
    
    func removeSubView(){
        let subViews = self.view.subviews
        for subView in subViews{
            if subView.tag == 100{
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

