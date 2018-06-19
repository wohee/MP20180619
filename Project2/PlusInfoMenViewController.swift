//
//  PlusInfoMenViewController.swift
//  Project2
//
//  Created by SWUCOMPUTER on 2018. 6. 3..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

//남자회원을 추가하는 화면

import UIKit
import CoreData

class PlusInfoMenViewController: UIViewController,UITextFieldDelegate{
    
    var select: String = ""
    
    @IBOutlet var nameText: UITextField!
    @IBOutlet var phoneText: UITextField!
    @IBOutlet var weightText: UITextField!
    @IBOutlet var muscleText: UITextField!
    @IBOutlet var fatText: UITextField!
    @IBOutlet var ptTeacherText: UITextField!
    @IBOutlet var ptDateText: UITextField!
    @IBOutlet var requireText: UITextField!
    
    @IBAction func seletSegment(_ sender: UISegmentedControl) {
        select = sender.titleForSegment(at: sender.selectedSegmentIndex)!
    }
    
    //TextField design
    override func viewDidLayoutSubviews() {
        nameText.borderStyle = .none
        let nameBorder = CALayer()
        nameBorder.frame = CGRect(x:0, y: nameText.frame.size.height-1, width: nameText.frame.width, height: 1)
        nameBorder.backgroundColor = UIColor.gray.cgColor
        
        nameText.layer.addSublayer((nameBorder))
        nameText.textAlignment = .left
        nameText.textColor = UIColor.black
        
        phoneText.borderStyle = .none
        let phoneBorder = CALayer()
        phoneBorder.frame = CGRect(x:0, y: phoneText.frame.size.height-1, width: phoneText.frame.width, height: 1)
        phoneBorder.backgroundColor = UIColor.gray.cgColor
        
        phoneText.layer.addSublayer((phoneBorder))
        phoneText.textAlignment = .left
        phoneText.textColor = UIColor.black
        
        weightText.borderStyle = .none
        let weightBorder = CALayer()
        weightBorder.frame = CGRect(x:0, y: weightText.frame.size.height-1, width: weightText.frame.width, height: 1)
        weightBorder.backgroundColor = UIColor.gray.cgColor
        
        weightText.layer.addSublayer((weightBorder))
        weightText.textAlignment = .left
        weightText.textColor = UIColor.black
        
        muscleText.borderStyle = .none
        let muscleBorder = CALayer()
        muscleBorder.frame = CGRect(x:0, y: muscleText.frame.size.height-1, width: muscleText.frame.width, height: 1)
        muscleBorder.backgroundColor = UIColor.gray.cgColor
        
        muscleText.layer.addSublayer((muscleBorder))
        muscleText.textAlignment = .left
        muscleText.textColor = UIColor.black
        
        fatText.borderStyle = .none
        let fatBorder = CALayer()
        fatBorder .frame = CGRect(x:0, y: fatText.frame.size.height-1, width: fatText.frame.width, height: 1)
        fatBorder .backgroundColor = UIColor.gray.cgColor
        
        fatText.layer.addSublayer((fatBorder))
        fatText.textAlignment = .left
        fatText.textColor = UIColor.black
    
    }
    
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        
        let context = getContext()
        
        let entity = NSEntityDescription.entity(forEntityName: "MenMembers", in: context)
        let object = NSManagedObject(entity: entity!, insertInto: context)
        
        object.setValue(nameText.text, forKey: "name")
        object.setValue(phoneText.text, forKey: "phone")
        object.setValue(weightText.text, forKey: "weight")
        object.setValue(muscleText.text, forKey: "muscle")
        object.setValue(fatText.text, forKey: "fat")
        object.setValue(ptTeacherText.text, forKey: "teacher")
        object.setValue(ptDateText.text, forKey: "ptDate")
        object.setValue(requireText.text, forKey: "require")
        object.setValue(select, forKey: "number")
        
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        
        if nameText.text == "" || (phoneText.text == nil) || weightText.text == "" || muscleText.text == "" || fatText.text == "" || ptTeacherText.text == "" || ptDateText.text == ""{
            let alert = UIAlertController(title: "빈 칸 정보를 입력해주세요", message: "",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }
        else{
            let alert = UIAlertController(title: "회원정보가 저장되었습니다.", message: "",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true)
        } 
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
