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
    //画像ボタンの倍率
    var imageRatio = 0.3
    //画像のインスタンスを生成
    let imageView = UIImageView(frame: CGRect(x:0,y: 0,width: 400,height: 400))
    //labelのインスタンスを生成
    let label = UILabel()
    //画像ボタン(btn)の縦幅、横幅の制約を格納する変数を設定
    var btnWidthAnchor : NSLayoutConstraint!
    var btnHeightAnchor : NSLayoutConstraint!
    //表示する文字のパターンを格納
    let textLabel = ["もっと飲めよ","足りてないよ","あと１０杯♡","はい飲んで♡"]
    //textLabelからどの文字を表示するか決定するrandomNum2を設定
    var randomNum2 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //タップ上限回数をランダムに設定
        randomNum = Int.random(in: 5..<16)
        //textLabelから表示する文字を決定するramdomNum2をランダムに設定
        randomNum2 = Int.random(in: 0..<4)
        
        //画像ボタン(btn)の設定
        btn.setImage(UIImage(named: "kimura"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btn)
        // btnの横方向の中心は、親ビューの横方向の中心と同じ
        btn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        // btnの縦方向の中心は、親ビューの縦方向の中心と同じ
        btn.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        // btnの幅は、親ビューの幅のimageRatio倍
        btnWidthAnchor = btn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: CGFloat(imageRatio))
        btnWidthAnchor.isActive = true
        // btnの高さは、親ビューの幅のimageRatio倍
        btnHeightAnchor = btn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: CGFloat(imageRatio))
        btnHeightAnchor.isActive = true
        //画像のアスペクト比を保つ
        btn.imageView?.contentMode = .scaleAspectFit
        // タップされたときのactionをセット
        btn.addTarget(self, action: #selector(ViewController.buttonTapped(_:)),for: .touchUpInside)
        
        //画像(imagView)の設定
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "kimura2")
        self.view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        // btn2の横方向の中心は、親ビューの横方向の中心と同じ
        imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        // btn2の縦方向の中心は、親ビューの縦方向の中心と同じ
        imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        // btn2の高さは、親ビューの幅のimageRatio倍
        imageView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        //画像を非表示
        imageView.isHidden = true
        
        //リセットボタン(btn2)の設定
        btn2.setTitle("りせっと", for: UIControl.State.normal)
        btn2.setTitleColor(UIColor.blue, for: .normal)
        self.view.addSubview(btn2)
        btn2.translatesAutoresizingMaskIntoConstraints = false
        // btn2の横方向の中心は、親ビューの横方向の中心と同じ
        btn2.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        // btn2の縦方向の中心は、親ビューの縦方向の中心と同じ
        btn2.centerYAnchor.constraint(equalTo: imageView.bottomAnchor,constant: 30).isActive = true
        //文字の大きさを設定
        btn2.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        // タップされたときのactionをセット
        btn2.addTarget(self, action: #selector(ViewController.button2Tapped(_:)),for: .touchUpInside)
        //リセットボタンを非表示
        btn2.isHidden = true
        
        
        
        //ラベル(label)の設定
        //最前面に表示
        self.view.bringSubviewToFront(label)
        //フォントサイズを横幅に合わせて可変に
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 80)
        //ラベルの文字を設定
        label.text = textLabel[randomNum2]
        label.textColor = UIColor.red
        //ラベルの表示
        self.view.addSubview(label)
        //ラベルのレイアウトの制約を設定
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true
        //中心揃えに
        label.textAlignment = NSTextAlignment.center
        //10°傾ける
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
            imageRatio += 0.07
            //画像ボタンの高さの制約と横幅の制約を削除
            view.removeConstraint(btnHeightAnchor)
            view.removeConstraint(btnWidthAnchor)
            //新たなimageRatioで高さと横幅の設定のmultiplierを再設定
            btnHeightAnchor = btnHeightAnchor.setMultiplier(CGFloat(imageRatio))
            btnWidthAnchor = btnWidthAnchor.setMultiplier(CGFloat(imageRatio))
            //制約を適用
            view.addConstraint(btnHeightAnchor)
            view.addConstraint(btnWidthAnchor)
            
        }else{
            //画像ボタンを非表示
            btn.isHidden = true
            //リセットボタンを表示
            btn2.isHidden = false
            //画像を表示
            imageView.isHidden = false
            //ラベルを非表示
            label.isHidden = false
            //imageRatioを初期値に
            imageRatio = 0.3
            //画像ボタンの高さの制約と横幅の制約を削除
            view.removeConstraint(btnHeightAnchor)
            view.removeConstraint(btnWidthAnchor)
            //新たなimageRatioで高さと横幅の設定のmultiplierを再設定
            btnHeightAnchor = btnHeightAnchor.setMultiplier(CGFloat(imageRatio))
            btnWidthAnchor = btnWidthAnchor.setMultiplier(CGFloat(imageRatio))
            //制約を適用
            view.addConstraint(btnHeightAnchor)
            view.addConstraint(btnWidthAnchor)
            
            
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
        //textLabelから表示する文字を決定するramdomNum2をランダムに設定
        randomNum2 = Int.random(in: 0..<4)
        label.text = textLabel[randomNum2]
        //タップ上限回数をランダムに設定
        randomNum = Int.random(in: 5..<16)
        //タップ回数を０に戻す
        count = 0
        
    }
    
}

