//
//  settings.swift
//  document
//
//  Created by Simon Xu on 6/24/24.
//

import Foundation
import SwiftUI

@main
struct MenuTestApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
    .commands {
      CommandMenu("My Top Menu") {
        Button("Sub Menu Item") { print("You pressed sub menu.") }
          .keyboardShortcut("S")
      }
      CommandGroup(replacing: .pasteboard) {
        Button("Cut") { print("Cutting something...") }
          .keyboardShortcut("X")
        Button("Copy") { print("Copying something...") }
          .keyboardShortcut("C")
        Button("Paste") { print("Pasting something...") }
          .keyboardShortcut("V")
        Button("Paste and Match Style") { print("Pasting and Matching something...") }
          .keyboardShortcut("V", modifiers: [.command, .option, .shift])
        Button("Delete") { print("Deleting something...") }
          .keyboardShortcut(.delete)
        Button("Select All") { print("Selecting something...") }
          .keyboardShortcut("A")
      }
    }
  }
}
