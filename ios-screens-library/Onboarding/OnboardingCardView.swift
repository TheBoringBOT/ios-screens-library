//
//  OnboardingCardView.swift
//  ios-screens-library
//
//  Created by Gareth Richards on 2024-07-28.
//

import SwiftUI

struct OnboardingCardView: View {
    var imageName: String = "cat2"
    var title: String = "Lorem ipsum dolor"
    var subtitle: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."

    @State var showContent: Bool = false

    // Text height + adjusts sizing for image
    @State private var textHeight: CGFloat = 0.3

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 16) {
                // MARK: Image

                Spacer()
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height * (1 - textHeight))

                    .clipped()
                    .border(Color.red)

                // MARK: Body

                VStack(alignment: .center, spacing: 8) {
                    Text(title).font(.title)

                    Text(subtitle).font(.subheadline).multilineTextAlignment(.center)
                    Spacer()
                }
                .frame(maxHeight: geometry.size.height * textHeight)
                .border(.red)
            }
        }
    }
}

#Preview {
    OnboardingCardView()
}
