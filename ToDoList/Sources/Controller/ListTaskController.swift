//
//  ListTaskController.swift
//  ToDoList
//
//  Created by Daniel Berg on 28/04/24.
//

import UIKit

class ListTaskController: UIViewController {

    //MARK: IBOutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnAdd: UIButton!
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    //MARK: Action
    @IBAction func createNewTask(_ sender: Any) {
    }
    
}

//MARK: UITableViewDataSource, UITableViewDelegate
extension ListTaskController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TaskTableCell = tableView.dequeueReusableCell(withIdentifier: "cellTask", for: indexPath) as! TaskTableCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}
