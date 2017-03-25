//
//  ViewController.swift
//  LoopSwift3
//
//  Created by Quang Bach on 3/25/17.
//  Copyright © 2017 QuangBach. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var _margin: CGFloat = 60
    
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func show(){
        // liệt kê tất cả các phần tử view trong subview,nếu view đó là UIImageView thì remove nó khỏi SuperView
        for v in view.subviews {
            if v.isKind(of: UIImageView.self) {
                v.removeFromSuperview()
            }
        }
        let n = Int(textField.text!)
        drawRowOfBall(n: n!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    
    
    func drawRowOfBall(n: Int){
        
        for indexHang in 0..<n {
            for indexCot in 0..<n {
                let image = UIImage(named: "green")
                let ball = UIImageView(image: image)
                view.willRemoveSubview(ball)
                ball.center = CGPoint(x: _margin + CGFloat(indexHang) * spaceBetweenBall(n: n), y: _margin + CGFloat(indexCot) * spaceBetweenBallHeight(n: n))
                self.view.addSubview(ball)
            }
        }
    }
    //khoang cach width
    func spaceBetweenBall(n: Int) -> CGFloat {
        let space = (self.view.bounds.size.width - CGFloat(2*_margin))/CGFloat(n - 1)
        return space
    }
    //khoang cach height
    func spaceBetweenBallHeight(n: Int) -> CGFloat {
        let space = (self.view.bounds.size.height - CGFloat(2*_margin))/CGFloat(n - 1)
        return space
    }
    
}

