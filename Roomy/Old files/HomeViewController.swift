//
//  HomeList.swift
//  Roomy
//
//  Created by Awady on 7/10/19.
//  Copyright © 2019 Awady. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var apartments: [Apartment] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        apartments = creatArray()
        
            tableView.delegate = self
            tableView.dataSource = self
    }
    

    func creatArray() -> [Apartment] {
        
        var apartmentContents: [Apartment] = []
        
        let Home1 = Apartment(street: "21 Elmergany.St", postal: "Heliopolis, 11432", price: "$21000", room: "2 Bed\n2 Bath", view1: #imageLiteral(resourceName: "View4 to 2"), view2: #imageLiteral(resourceName: "View1 to 1"), view3: #imageLiteral(resourceName: "View3 to 3"))
        let Home2 = Apartment(street: "4 Abbas Elakkad.St", postal: "Nasr City, 11734", price: "$30000", room: "1 Bed\n1 Bath", view1: #imageLiteral(resourceName: "View2 to 1"), view2: #imageLiteral(resourceName: "View2 to 3"), view3: #imageLiteral(resourceName: "View2 to 2"))
        let Home3 = Apartment(street: "40 Mustafa Elnahas.St", postal: "Nasr City, 11298", price: "$28000", room: "2 Bed\n2 Bath", view1: #imageLiteral(resourceName: "View3 to 3"), view2: #imageLiteral(resourceName: "View1 to 3"), view3: #imageLiteral(resourceName: "View3 to 2"))
        let Home4 = Apartment(street: "5 ElKawmia.St", postal: "Zagazig, 12374", price: "$13000", room: "1 Bed\n1 Bath", view1: #imageLiteral(resourceName: "View9 to 3") , view2: #imageLiteral(resourceName: "View6 to 1"), view3: #imageLiteral(resourceName: "View8 to 1"))
        let Home5 = Apartment(street: "23 Ahmed Esmaeil.St", postal: "Mansoura, 11394", price: "$12000", room: "1 Bed\n1 Bath", view1: #imageLiteral(resourceName: "View8 to 3"), view2: #imageLiteral(resourceName: "View6 to 2"), view3: #imageLiteral(resourceName: "View3 to 3"))
        let Home6 = Apartment(street: "18 ElSawra.St", postal: "PortSaid, 13485", price: "$17000", room: "2 Bed\n1 Bath", view1: #imageLiteral(resourceName: "View5 to 1"), view2: #imageLiteral(resourceName: "View4 to 2"), view3: #imageLiteral(resourceName: "View7 to 1"))
        let Home7 = Apartment(street: "12 Nemra 7.St", postal: "ElShorouk, 12484", price: "$25000", room: "2 Bed\n2 Bath", view1: #imageLiteral(resourceName: "View9 to 1"), view2: #imageLiteral(resourceName: "View5 to 3"), view3: #imageLiteral(resourceName: "View9 to 1"))
        let Home8 = Apartment(street: "6 October.St", postal: "Ismaelia, 11209", price: "$27000", room: "2 Bed\n1 Bath", view1: #imageLiteral(resourceName: "View1 to 3"), view2: #imageLiteral(resourceName: "View2 to 3"), view3: #imageLiteral(resourceName: "View8 to 1"))
        let Home9 = Apartment(street: "Elhoria.St", postal: "Tanta, 11489", price: "$20000", room: "1 Bed\n1 Bath", view1: #imageLiteral(resourceName: "View9 to 3"), view2: #imageLiteral(resourceName: "View6 to 2"), view3: #imageLiteral(resourceName: "View3 to 2"))
        
        apartmentContents.append(Home1)
        apartmentContents.append(Home2)
        apartmentContents.append(Home3)
        apartmentContents.append(Home4)
        apartmentContents.append(Home5)
        apartmentContents.append(Home6)
        apartmentContents.append(Home7)
        apartmentContents.append(Home8)
        apartmentContents.append(Home9)
        
        return apartmentContents
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apartments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let apartment = apartments[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell") as! HomeCell
        
        cell.setHome(home: apartment)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "RequestView", sender: nil)
    }
    
}
