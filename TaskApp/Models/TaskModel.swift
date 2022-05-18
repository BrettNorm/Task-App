//
//  TaskModel.swift
//  TaskApp
//
//  Created by Brett Bax on 12/14/21.
//

import Foundation

struct TaskModel: Identifiable, Codable {
    let id: String
    let title: String
    let isUrgent: Bool
    let isFinished: Bool
    
    init(id: String = UUID().uuidString, title: String, isUrgent: Bool, isFinished: Bool) {
        self.id = id
        self.title = title
        self.isUrgent = isUrgent
        self.isFinished = isFinished
    }
    
    func statusUpdate() -> TaskModel {
        return TaskModel(id: id, title: title, isUrgent: isUrgent, isFinished: !isFinished)
    }
    
}
