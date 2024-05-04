//
//  TimePickerController.swift
//  ToDoList
//
//  Created by Daniel Berg on 03/05/24.
//

import UIKit

protocol TimePickerProtocol {
    func sendTime(time: String)
}

class TimePickerController: UIViewController {
    
    //MARK: IBOutlet
    @IBOutlet weak var btnOK: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var timePicker: UIDatePicker!
    
    //MARK: Var/Lets
    public var delegate:TimePickerProtocol?
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: IBAction
    @IBAction func close(_ sender: UIButton){
        if sender == self.btnOK {
            self.dismiss(animated: true){
                guard let delegate = self.delegate else {return}
                delegate.sendTime(time: "03:09")
            }
        } else {
            self.dismiss(animated: true)
        }
    }
}
