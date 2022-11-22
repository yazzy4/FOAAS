//
//  ViewController.swift
//  FOAAS Networking
//
//  Created by Yaz Burrell on 11/22/22.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties

    @IBOutlet weak var responseLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: "https://www.foaas.com/operations/") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }

            let json = try! JSONSerialization.jsonObject(with: data!)
            print(json)
 
        }
        task.resume()
    }

    @IBAction func foButtonPressed(_ sender: Any) {
        
    }
    
}

