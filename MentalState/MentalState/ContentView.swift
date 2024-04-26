//
//  ContentView.swift
//  MentalState
//
//  Created by Sabrina Summerfield on 4/17/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            NavigationView {
                List {
                    
                    Section {
                        NavigationLink {
                            MoodTracker()
                        } label: { Text(Image(systemName: "face.smiling")) + Text(" Mood Tracker")
                        }
                    }
                    .frame(width: 300, height: 50)
                    .listRowBackground(Color.cyan)
                    
                    Section {
                        NavigationLink {
                            HealthTracker()
                        } label: { Text(Image(systemName: "heart")) + Text(" Health Tracker")
                        }
                    }
                    .frame(width: 300, height: 50)
                    .listRowBackground(Color.blue)
                    
                    Section {
                        NavigationLink {
                            ToDoList()
                        } label: { Text(Image(systemName: "list.bullet.clipboard")) + Text(" To-Do List")
                        }
                    }
                    .frame(width: 300, height: 50)
                    .listRowBackground(Color.purple)
                    
                    Section {
                        NavigationLink {
                            CalmingSounds()
                        } label: { Text(Image(systemName: "moon.stars")) + Text(" Calming Sounds")
                        }
                    }
                    .frame(width: 300, height: 50)
                    .listRowBackground(Color.indigo)
                    
                }
                .scrollContentBackground(.hidden)
                .navigationTitle("Mental Tools")
                .background(Gradient(colors: [.blue, .purple, .indigo]).opacity(0.6))
            }
            
        }
    }



#Preview {
    ContentView()
}
