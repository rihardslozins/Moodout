//
//  VideoViewController.swift
//  Moodout
//
//  Created by Rihards Lozins on 29/04/2021.
//

import UIKit
import Foundation
import Firebase
import AVKit

class VideoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var videoStream = [Videos]()
    var ref: DatabaseReference!
    
    @IBOutlet weak var Table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference().child("videos")
        ref.observe(DataEventType.value, with: {(snapshot) in
            if snapshot.childrenCount > 0 {
                self.videoStream.removeAll()
                
                for video in snapshot.children.allObjects as! [DataSnapshot] {
                    
                    let CellObject = video.value as? [String: AnyObject]
                    let Title = CellObject?["Title"]
                    let videoLink = CellObject?["Link"]
                    let videoTime = CellObject?["Time"]
                    let videoImage = CellObject?["VideoImage"]
                    
                    let video = Videos(Title: (Title as! String), Link: (videoLink as! String), Time: (videoTime as! String), VideoImage: (videoImage as! String))
                    
                    self.videoStream.append(video)
                    self.Table.reloadData()
                }
            }
            
        })
        
    }
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoStream.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoCell", for: indexPath)
        
        let video = videoStream[indexPath.row]
        cell.textLabel?.text = video.Title
        cell.detailTextLabel?.text = video.Time
        
        cell.imageView?.image = UIImage(named: "Blank_Player")
        
        // Loads and Image for cell, from Firebase URL
        
        if let videoTableImage = video.VideoImage {
            let url = URL(string: videoTableImage)
            URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                if let error = error {
                    print(error)
                    return
                }
                DispatchQueue.main.async {
                    cell.imageView?.image = UIImage(data: data!)
                }
                
            }).resume()
        }
        return cell
        
    }
    
    // MARK: - Table view Delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let videoURL = URL(string: videoStream[indexPath.row].Link!) else {
            return
        }
        
        let player = AVPlayer(url: videoURL)
        let controller = AVPlayerViewController()
        controller.player = player
        
        present(controller, animated: true) {
            player.play()
        }
    }
}
