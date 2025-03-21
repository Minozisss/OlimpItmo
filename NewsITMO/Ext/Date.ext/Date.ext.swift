//
//  Date.ext.swift
//  NewsITMO
//
//  Created by Максим Кудрявцев on 21.03.2025.
//

import Foundation
extension Date {
    func dateToString() -> String {
        return self.formatted(.dateTime.hour().minute().day().month().year())
    }
}
