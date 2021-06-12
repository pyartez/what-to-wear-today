//
//  AdviconListView.swift
//  what-to-wear-today
//
//  Created by Phil Yates on 30/05/2021.
//

import SwiftUI

struct AdviconListItem: Identifiable {
    let id: UUID
    let icon: String
    let title: String
    let subTitle: String
}

struct AdviconListView: View {
    let items: [AdviconListItem]
    
    var body: some View {
        LazyVStack(spacing: 16) {
            ForEach(items) { item in
                AdviconView(item: item)
            }
        }
        .groupStyle()
    }
}

struct AdviconListView_Previews: PreviewProvider {
    static var previews: some View {
        AdviconListView(items: [
            AdviconListItem(
                id: UUID(),
                icon: "advicons.umbrella",
                title: "Take your umbrella!",
                subTitle: "Looks like it is going to rain today"
            )
        ])
    }
}
