//
//  WomenDetailViewController.swift
//  Project2
//
//  Created by SWUCOMPUTER on 2018. 6. 18..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class WomenDetailViewController: UIViewController {
    
    @IBOutlet var textName: UILabel!
    @IBOutlet var textDate: UILabel!
    @IBOutlet var textDescription: UILabel!
    @IBOutlet var imageView: UIImageView!
  
    var selectedData: Exercise?
    
    @IBAction func buttonDelete() {
        
        let alert=UIAlertController(title:"정말 삭제 하시겠습니까?", message: "",preferredStyle:.alert)
        alert.addAction(UIAlertAction(title: "Delete", style: .cancel, handler: { action in
            let urlString: String = "http://condi.swu.ac.kr/student/T05iphone/deleteFavorite.php"
            guard let requestURL = URL(string: urlString) else { return }
            var request = URLRequest(url: requestURL)
            request.httpMethod = "POST"
            guard let favoriteNO = self.selectedData?.favoriteno else { return }
            let restString: String = "favoriteno=" + favoriteNO
            request.httpBody = restString.data(using: .utf8)
            let session = URLSession.shared
            let task = session.dataTask(with: request) { (responseData, response, responseError) in
                guard responseError == nil else { return }
                guard let receivedData = responseData else { return }
                if let utf8Data = String(data: receivedData, encoding: .utf8) { print(utf8Data) }
            }
            task.resume()
            self.navigationController?.popViewController(animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let favoriteData = selectedData else { return }
        textName.text = favoriteData.name
        textDate.text = favoriteData.date
        textDescription.numberOfLines = 0
        textDescription.text = favoriteData.descript
        var imageName = favoriteData.image
       
        if (imageName != "") {
            let urlString = "http://condi.swu.ac.kr/student/T05iphone/"
            imageName = urlString + imageName
            let url = URL(string: imageName)!
            if let imageData = try? Data(contentsOf: url) {
                imageView.image = UIImage(data: imageData)
           
            }
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
