//
//  ToDoList.swift
//  MentalState
//
//  Created by Sabrina Summerfield on 4/17/24.
//

import SwiftUI

struct ToDoList: View {
    
    @State private var items = ["Drink water"]
    @State private var alert = false
    @State private var add = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items, id: \.self) { todo in
                    Text(todo)
                }.onDelete { indexSet in
                    items.remove(atOffsets: indexSet)
                }
                .onMove { items.move(fromOffsets: $0, toOffset: $1)}
                }
                .toolbar {
                    EditButton()
                    Button("+") {
                        alert.toggle()
                    }
                    .alert("What's there to do?", isPresented: $alert) {
                        TextField("Add something here!", text: $add)
                        Button("Add", action: submit)
                    }
                }
                .navigationTitle("To-Do List:")
            }
        }
        func submit() {
            print("\(add)")
            items.append(add)
        }
    }




#Preview {
    ToDoList()
}
