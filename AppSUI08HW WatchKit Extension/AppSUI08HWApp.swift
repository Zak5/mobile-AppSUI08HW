//
//  AppSUI08HWApp.swift
//  AppSUI08HW WatchKit Extension
//
//  Created by Konstantin Zaharev on 28.02.2022.
//

import SwiftUI

@main
struct AppSUI08HWApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
