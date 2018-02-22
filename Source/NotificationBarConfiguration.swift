//
//  NotificationBarConfiguration.swift
//  NotificationBar
//
//  Created by Furqan on 22.02.18.
//

import Foundation

public class NotificationBarConfiguration {
    
    public var duration: TimeInterval
    public var font: UIFont
    public var textColor: UIColor
    public var padding: CGFloat
    
    init() {
        duration = 4.0
        font = UIFont.systemFont(ofSize: 16.0)
        textColor = .white
        padding = 8.0
    }
}
