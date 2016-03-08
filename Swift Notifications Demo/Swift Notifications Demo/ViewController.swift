//
//  ViewController.swift
//  Swift Notifications Demo
//
//  Created by Gerd Müller on 06.03.16.
//  Copyright © 2016 Gerd Müller. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "notificationSelector:", name: "Notification", object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var notificationSwitch: UISwitch!
    @IBOutlet weak var notificationSwitch2: UISwitch!

    @IBAction func on(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("Notification", object: self, userInfo: ["Switch" : true])
    }

    @IBAction func off(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("Notification", object: self, userInfo: ["Switch" : false])
    }

    func notificationSelector(notification: NSNotification) {
        if notification.name == "Notification" {
            let userInfo = notification.userInfo! as! [String:Bool]
            notificationSwitch.setOn(userInfo["Switch"]!, animated: true)
            notificationSwitch2.setOn(userInfo["Switch"]!, animated: true)
        }
    }

    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

}

