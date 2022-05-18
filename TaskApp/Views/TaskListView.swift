//
//  TaskListView.swift
//  TaskApp
//
//  Created by Brett Bax on 12/14/21.
//
//


import SwiftUI

struct TaskListView: View {
    
    @EnvironmentObject var taskViewModel: TaskViewModel
    
    var body: some View {
        
        // I cannot get this gradient to work.
        ZStack{
            
//            LinearGradient(colors: [.red, .orange, .yellow, .green, .blue, .purple, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
//                .edgesIgnoringSafeArea(.all)
            
            // List of all tasks
            List {
                ForEach(taskViewModel.tasks) { task in
                    TaskRowView(task: task)
                    // tapping a task toggles its completion status
                        .onTapGesture {
                            withAnimation(.linear) {
                                taskViewModel.completionToggle(task: task)
                            }
                        }
                }
                .onMove(perform: taskViewModel.moveTask)
                .onDelete(perform: taskViewModel.deleteTask)
            }
            
            .navigationTitle("Tasks")
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                    NavigationLink("Add task", destination: NewTaskView())
            )
            // After the initial panic, stackoverflow informed me that some aspects of
            // navigation (or all?) were deprecated somewhere in iOS 14(.3?) and had a fix
            // on the very first post that I checked for a specific error I was receiving.
            // ".navigationViewStyle(.stack)" Love to see it.
            .navigationViewStyle(.stack)
        }
    }
}


struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TaskListView()
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(TaskViewModel())
    }
}


