//
//  NotificationBar.swift
//
// The MIT License (MIT)
//
// Copyright (c) 2018 Furqan Muhammad Khan <furqanmk9>
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.


import UIKit

public class NotificationBar {
    
    /// Use to set universal configuration for the Notification Bar
    public static let sharedConfig = NotificationBarConfiguration()
    
    private let presenter: UIViewController
    private let text: String
    private let style: NotificationBarStyle
    private let onDismiss: (() -> ())?
    private var view: UIView!
    
    // MARK: - Initializer
    
    /// Initialize the NotificationBar
    ///
    /// - Parameters:
    ///   - presenter: The view controller which presents the notification bar
    ///   - text: The text to be shown inside the notification bar
    ///   - style: The style of the notification bar
    ///   - onDismiss: Method of dismissing the notification bar
    public init(over presenter: UIViewController,
                text: String,
                style: NotificationBarStyle,
                onDismiss: (() -> ())? = nil) {
        
        self.presenter = presenter
        self.text = text
        self.style = style
        self.onDismiss = onDismiss
        setupView()
        subscribeForRotationChanges()
    }
    
    // MARK: - Public Methods
    
    /// Present the notification bar.
    /// **Don't forget to dismiss if dismiss style is .manual**
    public func show() {
        animateIn()
    }
    
    /// Dismiss the notification bar in case the dismiss method is .manual
    public func dismiss() {
        animateOut(withDelay: 0)
    }
    
    // MARK: - Private Methods
    
    // MARK: Setup
    
    private func setupView() {

        let width = presenter.view.frame.width
        let height = NotificationBar.sharedConfig.padding + textHeight()
        view = UIView(frame: CGRect(x: 0,
                                    y: -height,
                                    width: width,
                                    height: height))
        view?.backgroundColor = style.config().backgroundColor
        view?.alpha = 0
        presenter.view.addSubview(view)
        
        setupLabel()
        setupLoader()
    }
    
    private func setupLabel() {
        
        let padding = NotificationBar.sharedConfig.padding
        let font = NotificationBar.sharedConfig.font
        let textColor = NotificationBar.sharedConfig.textColor
        
        let label = UILabel(frame: CGRect(origin: CGPoint(x: padding / 2,
                                                          y: padding / 2),
                                          size: CGSize(width: view.bounds.width - padding,
                                                       height: view.bounds.height - padding)))
        label.text = text
        label.font = font
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.textColor = textColor
        view.addSubview(label)
    }
    
    private func setupLoader() {
        guard !style.config().isLoaderHidden else {
            return
        }
        let loader = UIActivityIndicatorView(activityIndicatorStyle: .white)
        loader.center.x = view.frame.width - loader.frame.width
        loader.center.y = view.frame.height / 2
        view.addSubview(loader)
        loader.startAnimating()
    }
    
    // MARK: Animation
    
    private func animateIn() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.view.alpha = 1
            self.view.center.y += self.view.frame.height
        }, completion: nil)
        
        if style.config().dismiss == .auto {
            animateOut(withDelay: NotificationBar.sharedConfig.duration)
        }
    }
    
    private func animateOut(withDelay delay: TimeInterval) {
        UIView.animate(withDuration: 0.5, delay: delay, options: .curveEaseOut, animations: {
            self.view.alpha = 0
            self.view.center.y -= self.view.frame.height
        }, completion: { _ in
            self.view.removeFromSuperview()
            self.onDismiss?()
        })
    }
    
    // MARK: Text Height
    
    private func textHeight() -> CGFloat {
        let font = NotificationBar.sharedConfig.font
        let size = (text as NSString).size(withAttributes: [.font: font])
        let lines = Int(size.width / presenter.view.frame.width)
        return 50.0 + CGFloat(lines) * size.height
    }
    
    // MARK: Rotation
    
    private func subscribeForRotationChanges() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleRotation),
                                               name: NSNotification.Name.UIDeviceOrientationDidChange,
                                               object: nil)
    }
    
    @objc private func handleRotation() {
        setupView()
        animateIn()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
