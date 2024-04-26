//
//  MoodTracker.swift
//  MentalState
//
//  Created by Sabrina Summerfield on 4/17/24.
//

import SwiftUI

struct MoodTracker: View {
    @State private var color: Color = .yellow
    @State private var selectedMood: String = "Happy"
    @State private var reminders = ["Love yourself!"]
    @State private var alert = false
    @State private var add = ""
    @State private var didTap:Bool = false
    
    let moods = ["Happy", "Sad", "Angry", "Content", "Indifferent", "Embarrassed", "Jealous", "Exhausted", "Stressed", "Upset", "Disappointed", "Not Sure"]
    
    var body: some View {
        VStack {
            LabeledContent("What color are you today?") {
                ColorPicker("", selection: $color, supportsOpacity: false)
            }
            .bold()
            .padding()
            
            LabeledContent("How are you feeling?") {
                Picker(selection: $selectedMood, label: Text("")) {
                    ForEach(moods, id: \.self) {
                        Text($0)
                    }
                }
            }
            .bold()
            .padding()
            
            Spacer()
                .frame(height: 30)
            
            Rectangle()
                .frame(width: 300, height: 1)
            Text("Add happy reminders below!")
                .bold()
            Rectangle()
                .frame(width: 300, height: 1)
            
            NavigationView {
                List {
                    ForEach(reminders, id: \.self) { reminder in
                        Text(reminder)
                    }.onDelete { indexSet in
                        reminders.remove(atOffsets: indexSet)
                    }
                    .onMove { reminders.move(fromOffsets: $0, toOffset: $1)}
                }
                .background(Color(color))
                .toolbar {
                    EditButton()
                    Button("+") {
                        alert.toggle()
                    }
                    .alert("What's on your mind?", isPresented: $alert) {
                        TextField("Add something here!", text: $add)
                        Button("Add", action: submit)
                    }
                }
                
            }
        }
        .scrollContentBackground(.hidden)
        .background(Color(color))
    }
    func submit() {
        print("\(add)")
        reminders.append(add)
    }
    }

#Preview {
    MoodTracker()
}
