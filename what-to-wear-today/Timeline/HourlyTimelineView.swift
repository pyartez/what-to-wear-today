//
//  HourlyTimelineView.swift
//  what-to-wear-today
//
//  Created by Phil Yates on 02/06/2021.
//

import SwiftUI

struct HourlyTimelineViewModel {
    let model: HourlyTimeItemViewModel
    let separator: Bool
}

struct HourlyTimelineView: View {
    let items: [HourlyTimelineViewModel]
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(items, id: \.model.id) { item in
                HourlyTimeItemView(model: item.model)
                if item.separator {
                    HStack {
                        Spacer()
                            .frame(maxWidth: 40)
                        Divider()
                            .frame(maxWidth: 5)
                            .background(Color.gray)
                        Spacer()
                    }.frame(maxHeight: 10)
                }
            }
        }

    }
}

struct HourlyTimelineView_Previews: PreviewProvider {
    static var previews: some View {
        let model = HourlyTimeItemViewModel(
            id: UUID(),
            time: "11:00",
            icon: "cloud.sun.rain.fill",
            temp: "10C",
            progressValue: 20,
            progressMax: 50
        )
        
        let viewModel = HourlyTimelineViewModel(
            model: model,
            separator: false
        )
        HourlyTimelineView(items: [viewModel])
    }
}
