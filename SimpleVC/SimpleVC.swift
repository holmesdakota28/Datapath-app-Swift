//
//  SimpleVC.swift
//  Swift-dp
//
//  Created by Dakota Lane Holmes on 1/5/22.
//

import UIKit

class SimpleVC: UIViewController {

    
    
    
    @IBOutlet weak var image: UIImageView!
    var imageName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.image.image = UIImage(named: imageName)
        self.title = imageName

        // Do any additional setup after loading the view.
    }
    
    func customInit(imageName: String) {
        self.imageName = imageName
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

