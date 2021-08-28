//
//  AdviconListView.swift
//  what-to-wear-today
//
//  Created by Phil Yates on 30/05/2021.
//

import SwiftUI
import PresenterAbstraction

public struct AdviconListView: View {
    @Environment(\.theme) public var theme
    
    public let items: [AdviconListItem]
    
    public init(items: [AdviconListItem]) {
        self.items = items
    }
    
    public var body: some View {
        LazyVStack(spacing: 16) {
            ForEach(items) { item in
                AdviconView(item: item)
            }
        }
        .groupStyle(theme: theme)
    }
}

struct AdviconListView_Previews: PreviewProvider {
    static var previews: some View {
        AdviconListView(items: [
            AdviconListItem(
                id: UUID(),
                icon: "testImage",
                title: "Take your umbrella!",
                subTitle: "Looks like it is going to rain today"
            )
        ])
    }
}
