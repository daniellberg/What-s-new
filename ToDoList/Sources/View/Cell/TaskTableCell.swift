//
//  TaskTableCell.swift
//  ToDoList
//
//  Created by Daniel Berg on 02/05/24.
//

import UIKit

class TaskTableCell: UITableViewCell {

    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblTime: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    public func setTitle(title:String){
        self.lblTitle.text = title
    }
    
    public func setDate(date:String){
        self.lblDate.text = date
    }
    
    public func setTime(time:String){
        self.lblTime.text = time
    }
}
