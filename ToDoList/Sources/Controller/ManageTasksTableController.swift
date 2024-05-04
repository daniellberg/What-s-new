//
//  ManageTasksTableController.swift
//  ToDoList
//
//  Created by Daniel Berg on 28/04/24.
//

import UIKit

class ManageTasksTableController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

}
