//
//  StretchyHeader.swift
//  ios-screens-library
//
//  Created by Gareth Richards on 2024-07-27.
//

import SwiftUI

struct StretchyHeader: View {
    let height: CGFloat = 300

    var body: some View {
        GeometryReader { proxy in
            let offset = proxy.frame(in: .global).minY
            let width = proxy.frame(in: .global).width

            ZStack {
                Image("cone")
                    .resizable()
                    .scaledToFill()

                    .frame(width: width, height: 300 + max(0, offset))
                    .clipped()
                    .transformEffect(.init(translationX: 0, y: -max(0, offset)))

                VStack(alignment: .center, spacing: 8) {
                    Text("Stretchy Header")
                        .font(.title)
                    Text("This is a stretchy header inspired by spotify")
                        .font(.subheadline)
                }
                .offset(y: -max(0, offset) / 2)
            }

            .frame(width: width, height: height)
        }
        .frame(height: height)
    }
}

#Preview {
    ScrollView {
        StretchyHeader()

//            .frame(height: 300)
        // Add your list here
        VStack(alignment: .leading) {
            ForEach(1 ..< 51) { number in
                Text("\(number)")
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .padding(.vertical, 4)
            }
        }
    }
}
