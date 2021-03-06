//
//  ViewController.swift
//  SwiftNoticeExample
//
//  Created by Crazy on 2017/1/2.
//  Copyright © 2017年 Crazy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  // MARK: - IBAction
  
  @IBAction func waitButtonDidClick(_ sender: UIButton) {
    pleaseWait()
  }
  @IBAction func successButtonDidClick(_ sender: UIButton) {
    successNotice("Success!")
  }
  @IBAction func errorButtonDidClick(_ sender: UIButton) {
    errorNotice("Error!")
  }
  @IBAction func infoButtonDidClick(_ sender: UIButton) {
    infoNotice("Info!")
  }
  @IBAction func onlyTextButtonDidClick(_ sender: UIButton) {
    noticeOnlyText("noticeOnlyText, noticeOnlyText, noticeOnlyText, noticeOnlyText, noticeOnlyText, noticeOnlyText")
  }
  
  @IBAction func topButtonDidClick(_ sender: UIButton) {
    UIApplication.shared.setStatusBarHidden(true, with: .slide)
    noticeTop("abcd!")
  }
  @IBAction func clearAllButtonDidClick(_ sender: UIButton) {
    clearAllNotice()
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

