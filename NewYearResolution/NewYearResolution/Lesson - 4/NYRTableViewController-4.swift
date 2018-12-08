//
//  NYRTableViewController.swift
//  NewYearResolution
// Take Input and Reload Tableview with new data
//  Created by Manish Kumar on 04/12/18.
//  Copyright © 2018 manish. All rights reserved.
//

import UIKit

class NYRTableViewController4: UITableViewController {

    @IBOutlet weak var addBarItem: UIBarButtonItem!
    var dataSource = [Resolution]()

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
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewResolution))
    }

    /*
     * Handle (+) click
     */
    @objc func addNewResolution() {

        // create alert controller
        let alertController = UIAlertController(title: Constants.alertTitle, message: nil, preferredStyle: .alert)

        alertController.addTextField { (textfield) in
            textfield.placeholder = Constants.placeholderText
        }

        // Add action
        let addAction = UIAlertAction(title: Constants.addTitle, style: .default) { (action) in
            let firstTextField = alertController.textFields![0] as UITextField
            if let text = firstTextField.text {
                self.dataSource.append(Resolution(desc: text))
                self.tableView.reloadData()
            }
        }

        // cancel action
        let cancelAction = UIAlertAction(title: Constants.cancelTitle, style: .cancel) { (action) in
        }

        alertController.addAction(addAction)
        alertController.addAction(cancelAction)

        self.present(alertController, animated: true, completion: nil)
    }

}

//MARK:- Data Source
extension NYRTableViewController4 {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }

     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "ResolutionCellTableViewCell", for: indexPath) as! ResolutionCellTableViewCell

        let model = self.dataSource[indexPath.row]
        cell.lblDescription.text = model.description
        cell.imgCheckMark.isHidden = !model.isCompleted
        return cell
     }
}
