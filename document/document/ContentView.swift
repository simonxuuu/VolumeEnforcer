//
//  ContentView.swift
//  document
//
//  Created by Simon Xu on 6/24/24.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: documentDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

#Preview {
    ContentView(document: .constant(documentDocument()))
}
