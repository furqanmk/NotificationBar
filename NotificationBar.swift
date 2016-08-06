//
//  ErrorView.swift
//  Kabridge
//
//  Created by Furqan Muhammad Khan on 17/05/2016.
//  Copyright © 2016 VitalSoft. All rights reserved.
//

import UIKit

//
//  ICViewController.swift
//  DolmenMall
//
//  Created by Furqan Khan on 02/07/2015.
//  Copyright (c) 2015 Panacloud. All rights reserved.
//

import UIKit

class NotificationBar {
    
    private static var activeViewController: UIViewController {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let window = appDelegate.window!
        let navigationController = window.rootViewController as! UINavigationController
        let activeVC = navigationController.visibleViewController!
        return activeVC
    }
    private static var messageView: UIView!
    private static var bgView: UIView!
 
    private static var startingY: CGFloat {
        if activeViewController.navigationController?.navigationBarHidden == true {
            return -70
        }
        else {
            return -2
        }
    }
    
    private static var viewHeight: CGFloat {
        if activeViewController.navigationController?.navigationBarHidden == true {
            return 50
        }
        else {
            return 30
        }
    }
    
    private static var positionDisplacement: CGFloat {
        if activeViewController.navigationController?.navigationBarHidden == true {
            return 10
        }
        else {
            return 0
        }
    }
    
    static func showWithMessage(message: String, backgroundColor: UIColor?, permanently permanent: Bool, showLoadingIndicator: Bool, onCompletion: (()->())?) {
        if messageView == nil {
            
            bgView = UIView(frame: activeViewController.view.frame)
            bgView.backgroundColor = UIColor(white: 0, alpha: 0)
            activeViewController.view.addSubview(bgView)
            
            let font = UIFont(name: "Century Gothic", size: 16)
            let fontAttributes = [NSFontAttributeName: font!]
            let fontSize = (message as NSString).sizeWithAttributes(fontAttributes)
            let fontHeight = fontSize.height
            let lines = Int(fontSize.width / activeViewController.view.frame.width)
            
            self.messageView = UIView(frame: CGRectMake(0, startingY, activeViewController.view.frame.width, viewHeight + CGFloat(lines)*fontHeight))
            if let color = backgroundColor {
                
                self.messageView.backgroundColor = color
            } else {
                self.messageView.backgroundColor = UIColor.redColor()
            }
            self.messageView.alpha = 0

            let messageLabel = UILabel(frame: CGRect(origin: CGPointZero, size: CGSize(width: messageView.bounds.width, height: messageView.bounds.height)))
            messageLabel.center = messageView.center
            messageLabel.text = message
            messageLabel.font = font
            messageLabel.numberOfLines = 0
            messageLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
            messageLabel.textAlignment = NSTextAlignment.Center
            messageLabel.textColor = UIColor.whiteColor()
            self.messageView.addSubview(messageLabel)
            
            if showLoadingIndicator {
                let indicator = UIActivityIndicatorView(activityIndicatorStyle: .White)
                indicator.center.x = messageView.frame.width - indicator.frame.width
                indicator.center.y = messageView.frame.height / 2 + positionDisplacement
                self.messageView.addSubview(indicator)
                indicator.startAnimating()
            }
            
            activeViewController.view.addSubview(self.messageView)
            
            UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                bgView.alpha = 0.2
                self.messageView.alpha = 1
                self.messageView.center.y += 65
                
                }, completion: nil)
            
            if !permanent {
                UIView.animateWithDuration(0.5, delay: 2.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                    
                    self.messageView.alpha = 0
                    self.messageView.center.y -= 65
                    bgView.alpha = 0
                    
                    }, completion:
                    {
                        _ in
                        self.bgView.removeFromSuperview()
                        self.bgView = nil
                        self.messageView.removeFromSuperview()
                        self.messageView = nil
                        if let _completion = onCompletion {
                            _completion()
                        }
                })
            }
            
        }
    }
    
    static func hide(onCompletion: (()->())?) {
        if messageView != nil {
            
            UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                
                messageView.alpha = 0
                messageView.center.y -= 65
                bgView.alpha = 0
                
                }, completion:
                {
                    _ in
                    bgView.removeFromSuperview()
                    bgView = nil
                    messageView.removeFromSuperview()
                    messageView = nil
                    if let _completion = onCompletion {
                        _completion()
                    }
            })
        }
    }
    
}

