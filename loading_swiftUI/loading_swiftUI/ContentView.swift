//
//  ContentView.swift
//  funny_question
//
//  Created by Tien Thanh on 11/7/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoading = false
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(.systemGray5), lineWidth: 14.0)
                .frame(width: 100.0, height: 100.0)
            Circle()
                .trim(from: 0.0, to: 0.2)
                .stroke(Color.cyan,
                        style: StrokeStyle(lineWidth: 14.0,
                                           lineCap: .round))
                .frame(width: 100.0, height: 100.0)
                .rotationEffect(.degrees(isLoading ? 360.0 : 0.0))
                .animation(.linear(duration: 1).repeatForever(autoreverses: false),
                           value: isLoading)
                .onAppear() {
                    isLoading = true
                }
        }
    }
}

#Preview {
    ContentView()
}

struct SecondContentView: View {
    @State private var isLoading = false
    var body: some View {
        ZStack {
            Text("Loading...")
                .font(.system(.body))
                .bold()
                .offset(x: 0, y: -25)
            
            RoundedRectangle(cornerRadius: 4.0)
                .stroke(Color(.systemGray5), lineWidth: 4)
                .frame(width: 250, height: 4)
            
            RoundedRectangle(cornerRadius: 4.0)
                .stroke(Color(.cyan), lineWidth: 4)
                .frame(width: 40, height: 4)
                .offset(x: isLoading ? 105 : -105, y: 0)
                .animation(.linear(duration: 1).repeatForever(autoreverses: true), value: isLoading)
                .onAppear() {
                    isLoading = true
                }
        }
    }
}

#Preview("second") {
    SecondContentView()
}
