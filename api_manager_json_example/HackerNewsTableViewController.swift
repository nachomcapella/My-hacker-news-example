//
//  HackerNewsTableViewController.swift
//  api_manager_json_example
//
//  Created by Mariano Martinez on 22/3/18.
//  Copyright © 2018 Nacho Martinez. All rights reserved.
//

import UIKit

class HackerNewsTableViewController: UITableViewController {

    var hackerNews: [HackerNews] = []
    var selectedNews : HackerNews?
    
//    var hackerNews: [HackerNews] = [] {
//        didSet {
//            self.tableView.reloadData()
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let hackerXib = UINib.init(nibName: R.nib.hackerNewsTableViewCell.identifier, bundle: nil)
//        self.tableView.register(hackerXib, forCellReuseIdentifier: R.reuseIdentifier.hackerNewsCelliD.identifier)
        
        self.tableView.register(R.nib.hackerNewsTableViewCell)
        
        APIManager.sharedInstance.getHackerNews(onSuccess: { (hackerNewsArray) in
            self.hackerNews = hackerNewsArray
            self.tableView.reloadData()
        }) { (error) in
            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            self.show(alert, sender: nil)
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return hackerNews.count
    }

    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.hackerNewsTableViewCell.identifier, for: indexPath) as! HackerNewsTableViewCell
        let newsItem = self.hackerNews[indexPath.row]
        cell.titleLabel?.text = newsItem.title == "" ? newsItem.storyTitle : newsItem.title
        cell.authorLabel?.text = newsItem.author
        cell.dateLabel?.text = String(describing: newsItem.date)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == R.segue.hackerNewsTableViewController.moveDetailView.identifier {
            var destination = segue.destination as! DetailViewController
            destination.selectedNews = self.selectedNews
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedNews = self.hackerNews[indexPath.row]
        self.performSegue(withIdentifier: R.segue.hackerNewsTableViewController.moveDetailView.identifier, sender: nil)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
