//
//  ManageTasksTableController.swift
//  ToDoList
//
//  Created by Daniel Berg on 28/04/24.
//

import UIKit
import FSCalendar

class ManageTasksTableController: UITableViewController, FSCalendarDelegate {

    //MARK: IBOutlet
    
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var btnHour: UIButton!
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.calendar.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? TimePickerController {
            controller.delegate = self
        }
    }

   //MARK: IBAction
    @IBAction func goBack(_ sender: Any) {
    }
    
    @IBAction func openComponent(_ sender: Any) {
        self.performSegue(withIdentifier: "segueComponentTime", sender: nil)
    }
    
    @IBAction func deleteTask(_ sender: Any) {
    }
    
    @IBAction func createTask(_ sender: Any) {
    }
}

//extension ManageTasksTableController:FSCalendarDelegate {
//    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
//        <#code#>
//    }
//}

extension ManageTasksTableController: TimePickerProtocol {
    func sendTime(time: String) {
        self.btnHour.setTitle(time, for: .normal)
    }
    
    
}

extension ManageTasksTableController {
    //MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}
