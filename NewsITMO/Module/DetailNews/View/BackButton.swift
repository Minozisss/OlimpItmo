//
//  BackButton.swift
//  NewsITMO
//
//  Created by Максим Кудрявцев on 21.03.2025.
//

import SwiftUI

struct BackButton: View {
    // MARK: - Properties
    @Environment(\.dismiss) var dismiss
    // MARK: - Body
    var body: some View {
        Button {
            dismiss()
        } label: {
            ZStack{
                Circle()
                    .frame(height: 30)
                    .foregroundStyle(.buttonBack)
                
                Image(systemName: "chevron.left")
                    .foregroundStyle(.background)
            }
        }

    }
}

#Preview {
    BackButton()
}
