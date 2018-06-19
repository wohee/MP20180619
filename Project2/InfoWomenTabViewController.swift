//
//  InfoWomenTabViewController.swift
//  Project2
//
//  Created by SWUCOMPUTER on 2018. 6. 17..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData

class InfoWomenTabViewController: UIViewController {
    
    var detailInfo: NSManagedObject?

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var membershipLabel: UILabel!
    @IBOutlet var ptDateLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let member = detailInfo{
            nameLabel.text = member.value(forKey: "name") as? String
            phoneLabel.text = member.value(forKey: "phone") as? String
            ptDateLabel.text = member.value(forKey: "ptDate") as? String
            membershipLabel.text = member.value(forKey: "number") as? String
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
