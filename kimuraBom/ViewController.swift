//
//  ViewController.swift
//  kimuraBom
//
//  Created by Sakurako Shimbori on 2020/06/25.
//  Copyright © 2020 Taisei Hikawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
        //タップ回数(count)を設定
        var count = 0
        //btn,btn2のインスタンスを生成
        let btn = UIButton()
        let btn2 = UIButton()
        //画面切り替えまでのタップ回数を設定
        var randomNum = 0
        //画像ボタンの縦横設定
        var imgWidth = 300
        var imgHeight = 300
        //画像のインスタンスを生成
        let imageView = UIImageView(frame: CGRect(x:0,y: 0,width: 400,height: 400))
        //labelのインスタンスを生成
        let label = UILabel()
    
        let textLabel = ["もっと飲めよ","足りてないよ","あと１０杯♡","はい飲んで♡"]
        var randomNum2 = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //タップ上限回数をランダムに設定
        randomNum = Int.random(in: 5..<16)
        randomNum2 = Int.random(in: 0..<4)
        //画像ボタン(btn)の設定
        btn.frame  =  CGRect(x:((Int(self.view.bounds.width)-imgWidth)/2),y:((Int(self.view.bounds.height)-imgHeight)/2),width:imgWidth,height:imgHeight)
        btn.setImage(UIImage(named: "kimura"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.contentHorizontalAlignment = .fill
        btn.contentVerticalAlignment = .fill
        self.view.addSubview(btn)
        // タップされたときのactionをセット
        btn.addTarget(self, action: #selector(ViewController.buttonTapped(_:)),for: .touchUpInside)
        
        //リセットボタン(btn2)の設定
        btn2.frame  =  CGRect(x:(self.view.bounds.width-200)/2,y:self.view.bounds.height-200,width:200,height:100)
        btn2.setTitle("りせっと", for: UIControl.State.normal)
        btn2.setTitleColor(UIColor.blue, for: .normal)
        btn2.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        self.view.addSubview(btn2)
        // タップされたときのactionをセット
        btn2.addTarget(self, action: #selector(ViewController.button2Tapped(_:)),for: .touchUpInside)
        //リセットボタンを非表示
        btn2.isHidden = true

        //画像(imagView)の設定
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "kimura2")
        imageView.center = self.view.center
        self.view.addSubview(imageView)
        //画像を非表示
        imageView.isHidden = true
        
        //ラベル(label)の設定
        self.view.bringSubviewToFront(label)
        label.text = textLabel[randomNum2]
        label.frame = CGRect(x:(self.view.bounds.width-400)/2,y:(self.view.bounds.height-200)/2,width:self.view.bounds.width,height:200)
        label.textColor = UIColor.red
        label.font = UIFont.boldSystemFont(ofSize: 70)
        view.addSubview(label)
        label.textAlignment = NSTextAlignment.center
        label.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi*(10.0)/180.0))
        //ラベルを非表示
        label.isHidden = true
        

    }
    
    // タップすると画像を大きくする
    @objc func buttonTapped(_ sender : Any) {
        //タップ回数を設定
        count += 1
        //タップ上限回数以上か小さいかによって動作を変更
        if count < randomNum{
            //画像を大きくする
            imgHeight += 50
            imgWidth += 50
            btn.frame  =  CGRect(x:((Int(self.view.bounds.width)-imgWidth)/2),y:((Int(self.view.bounds.height)-imgHeight)/2),width:imgWidth,height:imgHeight)
        }else{
            //画像ボタンを非表示
            btn.isHidden = true
            //リセットボタンを表示
            btn2.isHidden = false
            //画像を表示
            imageView.isHidden = false
            //ラベルを非表示
            label.isHidden = false
            
            
        }
    }
    
    @objc func button2Tapped(_ sender : Any) {
        //画像ボタンを表示
        btn.isHidden = false
        //リセットボタンを非表示
        btn2.isHidden = true
        //画像を非表示
        imageView.isHidden = true
        //ラベルを非表示
        label.isHidden = true
        
        //画像ボタンの大きさを初期値に戻す
        imgWidth = 300
        imgHeight = 300
        btn.frame  =  CGRect(x:((Int(self.view.bounds.width)-imgWidth)/2),y:((Int(self.view.bounds.height)-imgHeight)/2),width:imgWidth,height:imgHeight)
        
        randomNum2 = Int.random(in: 0..<4)
        label.text = textLabel[randomNum2]
        //タップ上限回数をランダムに設定
        randomNum = Int.random(in: 5..<16)
        //タップ回数を０に戻す
        count = 0
        // タップされたときのactionをセット
        btn.addTarget(self, action: #selector(ViewController.buttonTapped(_:)),for: .touchUpInside)
        
    }
        

}

