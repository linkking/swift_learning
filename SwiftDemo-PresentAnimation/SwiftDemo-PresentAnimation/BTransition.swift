//
//  BTransition.swift
//  SwiftDemo-PresentAnimation
//
//  Created by zhulei on 2019/5/31.
//  Copyright © 2019 zhulei. All rights reserved.
//

import UIKit

class BTransition: NSObject , UIViewControllerAnimatedTransitioning {

    
    public var AnimaionType : ViewControllerAnimationType!
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewController(forKey: .from)
        let toViewController = transitionContext.viewController(forKey: .to)
        let containerView = transitionContext.containerView

        
        let fromView = fromViewController?.view
        let toView = toViewController?.view
        
        containerView.addSubview(toView!)
        
        let transitionDuration = self.transitionDuration(using: transitionContext)
        
        if AnimaionType == .Present {
            
            toView?.frame = CGRect(x: 0, y: 100, width: fromView!.frame.width, height: fromView!.frame.height)
            toView?.alpha = 0.0
            
            UIView.animate(withDuration: transitionDuration, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveLinear, animations: {
                toView?.alpha = 1.0
                toView?.frame = transitionContext.finalFrame(for: toViewController!)
            }) { (finish) in
                transitionContext.completeTransition(true)
            }
        }else {
            fromView?.alpha = 1.0
            toView?.alpha = 0.5
            UIView.animate(withDuration: transitionDuration, animations: {
                fromView?.alpha = 0.0
                toView?.alpha = 1.0
            }) { (_) in
                transitionContext.completeTransition(true)
            }
        }
        


        
    }
    
}

public enum ViewControllerAnimationType:Int {
    case Present = 0
    case Dismiss = 1
}
