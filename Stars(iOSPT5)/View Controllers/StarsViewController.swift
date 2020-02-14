//
//  StarsViewController.swift
//  Stars(iOSPT5)
//
//  Created by David Williams on 2/13/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import UIKit

class StarsViewController: UIViewController {
    
    @IBOutlet weak var starNameTextField: UITextField!
    @IBOutlet weak var distanceTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: Properties
    // Source of Truth
let starController = StarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func printButtonTapped(_ sender: Any) {
        print(starController.listStars())
    }
    
    @IBAction func createButtonTapped(_ sender: Any) {
        guard let name = starNameTextField.text,
            let distanceString = distanceTextField.text,
            !name.isEmpty,
            !distanceString.isEmpty,
            let distance = Double(distanceString) else { return }
        
        starController.createStar(named: name, withDistance: distance)
        starNameTextField.text = ""
        distanceTextField.text = ""
        starNameTextField.becomeFirstResponder() // Returns cursor back to this field
        tableView.reloadData()
    }
}

extension StarsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starController.stars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StarCell", for: indexPath) as? StarTableViewCell else { return UITableViewCell() }
        // Conditionally downcast to point to the custom cell creator for the information
        // of the specific cell
        let star = starController.stars[indexPath.row]
        cell.star = star
        return cell
    }
}
