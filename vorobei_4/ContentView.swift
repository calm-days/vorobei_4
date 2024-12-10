//
//  ContentView.swift
//  vorobei_4
//
//  Created by Raman Liukevich on 05/12/2024.
//

import SwiftUI

struct ContentView: View {
    @State var onTap: Bool = false

    var body: some View {
        HStack(spacing: 0) {
            Button {
                withAnimation(.snappy) {
                    onTap.toggle()
                } completion: {
                    onTap = false
                }

            } label: {
                HStack(spacing: 0) {

                    Image(systemName: "play.fill")
                        .resizable()
                        .frame(width: onTap ? 50 : 0, height: onTap ? 50 : 0)

                    Image(systemName: "play.fill")
                        .resizable()
                        .frame(width: 50, height: 50)

                    Image(systemName: "play.fill")
                        .resizable()
                        .frame(width: onTap ? 0.5 : 50, height: onTap ? 0.5 : 50)

                }
                .foregroundStyle(.tint)
            }
            .buttonStyle(RoundButton())
        }
    }
}

struct RoundButton: ButtonStyle {
    @State private var showBackground = false
    @State private var circleScale: CGFloat = 1.0

    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .fill(Color.black.opacity(0.2))
                .frame(width: 135, height: 135)
                .scaleEffect(circleScale)
                .animation(.easeOut(duration: 0.22), value: circleScale)
                .opacity(showBackground ? 1 : 0)
                .animation(.easeOut(duration: 0.22), value: showBackground)

            configuration.label
                .padding()
                .scaleEffect(configuration.isPressed ? 0.6 : 1)
                .animation(.easeOut(duration: 0.22), value: configuration.isPressed)
                .onChange(of: configuration.isPressed) { oldValue, isPressed in
                    if isPressed {
                        showBackground = true
                        circleScale = 0.8
                    } else {
                        showBackground = false
                        circleScale = 1.0
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
