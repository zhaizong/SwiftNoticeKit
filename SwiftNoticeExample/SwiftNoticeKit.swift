//
//  SwiftNoticeKit.swift
//  SwiftNoticeExample
//
//  Created by Crazy on 2017/1/2.
//  Copyright © 2017年 Crazy. All rights reserved.
//

import Foundation
import UIKit

extension UIResponder {
  
  func pleaseWait() {
    SwiftNoticeKit.wait()
  }
  
}

enum NoticeType {
  case success
  case error
  case info
}

class SwiftNoticeKit: NSObject {
  
  // MARK: - Property
  
  static var windows: [UIWindow] = []
  static let _rv: UIView = UIApplication.shared.keyWindow?.subviews.first as UIView!
  static var _timer: DispatchSource!
  static var _timerTimers = 0
  
  static var _degree: Double {
    get {
      return [0, 0, 180, 270, 90][UIApplication.shared.statusBarOrientation.hashValue] as Double
    }
  }
  
  static func wait(_ imageNames: [UIImage] = [], timeInterval: Int = 0) {
    let frame = CGRect(origin: .zero, size: CGSize(width: 78, height: 78))
    let window = UIWindow()
    window.backgroundColor = .clear
    let mainView = UIView(frame: .zero)
    mainView.layer.cornerRadius = 12
    mainView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
    
    if imageNames.count > 0 {
      if imageNames.count > _timerTimers {
        let iv = UIImageView(frame: frame)
        iv.image = imageNames.first!
        iv.contentMode = .scaleAspectFit
        mainView.addSubview(iv)
        _timer = DispatchSource.makeTimerSource(flags: .init(rawValue: 0), queue: .main) as! DispatchSource
        _timer.scheduleRepeating(deadline: DispatchTime.now(), interval: DispatchTimeInterval.milliseconds(timeInterval))
        _timer.setEventHandler(handler: { () -> Void in
          let name = imageNames[_timerTimers % imageNames.count]
          iv.image = name
          _timerTimers += 1
        })
        _timer.resume()
      }
    } else {
      let ai = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
      ai.frame = CGRect(origin: CGPoint(x: 21, y: 21), size: CGSize(width: 36, height: 36))
      ai.startAnimating()
      mainView.addSubview(ai)
    }
    window.frame = frame
    window.center = _rv.center
    mainView.frame = frame
    if let version = Double(UIDevice.current.systemVersion), version < 9.0 {
      window.center = _getRealCenter()
      window.transform = CGAffineTransform(rotationAngle: CGFloat(_degree * M_PI / 180))
    }
    window.windowLevel = UIWindowLevelAlert
    window.isHidden = false
    window.addSubview(mainView)
    windows.append(window)
    
    mainView.alpha = 0
    UIView.animate(withDuration: 0.2) { 
      mainView.alpha = 1
    }
  }
  
}

extension SwiftNoticeKit {
  
  static func _getRealCenter() -> CGPoint {
    if UIApplication.shared.statusBarOrientation.hashValue >= 3 {
      return CGPoint(x: _rv.center.y, y: _rv.center.x)
    } else {
      return _rv.center
    }
  }
  
}
