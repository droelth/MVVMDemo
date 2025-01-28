//
//  Task.swift
//  MVVMDemo
//
//  Created by Berkay on 28.01.2025.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool
}
