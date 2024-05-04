//
//  ManageTasksTableController.swift
//  ToDoList
//
//  Created by Daniel Berg on 28/04/24.
//

import UIKit
import FSCalendar

class ManageTasksTableController: UITableViewController{

    //MARK: IBOutlet
    
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var btnHour: UIButton!
    @IBOutlet weak var btnRemove: UIButton!
    
    //MARK: Var/Let
    
    private var time:String = ""
    private var date:String = ""
    public var task:Task?
    
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.calendar.delegate = self
        
        self.configView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? TimePickerController {
            controller.delegate = self
        }
    }

   //MARK: IBAction
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func openComponent(_ sender: Any) {
        self.performSegue(withIdentifier: "segueComponentTime", sender: nil)
    }
    
    @IBAction func deleteTask(_ sender: Any) {
        TaskDefaultHelper().deleteTaskList(task: self.task!)
        self.dismiss(animated: true)
    }
    
    @IBAction func createTask(_ sender: Any) {
        self.createTaskCell()
    }
    
    //MARK: Func
    
    private func configView(){
        self.btnRemove.isHidden = self.task == nil
        guard let taskAux = self.task else {return}
        self.btnHour.setTitle(taskAux.time, for: .normal)
        self.txtTitle.text = taskAux.title
        self.date = taskAux.date
        self.time = taskAux.time
    }
    
    private func createTaskCell(){
        if self.task != nil {
            self.task!.date = self.date
            self.task!.time = self.time
            self.task!.title = self.txtTitle.text!
            
            TaskDefaultHelper().updateTaskList(task: self.task!)
            
        } else {
            var list:[Task] = TaskDefaultHelper().getTaskList()
            let task:Task = Task(id: TaskDefaultHelper().getNextID(), title: self.txtTitle.text ?? "No title", time: self.time, date: self.date)
            
            list.append(task)
            TaskDefaultHelper().saveTaskList(list: list)
        }
        
        
        self.dismiss(animated: true)
    }
}

extension ManageTasksTableController:FSCalendarDelegate, FSCalendarDelegateAppearance {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        self.date = Date().convertDateToString(date: date, dateFormatter: "dd/MM/yyyy")
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        let dateAux = Date().convertDateToString(date: date, dateFormatter: "dd/MM/yyyy")
        if self.task != nil {
            if self.date == dateAux {
                return .green
            }
        }
        return nil
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        let dateAux = Date().convertDateToString(date: date, dateFormatter: "dd/MM/yyyy")
        if self.task != nil {
            if self.date == dateAux {
                return .black
            }
        }
        return nil
    }
}

extension ManageTasksTableController: TimePickerProtocol {
    func sendTime(time: String) {
        self.btnHour.setTitle(time, for: .normal)
        self.time = time
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
