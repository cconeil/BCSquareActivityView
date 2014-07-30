//
//  ViewController.swift
//  BCSquareActivityView
//
//  Created by Chris O'Neil on 7/29/14.
//  Copyright (c) 2014 Chris O'Neil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var activityView:BCSquareActivityView?

    override func viewDidLoad() {
        super.viewDidLoad()

        let activityViewSize:CGFloat = 140.0
        self.activityView = BCSquareActivityView(frame: CGRectMake((self.view.frame.size.width - activityViewSize) / 2.0, (self.view.frame.size.height - activityViewSize) / 2.0, activityViewSize, activityViewSize))

        self.view.addSubview(self.activityView!)

        self.activityView!.backgroundColor = UIColor(red: 236.0 / 255.0, green: 240.0 / 255.0, blue: 241.0 / 255.0, alpha: 1.0)
        self.activityView!.foregroundColor = UIColor(red: 52.0 / 255.0, green: 73.0 / 255.0, blue: 94.0 / 255.0, alpha: 1.0)


        let buttonHeight:CGFloat = 50.0
        let startButton:UIButton = UIButton(frame: CGRectMake(0.0, self.view.frame.size.height - buttonHeight, self.view.frame.size.width / 2.0, buttonHeight))

        startButton.backgroundColor = UIColor(red: 46.0 / 255.0, green: 204.0 / 255.0, blue: 113.0 / 255.0, alpha: 1.0)
        startButton.setTitle("START", forState: .Normal)
        startButton.titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 21.0)
        startButton.addTarget(self, action: "startButtonTapped", forControlEvents:.TouchUpInside)
        self.view.addSubview(startButton)

        let stopButton:UIButton = UIButton(frame: CGRectMake(self.view.frame.size.width / 2.0, self.view.frame.size.height - buttonHeight, self.view.frame.size.width / 2.0, buttonHeight))
        stopButton.backgroundColor = UIColor(red: 192.0 / 255.0, green: 57.0 / 255.0, blue: 43.0 / 255.0, alpha: 1.0)
        stopButton.setTitle("STOP", forState: .Normal)
        stopButton.titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 21.0)
        stopButton.addTarget(self, action: "stopButtonTapped", forControlEvents:.TouchUpInside)
        self.view.addSubview(stopButton)
    }

    func startButtonTapped() -> Void {
        self.activityView?.startAnimating()
    }

    func stopButtonTapped() -> Void {
        self.activityView?.endAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

