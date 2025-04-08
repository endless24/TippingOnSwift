//
//  Extensions.swift
//  YallBeTipping
//
//  Created by Joseph Iroh on 31/03/2025.
//

import UIKit

extension [MenuItem] {
    func calculateTotalPrice(with tip:TipOptions) -> Double {
        var total: Double = 0
        self.forEach { item in
            let Qty = Double(item.quantity)
            let sum =  item.price * Qty
            total += sum
        }
        return total * tip.rawValue
    }
}

extension Double {
    func toCurrency() -> String {
       let formmerter = NumberFormatter()
        formmerter.numberStyle = .currency
        formmerter.maximumFractionDigits = 2
//        let str = formmerter.string(from: NSNumber(value: self)) ?? "N/A"
        let value = NSNumber(value: self)
        let str = formmerter.string(from: value)
        return str ?? "N/A"
    }
}

extension UIViewController {
    func pushVC(_ vc: UIViewController) {
        navigationController?
            .pushViewController(
                vc, animated: true)
    }
}
