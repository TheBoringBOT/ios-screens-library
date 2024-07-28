//
//  CardToModal.swift
//  ios-screens-library
//
//  Created by Gareth Richards on 2024-07-27.
//

/// WORK IN PROGRESS

import SwiftUI

struct Card: View {
    var namespace: Namespace.ID

    var body: some View {
        VStack {
            Text("Hello, World!")
                .matchedGeometryEffect(id: "text", in: namespace)
        }
        .frame(maxWidth: 200, maxHeight: 200)
        .background(Color.pink)
        .cornerRadius(12)
        .matchedGeometryEffect(id: "BG", in: namespace)
    }
}

struct Modal: View {
    var namespace: Namespace.ID

    var body: some View {
        VStack {
            Text("Hello, World!")
                .matchedGeometryEffect(id: "text", in: namespace)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green)
        .cornerRadius(12)
        .matchedGeometryEffect(id: "BG", in: namespace)
    }
}

struct CardToModal: View {
    @State private var isActive: Bool = false
    @Namespace private var namespace

    var body: some View {
        ZStack {
            if isActive {
                Card(namespace: namespace)
                    .transition(.asymmetric(insertion: .scale, removal: .identity))

            } else {
                Modal(namespace: namespace)
                    .zIndex(1)
//                    .transition(.asymmetric(insertion: .scale, removal: .scale))
            }
        }.onTapGesture {
            withAnimation(.spring(response: 0.7, dampingFraction: 0.8)) {
                isActive.toggle()
            }
        }
    }
}

#Preview {
    Group {
//    let columns = [
//      GridItem(.flexible()),
//      GridItem(.flexible()),
//      GridItem(.flexible()),
//      GridItem(.flexible()),
//    ]
//
//    LazyVGrid(columns: columns, spacing: 20) {
//      ForEach(0 ..< 8) { _ in
//        CardToModal()
//      }
//    }
        CardToModal()
    }
}
