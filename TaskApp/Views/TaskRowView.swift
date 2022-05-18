//
//  TaskRowView.swift
//  TaskApp
//
//  Created by Brett Bax on 12/14/21.
//

import SwiftUI

struct TaskRowView: View {
    
    let task: TaskModel
    var body: some View {
        HStack{
            
            // Series of if statements to determine task's appearance
            
            // If finished:
            if task.isFinished {
                Image(systemName: task.isFinished ? "checkmark.circle" : "circle")
                    .font(.title)
                    .foregroundColor(.green)
                Text(task.title)
                    .font(.title2)
                    .strikethrough()
                    .foregroundColor(.gray)
                Text("")
                
            // If unfinished and urgent:
            } else if task.isUrgent {
                Image(systemName: task.isFinished ? "checkmark.circle" : "circle")
                    .font(.title)
                    .foregroundColor(.red)
                Text(task.title)
                    .font(.title2)
                Spacer()
                Spacer()
                Spacer()
                Text("🆘")
                
            // If unfinished and not urgent
            } else {
                Image(systemName: task.isFinished ? "checkmark.circle" : "circle")
                    .font(.title)
                Text(task.title)
                    .font(.title2)
            }
            Spacer()
        }
        .padding(.vertical, 10)
    }
}


// Nice 'lil example of how the TaskRowView is supposed to be functioning
struct TaskRowView_Previews: PreviewProvider {
    static var item1 = TaskModel(title: "Urgent & not finished", isUrgent: true, isFinished: false)
    static var item2 = TaskModel(title: "Urgent & finished", isUrgent: true, isFinished: true)
    static var item3 = TaskModel(title: "Not urgent & not finished", isUrgent: false, isFinished: false)
    
    static var previews: some View {
        Group {
            TaskRowView(task: item1)
            TaskRowView(task: item2)
            TaskRowView(task: item3)
        }
        .previewLayout(.sizeThatFits)
    }
}
