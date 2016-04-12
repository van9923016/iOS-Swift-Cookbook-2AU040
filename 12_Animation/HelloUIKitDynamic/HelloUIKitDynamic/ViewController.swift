//********************************************************************
//********************************************************************
//*************************** UIKit Dynamic **************************
//********************************************************************
//********************************************************************

import UIKit

class ViewController: UIViewController {
    
    var animator:UIDynamicAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //設定及將受重力引響的方形區域
        let rectArea = CGRectMake(view.frame.width/2-50, 0, 100, 100)
        
        //用這個區域製作一個UIView
        let redBox = UIView(frame: rectArea)
        redBox.backgroundColor = UIColor.redColor()
        view.addSubview(redBox)
        
        //產生UIDynamicAnimator
        animator = UIDynamicAnimator(referenceView: view)
        
        //產生UIDynamicBehavior
        let gravity = UIGravityBehavior()
        
        //把視圖(UIView)加入UIDynamicBehavior
        gravity.addItem(redBox)
        
        //把 UIDynamicBehavior 加入 UIDynamicAnimator
        animator.addBehavior(gravity)
        
        //設定擋住紅色四方形的區域
        let wallArea = CGRectMake(50, 500, 300, 10)
        
        //用這個區域做一個 UIView
        let blueBar = UIView(frame: wallArea)
        blueBar.backgroundColor = UIColor.blueColor()
        view.addSubview(blueBar)
        
        //產生另一個碰撞UIDynamicBehavior
        let collision = UICollisionBehavior()
        
        //把視圖(UIView)加入碰撞UIDynamicBehavior
        collision.addItem(redBox)
        
        //將藍色的blueBar的邊際轉換成碰撞邊界感應區
        collision.addBoundaryWithIdentifier("blueBar", forPath: UIBezierPath(rect: blueBar.frame))
        
        //將畫面的四個邊變成碰撞邊界感應區
        collision.translatesReferenceBoundsIntoBoundary = true
        
        //把 UIDynamicBehavior 加入 UIDynamicAnimator
        animator.addBehavior(collision)
        
        //生成吸附行為(UISnapBehavior)
        //let snap = UISnapBehavior(item: redBox, snapToPoint: view.center)
        
        //把 UIDynamicBehavior 加入 UIDynamicAnimator
        //animator.addBehavior(snap)
    }
}
