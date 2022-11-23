//
//  ViewController.swift
//  FOAAS Networking
//
//  Created by Yaz Burrell on 11/22/22.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    
    //"https://www.foaas.com/operations/"

    @IBOutlet weak var responseLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }

    @IBAction func foButtonPressed(_ sender: Any) {
        print("DEBUG: button pressed    ")
        guard let url = URL(string: "https://www.foaas.com/operations") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }

            let json = try! JSONSerialization.jsonObject(with: data!)
            
            DispatchQueue.main.async {
                self.responseLabel.text = json as? String
            }
  
        }
        task.resume()
    }
    
}

