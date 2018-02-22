//
//  NotificationBarConfiguration.swift
//  NotificationBar
//
//  Created by Furqan on 22.02.18.
//

import Foundation

public class NotificationBarConfiguration {
    
    
    /// Duration after which auto dismissed notification bar is dismissed
    public var duration: TimeInterval
    
    /// The default font of the text
    public var font: UIFont
    
    /// The color of the text
    public var textColor: UIColor
    
    /// Padding around the text
    public var padding: CGFloat
    
    /// Default background color for `.loading` style
    public var loadingColor: UIColor
    
    /// Default background color for `.sucess` style
    public var successColor: UIColor
    
    /// Default color for `.error` style
    public var errorColor: UIColor
    
    init() {
        duration = 4.0
        font = UIFont.systemFont(ofSize: 16.0)
        textColor = .white
        padding = 4.0
        loadingColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        successColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        errorColor = #colorLiteral(red: 0.9098, green: 0.2118, blue: 0, alpha: 1)
    }
}
