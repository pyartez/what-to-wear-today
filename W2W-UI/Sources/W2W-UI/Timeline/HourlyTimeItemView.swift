//
//  HourlyTimeItemView.swift
//  what-to-wear-today
//
//  Created by Phil Yates on 02/06/2021.
//

import SwiftUI
import W2W_Presenter

public struct HourlyTimeItemView: View {
    public let model: HourlyTimeItemViewModel
    
    public init(model: HourlyTimeItemViewModel) {
        self.model = model
    }
    
    public var body: some View {
        HStack(spacing: 16) {
            Text(model.time)
                .font(.title3)
                .bold()
                .foregroundColor(Color.white)
            
            Image(systemName: model.icon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: nil, height: 30, alignment: .center)
            
            Text(model.temp)
                .font(.headline)
                .bold()
                .foregroundColor(Color.black)
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                .background(Color.green)
                .cornerRadius(50)
            
            ProgressView(value: model.progressValue, total: model.progressMax)
                .accentColor(Color.green)
                .scaleEffect(x: 1.0, y: 2.0, anchor: .center)
        }.groupStyle()
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
