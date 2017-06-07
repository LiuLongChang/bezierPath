//
//  ViewController.swift
//  SomeCode
//
//  Created by zzzsw on 2017/6/6.
//  Copyright © 2017年 zzzsw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func loadView() {
        let viewCustom = CustomView.init(frame: .zero)
        viewCustom.backgroundColor = UIColor.white;
        viewCustom.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        self.view = viewCustom;
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}




class CustomView: UIView {

    override func draw(_ rect: CGRect) {

        let bezierPath_rect = UIBezierPath(rect: CGRect(x: 30, y: 50, width: 100, height: 100))
        bezierPath_rect.move(to: CGPoint(x: 60, y: 60))
        bezierPath_rect.addLine(to: CGPoint(x: 80, y: 80))
        bezierPath_rect.addLine(to: CGPoint(x: 60, y: 90))
        bezierPath_rect.lineCapStyle = CGLineCap.butt
        bezierPath_rect.lineJoinStyle = CGLineJoin.miter
        bezierPath_rect.miterLimit = 1
        let dash : [CGFloat] = [20,1]
        bezierPath_rect.setLineDash(dash, count: 2, phase: 0)
        bezierPath_rect.lineWidth = 6;
        /*========*/
        let bezierPath_oval = UIBezierPath(ovalIn: CGRect(x: 200, y: 50, width: 150, height: 100))
        bezierPath_oval.lineWidth = 10;
        /*========*/
        let bezierPath_RounedRect = UIBezierPath(roundedRect: CGRect.init(x: 30, y: 200, width: 100, height: 100), cornerRadius: 20);
        bezierPath_RounedRect.lineWidth = 10;
        /*=========*/
        let bezierPath_RoundedRoundedCornerRect = UIBezierPath(roundedRect: CGRect.init(x: 200, y: 200, width: 100, height: 100), byRoundingCorners: [.topLeft,.bottomRight], cornerRadii: CGSize.init(width: 20, height: 20))
        bezierPath_RoundedRoundedCornerRect.lineWidth = 10;
        /*========*/
        let bezierPath_ArcCenter = UIBezierPath(arcCenter: CGPoint.init(x: 0, y: 400), radius: 50, startAngle: CGFloat(Double.pi/2*3), endAngle: CGFloat(Double.pi/3), clockwise: true)
        bezierPath_ArcCenter.lineWidth = 10;

        /*====*/
        let bezierPath = UIBezierPath()
        bezierPath.lineWidth = 2
        bezierPath.move(to: CGPoint.init(x: 10, y: 520))
        bezierPath.addLine(to: CGPoint.init(x: 50, y: 530))
        bezierPath.addQuadCurve(to: CGPoint.init(x: 100, y: 510), controlPoint: CGPoint.init(x: 80, y: 650))
        bezierPath.addCurve(to: CGPoint.init(x: 200, y: 530), controlPoint1: CGPoint.init(x: 130, y: 600), controlPoint2: CGPoint.init(x: 170, y: 400))
        bezierPath.addArc(withCenter: CGPoint.init(x: 300, y: 400), radius: 50, startAngle: 0, endAngle: CGFloat(Double.pi*2), clockwise: true)


        bezierPath.move(to: CGPoint.init(x: 20, y: 520))
        bezierPath.addLine(to: CGPoint.init(x: 40, y: 520))


        /*==============*/
       // let transform = CGAffineTransform.init()
        let path : CGMutablePath = CGMutablePath()
        path.move(to: CGPoint.init(x: 10, y: 640))//, transform: transform
        path.addCurve(to: CGPoint.init(x: 350, y: 650), control1: CGPoint.init(x: 100, y: 700), control2: CGPoint.init(x: 250, y: 550));//, transform: transform
        let bezierPath_cgPath = UIBezierPath.init(cgPath: path);
        bezierPath_cgPath.lineWidth = 4;








        let aniLayer = CALayer()
        aniLayer.backgroundColor = UIColor.red.cgColor
        aniLayer.position = CGPoint.init(x: 10, y: 520)
        aniLayer.bounds = CGRect.init(x: 0, y: 0, width: 8, height: 8)
        aniLayer.cornerRadius = 4
        self.layer.addSublayer(aniLayer)


        let keyFrameAni = CAKeyframeAnimation.init(keyPath: "position")
        keyFrameAni.repeatCount = Float(Int.max)
        keyFrameAni.path = bezierPath.cgPath
        keyFrameAni.duration = 15
        keyFrameAni.beginTime = CACurrentMediaTime() + 1;
        aniLayer.add(keyFrameAni, forKey: "keyFrameAnimation")
        /*=======*//*========*/
        /*========*/
        UIColor.red.set()
        bezierPath_rect.fill()
        bezierPath_oval.fill()
        bezierPath_RounedRect.fill()
        bezierPath_RoundedRoundedCornerRect.fill()
        //bezierPath_cgPath.fill()


        UIColor.black.set()
        bezierPath_rect.stroke()
        bezierPath.stroke()
        bezierPath_oval.stroke()
        bezierPath_RounedRect.stroke()
        bezierPath_RoundedRoundedCornerRect.stroke()
        bezierPath_ArcCenter.stroke()
        bezierPath_cgPath.stroke()



    }


}
