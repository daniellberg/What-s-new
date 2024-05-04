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
        self.registerNib()
    }
    
    //MARK: Private/Public Func
    
    private func registerNib(){
        self.tableView.register(UINib(nibName: "EmptyTableCell", bundle: nil), forCellReuseIdentifier: "emptyTableCell")
    }
    
    //MARK: Action
    @IBAction func createNewTask(_ sender: Any) {
        self.performSegue(withIdentifier: "createNewTaskSegue", sender: nil)
    }
    
}

//MARK: UITableViewDataSource, UITableViewDelegate
extension ListTaskController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TaskTableCell = tableView.dequeueReusableCell(withIdentifier: "cellTask", for: indexPath) as! TaskTableCell
//        let cell:EmptyTableCell = tableView.dequeueReusableCell(withIdentifier: "emptyTableCell", for: indexPath) as! EmptyTableCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //100
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("indexPath Row: \(indexPath.row)")
    }
}
