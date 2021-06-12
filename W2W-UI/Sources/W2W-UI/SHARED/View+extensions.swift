//
//  View+extensions.swift
//  
//
//  Created by Phil Yates on 12/06/2021.
//

import SwiftUI

public extension View {
    func groupStyle() -> some View {
        self.padding()
            .background(Color("colors.groupBg"))
            .cornerRadius(9.0)
    }
}
