//
//  InfoMenWeightTabViewController.swift
//  Project2
//
//  Created by SWUCOMPUTER on 2018. 6. 3..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

//남자의 체중정보를 보여주는 화면

import UIKit
import CoreData

class InfoMenWeightTabViewController: UIViewController {

    var detailWeight: NSManagedObject?
    
    @IBOutlet var teacherNameLabel: UILabel!
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var muscleLabel: UILabel!
    @IBOutlet var fatLabel: UILabel!
    @IBOutlet var requireLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let member = detailWeight{
            teacherNameLabel.text = member.value(forKey: "teacher") as? String
            weightLabel.text = member.value(forKey: "weight") as? String
            muscleLabel.text = member.value(forKey: "muscle") as? String
            fatLabel.text = member.value(forKey: "fat") as? String
            requireLabel.text = member.value(forKey: "require") as? String
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
