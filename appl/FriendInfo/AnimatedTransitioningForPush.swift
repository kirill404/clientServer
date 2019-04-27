//
//  AnimateController.swift
//  views
//
//  Created by Кирилл Пучков on 02.04.2019.
//  Copyright © 2019 Кирилл Пучков. All rights reserved.
//

import UIKit

class AnimatedTransitioningForPush: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let destination = transitionContext.viewController(forKey: .to) else { return }
        
        let containerViewFrame = transitionContext.containerView.frame
        transitionContext.containerView.addSubview(destination.view)
        //        destination.view.frame = CGRect(x: containerViewFrame.width - containerViewFrame.height,
        //                                        y: -containerViewFrame.height,
        //                                        width: containerViewFrame.height,
        //                                        height: containerViewFrame.width)
        destination.view.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        let positionX = containerViewFrame.width
        let positionY = containerViewFrame.height
        destination.view.layer.anchorPoint = CGPoint(x: 1, y: 1)
        destination.view.layer.position = CGPoint(x: positionX, y: positionY)
        
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
            destination.view.transform = CGAffineTransform(rotationAngle: 2 * CGFloat.pi)
            
        }) { (finished) in
            destination.view.transform = .identity
            destination.view.frame = CGRect(x: 0, y: 0, width: containerViewFrame.width, height: containerViewFrame.height)
            transitionContext.completeTransition(finished)
        }
    }
    
}

class AnimateTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from)
            else { return }
        guard let destination = transitionContext.viewController(forKey: .to)
            else { return }
        let containerViewFrame = transitionContext.containerView.frame
        let sourceViewTargetFrame = CGRect(x: 0,
                                           y: -containerViewFrame.height,
                                           width: source.view.frame.width,
                                           height: source.view.frame.height)
        let destinationViewTargetFrame = source.view.frame
        
        transitionContext.containerView.addSubview(destination.view)
        
        destination.view.frame = CGRect(x: 0,
                                        y: containerViewFrame.height,
                                        width: source.view.frame.width,
                                        height: source.view.frame.height)
        
        
        UIView
            .animate(withDuration: self.transitionDuration(using: transitionContext),
                     animations: {
                        source.view.frame = sourceViewTargetFrame
                        destination.view.frame = destinationViewTargetFrame
            }) { finished in
                //                source.removeFromParent()
                transitionContext.completeTransition(finished)
        }
    }
}
