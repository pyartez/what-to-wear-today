//
//  View+extensions.swift
//  
//
//  Created by Phil Yates on 12/06/2021.
//

import SwiftUI

struct RoundedGroup: ViewModifier {
    let theme: Theme
    
    func body(content: Content) -> some View {
            content
                .padding()
                .background(theme.color.surface)
                .cornerRadius(9.0)
        }
}

public extension View {
    func groupStyle(theme: Theme) -> some View {
        modifier(RoundedGroup(theme: theme))
    }
}
