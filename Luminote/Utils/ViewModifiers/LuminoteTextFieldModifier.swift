//
//  LuminoteTextFieldModifier.swift
//  Luminote
//
//  Created by Tobias Knoeppel on 07.01.25.
//

import SwiftUI

struct LuminoteTextFieldModifier: ViewModifier{
    func body(content: Content) -> some View {
        content.font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}
