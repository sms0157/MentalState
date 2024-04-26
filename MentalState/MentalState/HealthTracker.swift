//
//  HealthTracker.swift
//  MentalState
//
//  Created by Sabrina Summerfield on 4/17/24.
//

import SwiftUI
import CoreMotion

struct HealthTracker: View {
    private var activities = [
        Activity(name: "Gaming"),
        Activity(name: "Walking"),
        Activity(name: "Working out"),
        Activity(name: "Reading"),
        Activity(name: "Hanging out with friends"),
        Activity(name: "Took medication"),
        Activity(name: "Ate a meal"),
        Activity(name: "Drank water"),
        Activity(name: "Went grocery shopping"),
        Activity(name: "Working"),
        Activity(name: "School")
    ]
    
    @State private var multiSelection = Set<Activity.ID>()
    @State private var selectedActivities = [Activity]()
    
    var body: some View {
        VStack {
            Text("What have you been up to?")
            List(activities, selection: $multiSelection) {
                Text($0.name)
            }
            .environment(\.editMode, .constant(.active))
            .onTapGesture {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.05, execute: {
                    selectedActivities = Array(multiSelection)
                    print(selectedActivities)
                })
            }
            Divider()
            Text("Done today:")
            List(selectedActivities, selection: $multiSelection) {
                Text($0.name)
            }
        }
        Text("\(multiSelection.count) selections")
        if multiSelection.count == 0 {
            Text("Try your best to complete something!")
        }
        if multiSelection.count == 1 {
            Text("Proud of you, let's keep moving!")
        }
        if multiSelection.count == 2 {
            Text("Good job today!")
        }
        if multiSelection.count == 3 {
            Text("Let's keep up this effort! Great job!")
        }
        if multiSelection.count >= 4 {
            Text("Amazing!")
        }
    }
}
#Preview {
    HealthTracker()
}
