//
//  HourlyTimeItemView.swift
//  what-to-wear-today
//
//  Created by Phil Yates on 02/06/2021.
//

import SwiftUI
import PresenterAbstraction

public struct HourlyTimeItemView: View {
    @Environment(\.theme) public var theme
    
    public let model: HourlyTimeItemViewModel
    
    public init(model: HourlyTimeItemViewModel) {
        self.model = model
    }
    
    public var body: some View {
        HStack(spacing: 16) {
            Text(model.time)
                .font(theme.font.h3)
                .bold()
                .foregroundColor(theme.color.onSurface)
            
            Image(systemName: model.icon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: nil, height: 30, alignment: .center)
            
            Text(model.temp)
                .font(theme.font.subTitle1)
                .bold()
                .foregroundColor(Color.black)
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                .background(Color.green)
                .cornerRadius(50)
            
            ProgressView(value: model.progressValue, total: model.progressMax)
                .accentColor(Color.green)
                .scaleEffect(x: 1.0, y: 2.0, anchor: .center)
        }.groupStyle(theme: theme)
    }
}

struct HourlyTimeItemView_Previews: PreviewProvider {
    static var previews: some View {
        let model = HourlyTimeItemViewModel(
            id: UUID(),
            time: "11:00",
            icon: "cloud.sun.rain.fill",
            temp: "10C",
            progressValue: 20,
            progressMax: 50
        )
        HourlyTimeItemView(model: model)
    }
}
