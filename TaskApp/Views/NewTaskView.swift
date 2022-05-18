//
//  NewTaskView.swift
//  TaskApp
//
//  Created by Brett Bax on 12/14/21.
//

import SwiftUI

struct NewTaskView: View {
    
    @State var textFieldText: String = ""
    @State var urgencyBool: Bool = false
    @EnvironmentObject var taskViewModel: TaskViewModel
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        ScrollView {
            VStack {
                
                // Text field for title of task
                TextField("Fill my headlights with blinker fluid", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(.lightGray))
                    .cornerRadius(8)
                
                
                // Urgency field & checkbox
                HStack{
                    Text("Is it urgent?")
                        .font(.title2)
                        .frame(maxWidth: 1000, maxHeight: 60, alignment: .leading)
                        .padding(20)
                    Spacer()
                    Image(systemName: urgencyBool ? "checkmark.circle" : "circle")
                        .font(.title)
                        .foregroundColor(urgencyBool ? .red : .black)
                        .onTapGesture {
                            withAnimation(.linear) {
                                toggleUrgency()
                            }
                        }
                }
                
                // Button to add a task
                Button(action: addTaskButton, label: {
                    Text("Add Task")
                        .foregroundColor(.white)
                        .frame(height: 50)
                        .frame(maxWidth: 125)
                        .background(Color.accentColor)
                        .cornerRadius(20)
                })
                    .padding(20)
            }
            .padding(15)
        }
        .navigationTitle("New Task")
    }
    
    // adding task to list
    func addTaskButton() {
        taskViewModel.addTask(title: textFieldText, isUrgent: urgencyBool )
        presentationMode.wrappedValue.dismiss()
    }
    
    // toggling task urgency
    func toggleUrgency() {
        if !urgencyBool {
            urgencyBool = true
        } else {
            urgencyBool = false
        }
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NewTaskView()
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(TaskViewModel())
    }
}
