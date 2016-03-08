//
//  ViewController.swift
//  Swift Notifications Demo
//
//  Created by Gerd Müller on 06.03.16.
//  Copyright © 2016 Gerd Müller. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var observer: AnyObject!

    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "notificationSelector:", name: "Notification", object: nil)


        // another approach with closure - a more swifty way...
        observer = NSNotificationCenter.defaultCenter().addObserverForName("Notification", object: nil, queue: nil) { notification in
            let userInfo = notification.userInfo! as! [String:Bool]
            self.notificationSwitch3.setOn(userInfo["Switch"]!, animated: true)
        }
        // but what about housekeeping?

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBOutlet weak var notificationSwitch: UISwitch!
    @IBOutlet weak var notificationSwitch2: UISwitch!
    @IBOutlet weak var notificationSwitch3: UISwitch!

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
        NSNotificationCenter.defaultCenter().removeObserver(observer)
    }

}
