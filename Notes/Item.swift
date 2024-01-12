//
//  Item.swift
//  Notes
//
//  Created by yessenia ramos on 12/01/24.
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
