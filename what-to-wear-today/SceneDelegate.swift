//
//  SceneDelegate.swift
//  what-to-wear-today
//
//  Created by Phil Yates on 19/05/2021.
//

import UIKit
import SwiftUI
import UI
import Combine
import PresenterAbstraction

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Create the SwiftUI view that provides the window contents.
        let icons = [
            AdviconListItem(
                id: UUID(),
                icon: "advicons.umbrella",
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
        let mockPresenter = MockHomePresenter(state: stateProvider2.eraseToAnyPublisher())
        let presenter2 = HomeScreenObservableObject(presenter: mockPresenter)
        
        let palette = Palette(
            primary: Color("colors.groupBg"),
            secondary: Color("colors.groupBg"),
            background: Color("colors.background"),
            surface: Color("colors.groupBg"),
            onPrimary: Color.white,
            onSecondary: Color.white,
            onSurface: Color.white,
            onSurfaceSecondary: Color("colors.subTitle"),
            error: Color.red
        )
        
        let typography = Typography(
            h1: .largeTitle,
            h2: .title,
            h3: .title2,
            h4: .title3,
            subTitle1: .headline,
            subTitle2: .subheadline,
            body: .body,
            caption: .caption,
            button: .body,
            overline: .footnote
        )
        
        let theme = Theme(color: palette, font: typography, bundle: .main)
        
        let contentView = ContentView()
            .environmentObject(presenter2)
            .environment(\.theme, theme)

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

