//
//  NYRTableViewController.swift
//  NewYearResolution
//  Save to Core Data and Intro to CoreData Manager
//  Created by Manish Kumar on 04/12/18.
//  Copyright © 2018 manish. All rights reserved.
//

import UIKit

class NYRTableViewController7: UITableViewController {

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
        let alertController = UIAlertController(title: Constants.alertTitle, message: nil, preferredStyle: .alert)

        alertController.addTextField { (textfield) in
            textfield.placeholder = Constants.placeholderText
        }

        let addAction = UIAlertAction(title: Constants.addTitle, style: .default) { (action) in
            let firstTextField = alertController.textFields![0] as UITextField
            if let text = firstTextField.text {
                let resl = Resolution(desc: text)
                self.dataSource.append(resl)
                self.tableView.reloadData()
                self.saveMyNewYearResolution(model: resl)
            }
        }
        
        let cancelAction = UIAlertAction(title: Constants.cancelTitle, style: .cancel) { (action) in

        }
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }

}

//MARK:- Data Source
extension NYRTableViewController7 {
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

//MARK:- Adding Swipe Gesture
extension NYRTableViewController7 {
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, handler) in
            self.dataSource.remove(at: indexPath.row)
            tableView.reloadData()
        }

        deleteAction.backgroundColor = .blue
        let swipeConfig = UISwipeActionsConfiguration(actions: [deleteAction])
        return swipeConfig
    }

    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let doneAction = UIContextualAction(style: .normal, title: "Done") { (action, view, handler) in
            self.dataSource[indexPath.row].isCompleted = true
            tableView.reloadData()
        }

        doneAction.backgroundColor = UIColor(red: 34/255, green: 139/255, blue: 34/255, alpha: 1)
        let swipeConfig = UISwipeActionsConfiguration(actions: [doneAction])
        return swipeConfig
    }
}



// Save to Core Data
extension NYRTableViewController7 {
    func saveMyNewYearResolution(model: Resolution) {
        CoreDataManager.sharedInstance.saveEntity(model: model)
    }
}
