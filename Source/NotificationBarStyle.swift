//
//  NotificationBarStyle.swift
//  NotificationBar
//
//  Created by Furqan on 22.02.18.
//

import Foundation

/// Enum with different visual specifications
///
/// - loading: Yellow background, with a loading indicator. **Needs to be dismissed manually.**
/// - success: Green background
/// - error: Red background
/// - custom: Custom setting for visual appearance
public enum NotificationBarStyle {
    
    case loading, success, error, custom(VisualConfig)
    
    /// Use to specify the visual styling
    /// - backgroundColor: The background color of the bar
    /// - isLoaderHidden: The visibility of the loading indicator
    /// - dismiss: The style of dismissing
    public struct VisualConfig {
        let backgroundColor: UIColor
        let isLoaderHidden: Bool
        let dismiss: NotificationBarDismiss
        
        public init(backgroundColor: UIColor, isLoaderHidden: Bool, dismiss: NotificationBarDismiss) {
            self.backgroundColor = backgroundColor
            self.isLoaderHidden = isLoaderHidden
            self.dismiss = dismiss
        }
    }
    
    func config() -> VisualConfig {
        switch self {
        case .loading:
            return VisualConfig(backgroundColor: NotificationBar.sharedConfig.loadingColor,
                                isLoaderHidden: false,
                                dismiss: .manual)
        case .success:
            return VisualConfig(backgroundColor: NotificationBar.sharedConfig.successColor,
                                isLoaderHidden: true,
                                dismiss: .auto)
        case .error:
            return VisualConfig(backgroundColor: NotificationBar.sharedConfig.errorColor,
                                isLoaderHidden: true,
                                dismiss: .auto)
        case .custom(let style):
            return style
        }
    }
}

/// Enum specifying dismiss methods
///
/// - manual: Requires a seperate call to `NotificationBar.dismiss()`
/// - auto: Automatically dismisses the notification bar after `NotificationBarConfiguration().duration`
public enum NotificationBarDismiss {
    case manual, auto
}
