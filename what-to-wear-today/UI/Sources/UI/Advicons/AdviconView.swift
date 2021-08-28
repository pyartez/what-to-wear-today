//
//  AdviconView.swift
//  what-to-wear-today
//
//  Created by Phil Yates on 30/05/2021.
//

import SwiftUI
import PresenterAbstraction

public struct AdviconView: View {
    @Environment(\.theme) public var theme
    
    public let item: AdviconListItem
    
    public init(item: AdviconListItem) {
        self.item = item
    }
    
    public var body: some View {
        HStack() {
            Image(item.icon, bundle: theme.bundle)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: nil, alignment: .center)
                
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(theme.font.subTitle1)
                    .foregroundColor(theme.color.onSurface)
                Text(item.subTitle)
                    .font(theme.font.subTitle2)
                    .foregroundColor(theme.color.onSurfaceSecondary)
            }
            Spacer()
        }
    }
}

struct AdviconView_Previews: PreviewProvider {
    static var previews: some View {
        let item = AdviconListItem(
            id: UUID(),
            icon: "testImage",
            title: "Take your umbrella!",
            subTitle: "It's going to rain today"
        )
        AdviconView(item: item)
    }
}
