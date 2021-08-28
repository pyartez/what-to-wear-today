//
//  ContentView.swift
//  what-to-wear-today
//
//  Created by Phil Yates on 19/05/2021.
//

import SwiftUI
import Combine
import PresenterAbstraction

public struct ContentView: View {
    @EnvironmentObject var presenter: HomeScreenObservableObject
    @Environment(\.theme) public var theme
    
    public init() {}
    
    public var body: some View {
        ZStack {
            theme.color.background.ignoresSafeArea()
            switch presenter.state {
            case .loading:
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        ProgressView("Loading")
                            .colorScheme(.dark)
                            .onAppear(perform: {
                                presenter.start()
                            })
                        Spacer()
                    }
                    Spacer()
                }.frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .topLeading
                  )
            case .ready(let viewModel):
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack(alignment: .leading, spacing: 16) {
                        
                        Text(viewModel.title)
                            .font(theme.font.h2)
                            .bold()
                        
                        AdviconListView(items: viewModel.advicons)
                        HourlyTimelineView(items: viewModel.hourlyTimeline)
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
                .foregroundColor(theme.color.onSurface)
                .background(theme.color.background)
            case .error:
                Text("Error")
                    .font(.title)
                    .bold()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let stateProvider = Combine.Just<HomeScreenState>(.loading).setFailureType(to: Error.self)
        let presenter = HomeScreenObservableObject(stateProvider: stateProvider.eraseToAnyPublisher())
        ContentView()
            .environmentObject(presenter)
        
        
        
        let icons = [
            AdviconListItem(
                id: UUID(),
                icon: "testImage",
                title: "This is a test item",
                subTitle: "This is a test item subtitle"
            )
        ]
        
        let viewModel = HomeScreenViewModel(
            title: "Rugeley",
            advicons: icons,
            hourlyTimeline: []
        )
        let stateProvider2 = Combine.Just<HomeScreenState>(.ready(viewModel)).setFailureType(to: Error.self)
        let presenter2 = HomeScreenObservableObject(stateProvider: stateProvider2.eraseToAnyPublisher())
        ContentView()
            .environmentObject(presenter2)
    }
}
