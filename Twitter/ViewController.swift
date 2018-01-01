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
        let url = URL(string: "kindle://")!
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            imageView?.isHidden = true
            label?.isHidden = false
            label?.text = "Oops, something went wrong. Are you sure you've got the Kindle app installed?"
        }
    }
}

