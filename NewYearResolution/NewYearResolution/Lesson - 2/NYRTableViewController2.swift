//
//  NYRTableViewController.swift
//  NewYearResolution
//  Create Prototype Cell and Dequeue
//  Created by Manish Kumar on 04/12/18.
//  Copyright © 2018 manish. All rights reserved.
//

import UIKit

class NYRTableViewController2: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setup() {
        self.tableView.tableFooterView = UIView()
    }
}

//MARK:- Data Source
extension NYRTableViewController2 {
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }


     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "ResolutionCellTableViewCell", for: indexPath)
        
        return cell
     }

}
