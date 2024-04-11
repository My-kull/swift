//
//  Item.swift
//  Interestinger
//
//  Created by Micael Raste on 9.2.2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
