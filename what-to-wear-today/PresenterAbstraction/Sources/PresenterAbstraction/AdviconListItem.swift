//
//  AdviconListItem.swift
//  
//
//  Created by Phil Yates on 12/06/2021.
//

import Foundation

public struct AdviconListItem: Identifiable {
    public let id: UUID
    public let icon: String
    public let title: String
    public let subTitle: String
    
    public init(id: UUID, icon: String, title: String, subTitle: String) {
        self.id = id
        self.icon = icon
        self.title = title
        self.subTitle = subTitle
    }
}
