//
//  ViewController.swift
//  RerouteTwitter
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView?
    @IBOutlet var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label?.isHidden = true
        label?.numberOfLines = 0
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.appDidBecomeActive), name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
    }
    
    @objc func appDidBecomeActive() {
        openKindle()
    }
    
    func openKindle() {
        let appUrl = URL(string: "kindle://")!
        let iTunesUrl = URL(string: "itms-apps://itunes.apple.com/app/id302584613")!
        
        if UIApplication.shared.canOpenURL(appUrl) {
            UIApplication.shared.open(appUrl, options: [:])
        } else if UIApplication.shared.canOpenURL(iTunesUrl) {
            UIApplication.shared.open(iTunesUrl, options: [:])
        } else {
            imageView?.isHidden = true
            label?.isHidden = false
            label?.text = "Oops, something went wrong. Are you sure you've got the Kindle app installed?"
        }
    }
}

