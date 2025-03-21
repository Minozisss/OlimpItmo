//
//  Text.ext.swift
//  NewsITMO
//
//  Created by Максим Кудрявцев on 21.03.2025.
//

import SwiftUI

extension Text {
    func titleText() -> some View {
        self
            .modifier(TitleTextModifier())
    }
    
    func descriptionText() -> some View {
        self
            .modifier(DescriptionTextModifier())
    }
    
    func dateText() -> some View {
        self
            .modifier(DateTextModifier())
    }
}

struct TitleTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16, weight: .medium))
            .foregroundStyle(.customTitle)
    }
}

struct DescriptionTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 12, weight: .regular))
            .foregroundStyle(.customTitle)
    }
}

struct DateTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 12, weight: .regular))
            .foregroundStyle(.secondary.opacity(0.4))
    }
}
