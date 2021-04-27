//
//  AssistancePlaceTableViewController.swift
//  Moodout
//
//  Created by Rihards Lozins on 21/04/2021.
//

import UIKit

class AssistancePlaceTableViewController: UITableViewController {
    
    var centres = AssistancePlace.createAssistance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.clearsSelectionOnViewWillAppear = true
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return centres.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "assistanceTableViewCell", for: indexPath)
        
        let centre = centres[indexPath.row]
        cell.textLabel?.text = centre.centreName
        cell.detailTextLabel?.text = centre.centreHours
        cell.imageView?.image = UIImage(named: centre.centreImage)
        
        return cell
        
    }
    
    // MARK: - Table view Delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
        
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let indexPath = tableView.indexPathForSelectedRow {
            
            let detailVC = segue.destination as! AssistanceDetailViewController
            // Pass the selected object to the new view controller.
            
            detailVC.assistancePlace = centres[indexPath.row]
            
        }
    }
}
