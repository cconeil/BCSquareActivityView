//
//  BCSquareActivityView.swift
//  BCSquareActivityView
//
//  Created by Chris O'Neil on 7/29/14.
//  Copyright (c) 2014 Chris O'Neil. All rights reserved.
//

import UIKit

enum ActivityLocation {
    case TopLeft, TopRight, BottomRight, BottomLeft

    func frameInView(view: UIView) -> CGRect {
        switch self {
            case .TopLeft:
                return CGRectMake(0.0, 0.0, view.frame.size.width / 2.0, view.frame.size.height / 2.0)
            case .TopRight:
                return CGRectMake(view.frame.size.width / 2.0, 0.0, view.frame.size.width / 2.0, view.frame.size.height / 2.0)
            case .BottomRight:
                return CGRectMake(view.frame.size.width / 2.0, view.frame.size.height / 2.0, view.frame.size.width / 2.0, view.frame.size.height / 2.0)
            case .BottomLeft:
                return CGRectMake(0.0, view.frame.size.height / 2.0, view.frame.size.width / 2.0, view.frame.size.height / 2.0)
        }
    }

    func next() -> ActivityLocation {
        switch self {
            case .TopLeft:
                return .TopRight
            case .TopRight:
                return .BottomRight
            case .BottomRight:
                return .BottomLeft
            case .BottomLeft:
                return .TopLeft
        }
    }
}

class BCSquareActivityView: UIView {
    private var _animating:Bool = false
    private var _activityLocation:ActivityLocation = .TopLeft
    private var _activityView:UIView = UIView(frame: CGRectZero)
    private var _timer:NSTimer?

    var isAnimating:Bool {
        return _animating
    }

    var animationDuration:NSTimeInterval? = 0.3

    var foregroundColor:UIColor {
    set(newColor) {
        self._activityView.backgroundColor = newColor;
    }
    get {
        return self._activityView.backgroundColor
    }
    }

    init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(_activityView);
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        _activityView.frame = _activityLocation.frameInView(self)
    }

    func startAnimating() {
        if (_animating) {
            return;
        }

        _animating = true
        _timer = NSTimer.scheduledTimerWithTimeInterval(self.animationDuration!, target: self, selector: "update", userInfo: nil, repeats: true);
        _timer!.fire();
    }

    func endAnimating() {
        if (!_animating) {
            return;
        }

        _animating = false
        _timer!.invalidate()
    }

    func update() {
        _activityLocation = _activityLocation.next()
        UIView.animateWithDuration(0.001, animations: {
            self._activityView.frame = self._activityLocation.frameInView(self)
        })
    }

}

