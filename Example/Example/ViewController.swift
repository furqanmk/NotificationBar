//
//  ViewController.swift
//  Example
//
//  Created by Furqan on 21.02.18.
//  Copyright © 2018 Furqan. All rights reserved.
//

import UIKit
import NotificationBar

class ViewController: UIViewController {
    
    private var loadingNotificationBar: NotificationBar?
    private var isNotificationVisible = false {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    @IBAction func showLoading(_ sender: Any) {
        isNotificationVisible = true
        loadingNotificationBar = NotificationBar(over: self, text: "Tick, tick... It's loading...", style: .loading) {
            self.isNotificationVisible = false
        }
        loadingNotificationBar?.show()
    }
    
    @IBAction func stopLoading(_ sender: Any) {
        loadingNotificationBar?.dismiss()
    }
    
    @IBAction func showSuccess(_ sender: Any) {
        isNotificationVisible = true
        NotificationBar(over: self, text: "Yay! Everything went good :)", style: .success) {
            self.isNotificationVisible = false
            }
            .show()
    }
    
    @IBAction func showError(_ sender: Any) {
        isNotificationVisible = true
        NotificationBar(over: self, text: "Uh-oh! Something broke :/", style: .error) {
            self.isNotificationVisible = false
            }
            .show()
    }
    
    override var prefersStatusBarHidden: Bool {
        return isNotificationVisible
    }
    
}

