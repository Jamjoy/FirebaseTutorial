//
//  FirebaseTutorialApp.swift
//  FirebaseTutorial
//
//  Created by Joyanta Mondal on 24/10/24.
//

import SwiftUI
import Firebase

@main
struct FirebaseTutorialApp: App {
    
    init () {
        FirebaseApp.configure()
        print("Configured Firebase")
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
