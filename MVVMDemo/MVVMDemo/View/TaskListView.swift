//
//  ContentView.swift
//  MVVMDemo
//
//  Created by Berkay on 28.01.2025.
//

import SwiftUI

struct TaskListView: View {
    @ObservedObject var viewModel = TaskViewModel()

    @State private var newTaskTitle = ""

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("New Task", text: $newTaskTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button("Add") {
                        viewModel.addTask(title: newTaskTitle)
                        newTaskTitle = ""
                    }
                    .padding(.leading, 8)
                }
                .padding()

                List(viewModel.tasks) { task in
                    HStack {
                        Text(task.title)
                            .strikethrough(task.isCompleted, color: .gray)

                        Spacer()

                        Button(action: {
                            viewModel.toggleTaskCompletion(task: task)
                        }) {
                            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(task.isCompleted ? .green : .gray)
                        }
                    }
                }
            }
            .navigationTitle("Tasks")
        }
    }
}

#Preview {
    TaskListView()
}
