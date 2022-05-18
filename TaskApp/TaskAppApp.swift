//
//  TaskAppApp.swift
//  TaskApp
//
//  Created by Brett Bax on 12/14/21.
//

import SwiftUI

@main
struct TaskAppApp: App {
    
    
    @StateObject var taskViewModel: TaskViewModel = TaskViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TaskListView()
            }
            .environmentObject(taskViewModel)
        }
    }
}
