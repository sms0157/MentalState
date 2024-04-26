//
//  HealthModel.swift
//  MentalState
//
//  Created by Sabrina Summerfield on 4/21/24.
//

import Foundation

struct Activity: Identifiable, Hashable {
    let name: String
    var id: Self { self }
}
