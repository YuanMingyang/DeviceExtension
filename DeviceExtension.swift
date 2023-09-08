//
//  DeviceExtension.swift
//  podTest
//
//  Created by 袁明洋 on 2023/9/8.
//

import Foundation

import UIKit
/// 顶部安全区高度
func safeTop() -> CGFloat {
    if #available(iOS 13.0, *) {
        let scene = UIApplication.shared.connectedScenes.first
        guard let windowScene = scene as? UIWindowScene else { return 0 }
        guard let window = windowScene.windows.first else { return 0 }
        return window.safeAreaInsets.top
    } else if #available(iOS 11.0, *) {
        guard let window = UIApplication.shared.windows.first else { return 0 }
        return window.safeAreaInsets.top
    }
    return 0;
}

/// 底部安全区高度
func safeBottom() -> CGFloat {
    if #available(iOS 13.0, *) {
        let scene = UIApplication.shared.connectedScenes.first
        guard let windowScene = scene as? UIWindowScene else { return 0 }
        guard let window = windowScene.windows.first else { return 0 }
        return window.safeAreaInsets.bottom
    } else if #available(iOS 11.0, *) {
        guard let window = UIApplication.shared.windows.first else { return 0 }
        return window.safeAreaInsets.bottom
    }
    return 0;
}

/// 顶部状态栏高度（包括安全区）
func statusBarHeight() -> CGFloat {
    var statusBarHeight: CGFloat = 0
    if #available(iOS 13.0, *) {
        let scene = UIApplication.shared.connectedScenes.first
        guard let windowScene = scene as? UIWindowScene else { return 0 }
        guard let statusBarManager = windowScene.statusBarManager else { return 0 }
        statusBarHeight = statusBarManager.statusBarFrame.height
    } else {
        statusBarHeight = UIApplication.shared.statusBarFrame.height
    }
    return statusBarHeight
}

/// 导航栏高度
func navigationBarHeight() -> CGFloat {
    return 44.0
}

/// 状态栏+导航栏的高度
func navigationFullHeight() -> CGFloat {
    return statusBarHeight() + navigationBarHeight()
}

/// 底部导航栏高度
func tabBarHeight() -> CGFloat {
    return 49.0
}

/// 底部导航栏高度（包括安全区）
func tabBarFullHeight() -> CGFloat {
    return tabBarHeight() + safeBottom()
}
