//
//  Tasks.swift
//  ToDoList
//
//  Created by Daniel Berg on 04/05/24.
//

import Foundation

class Task: Codable {
    var id:Int
    var title:String
    var time:String
    var date:String
    
    init(id:Int, title:String, time:String, date:String){
        self.id = id
        self.title = title
        self.time = time
        self.date = date
    }
}
