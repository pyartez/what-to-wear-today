//
//  HourlyTimeItemViewModel.swift
//  
//
//  Created by Phil Yates on 12/06/2021.
//

import Foundation

public struct HourlyTimeItemViewModel: Identifiable {
    public let id: UUID
    public let time: String
    public let icon: String
    public let temp: String
    public let progressValue: Float
    public let progressMax: Float
    
    public init(id: UUID, time: String, icon: String, temp: String, progressValue: Float, progressMax: Float) {
        self.id = id
        self.time = time
        self.icon = icon
        self.temp = temp
        self.progressValue = progressValue
        self.progressMax = progressMax
    }
}
