//
//  ContentView.swift
//  what-to-wear-today
//
//  Created by Phil Yates on 19/05/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack(alignment: .leading, spacing: 16) {
                Text("Rugeley")
                    .font(.title)
                    .bold()
                
                AdviconListView(items: [
                    AdviconListItem(
                        id: UUID(),
                        icon: "advicons.umbrella",
                        title: "Take your umbrella!",
                        subTitle: "Looks like it is going to rain today"
                    )
                ])
                
                HourlyTimelineView(items: [
                    HourlyTimelineViewModel(
                        model: HourlyTimeItemViewModel(
                            id: UUID(),
                            time: "11:00",
                            icon: "cloud.sun.rain.fill",
                            temp: "10C",
                            progressValue: 20,
                            progressMax: 50
                        ),
                        separator: false
                    )
                ])
                
            }
            .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .topLeading
            )
            .padding()
            .animation(.default)
        })
        .foregroundColor(Color.white)
        .background(Color("colors.background"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func groupStyle() -> some View {
        self.padding()
            .background(Color("colors.groupBg"))
            .cornerRadius(9.0)
    }
}
