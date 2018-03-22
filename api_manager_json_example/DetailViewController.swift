//
//  DetailViewController.swift
//  api_manager_json_example
//
//  Created by Mariano Martinez on 22/3/18.
//  Copyright © 2018 Nacho Martinez. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var selectedNews : HackerNews?

    @IBOutlet weak var detailLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailLabel.text = selectedNews?.title
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
