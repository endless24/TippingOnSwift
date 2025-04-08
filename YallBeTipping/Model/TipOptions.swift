//
//  TipOptions.swift
//  YallBeTipping
//
//  Created by Joseph Iroh on 24/03/2025.
//

import Foundation

enum TipOptions: Double {
    case small = 1.18,
         medium = 1.2,
         large = 1.22,
         none = 1
    
    func toString() -> String {
        switch self {
        case .small:
            return "18%"
        case .medium:
            return "20%"
        case .large:
            return "22%"
        case .none:
            return "No Tip"
        }
    }
}
