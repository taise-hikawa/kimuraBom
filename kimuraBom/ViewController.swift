//
//  ViewController.swift
//  kimuraBom
//
//  Created by Sakurako Shimbori on 2020/06/25.
//  Copyright © 2020 Taisei Hikawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
        var count = 0
        let btn = UIButton()
        let btn2 = UIButton()
        var randomNum = 0
        var imgWidth = 300
        var imgHeight = 300
        let rect = CGRect(x:0,y: 0,width: 300,height: 300)
        let imageView = UIImageView(frame: CGRect(x:0,y: 0,width: 400,height: 400))
        let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        btn.frame  =  CGRect(x:((Int(self.view.bounds.width)-imgWidth)/2),y:((Int(self.view.bounds.height)-imgHeight)/2),width:imgWidth,height:imgHeight)
        btn.setImage(UIImage(named: "kimura"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.contentHorizontalAlignment = .fill
        btn.contentVerticalAlignment = .fill
        
        self.view.addSubview(btn)
        randomNum = Int.random(in: 1..<2)
        
        // タップされたときのactionをセット
        btn.addTarget(self, action: #selector(ViewController.buttonTapped(_:)),for: .touchUpInside)
        
        

    }
    
    // タップすると画像を大きくする
    @objc func buttonTapped(_ sender : Any) {
        count += 1
        
        if count < randomNum{
            imgHeight += 20
            imgWidth += 20
            btn.frame  =  CGRect(x:((Int(self.view.bounds.width)-imgWidth)/2),y:((Int(self.view.bounds.height)-imgHeight)/2),width:imgWidth,height:imgHeight)
        }else{
            randomNum = Int.random(in: 5..<16)
            btn.isHidden = true
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named: "kimura2")
            imageView.center = self.view.center
            self.view.addSubview(imageView)
            
            btn2.frame  =  CGRect(x:(self.view.bounds.width-200)/2,y:self.view.bounds.height-200,width:200,height:100)
            btn2.setTitle("りせっと", for: UIControl.State.normal)
            btn2.setTitleColor(UIColor.blue, for: .normal)
            btn2.titleLabel?.font = UIFont.systemFont(ofSize: 40)
            self.view.addSubview(btn2)
            
            
            self.view.bringSubviewToFront(label)
            label.text = "もっと飲めよ"
            label.frame = CGRect(x:(self.view.bounds.width-400)/2,y:(self.view.bounds.height-200)/2,width:self.view.bounds.width,height:200)
            label.textColor = UIColor.red
            label.font = UIFont.boldSystemFont(ofSize: 70)
            view.addSubview(label)
            label.textAlignment = NSTextAlignment.center
            label.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi*(10.0)/180.0))
            
        }
    }
        

}

