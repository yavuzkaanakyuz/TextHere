//
//  ContentView.swift
//  TextHere
//
//  Created by Yavuz Kaan Akyüz on 6.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var inputText = ""
    @State private var wordCount: Int = 0
    var body: some View {
        ZStack(alignment: .topTrailing) {
            TextEditor(text: $inputText)
                .font(.system(.title, design: .rounded))
                .fontWeight(.bold)
                .font(.system(size: 86))
                .padding()
                .padding(.top, 20)
                .onChange(of: inputText) { value in
                    let words = inputText.split { $0 == " " || $0.isNewline}
                    self.wordCount = words.count
                }
            
            Text("\(wordCount) words")
                .font(.headline)
                .foregroundColor(.secondary)
                .padding(.trailing)
        }
    }
}

#Preview {
    ContentView()
}
