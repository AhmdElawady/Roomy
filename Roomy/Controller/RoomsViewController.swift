//
//  RoomsViewController.swift
//  Roomy
//
//  Created by Awady on 7/31/19.
//  Copyright © 2019 Awady. All rights reserved.
//

import UIKit

class RoomsViewController: UIViewController {
    

    @IBOutlet weak var RoomsTableView: UITableView!
    
    var rooms = [RoomContent]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RoomsTableView.tableFooterView = UIView()
        
        RoomsTableView.register(UINib.init(nibName: "RoomTableViewCell", bundle: nil), forCellReuseIdentifier: "RoomCell")
        
        RoomsTableView.dataSource = self
        RoomsTableView.delegate = self
        
        handleRefresh()
    }
    private func handleRefresh () {
        API.Homes { (error: Error?, rooms: [RoomContent]?) in
            if let Rooms = rooms {
                self.rooms = Rooms
                self.RoomsTableView.reloadData()
            }
        }
    }

}

extension RoomsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = RoomsTableView.dequeueReusableCell(withIdentifier: "RoomCell", for: indexPath) as! RoomTableViewCell
        cell.textLabel?.text = rooms[indexPath.row].title
        
        return cell
    }
}

extension RoomsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
