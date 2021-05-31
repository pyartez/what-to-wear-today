//
//  AdviconView.swift
//  what-to-wear-today
//
//  Created by Phil Yates on 30/05/2021.
//

import SwiftUI

struct AdviconView: View {
    let item: AdviconListItem
    
    var body: some View {
        HStack() {
            Image(item.icon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: nil, alignment: .center)
                
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.headline)
                    .foregroundColor(Color.white)
                Text(item.subTitle)
                    .font(.subheadline)
                    .foregroundColor(Color("colors.subTitle"))
            }
            Spacer()
        }
    }
}

struct AdviconView_Previews: PreviewProvider {
    static var previews: some View {
        let item = AdviconListItem(
            id: UUID(),
            icon: "advicons.umbrella",
            title: "Take your umbrella!",
            subTitle: "It's going to rain today"
        )
        AdviconView(item: item)
    }
}
