//
//  documentApp.swift
//  document
//
//  Created by Simon Xu on 6/24/24.
//

import SwiftUI

@main
struct documentApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: documentDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
