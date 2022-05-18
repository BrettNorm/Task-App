//
//  TaskViewModel.swift
//  TaskApp
//
//  Created by Brett Bax on 12/14/21.
//
//
//  Simple CRUD operations
//  Technically, my 'update' is only a task's completion status and not the
//  actual content of the task itself.

import Foundation

class TaskViewModel: ObservableObject {
    
    @Published var tasks: [TaskModel] = []
    
    let taskKey: String = "task_list"
    
    init() {
        getTasks()
    }
    
    // This was easier to use than Core Data and, apparently according to the internet
    // where all things you see must be true, useing UserDefaults is generally considered
    // okay when it involves small amounts of data.
    // Function called when any changes are made to task list or task properties.
    func dataPersistance() {
        if let encodedData = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encodedData, forKey: taskKey)
        }
    }
    
    
    // toggle for a task's 'isFinished' property
    func completionToggle(task: TaskModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id}) {
            tasks[index] = task.statusUpdate()
        }
        dataPersistance()
    }
    
    
    // grabbing tasks
    func getTasks() {

        guard let data = UserDefaults.standard.data(forKey: taskKey) else {return}
        guard let persistantData = try? JSONDecoder().decode([TaskModel].self, from: data) else {return}
    
        // Sorting by 'isFinished' value when loading app
        self.tasks = persistantData.sorted {
            (!$0.isFinished) && ($1.isFinished)
        }
    }
    
    // deleting
    func deleteTask(indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
        dataPersistance()
    }
    
    // moving
    func moveTask(from: IndexSet, to: Int) {
        tasks.move(fromOffsets: from, toOffset: to)
        dataPersistance()
    }
    
    // adding
    func addTask(title: String, isUrgent: Bool) {
        let newTask = TaskModel(title: title, isUrgent: isUrgent, isFinished: false)
        tasks.append(newTask)
        dataPersistance()
    }
   
    
}
