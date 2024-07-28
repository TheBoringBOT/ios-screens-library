//
//  Onboarding.swift
//  ios-screens-library
//
//  Created by Gareth Richards on 2024-07-28.
//

import SwiftUI

import SwiftUI

struct OnboardingView: View {
    // Show pagination dots
    @State private var showDots: Bool = true
    // Keeping tracking of current Tab
    @State private var currentTab = 0
    // Tab /  screen total count
    @State private var tabCount = 2
    // Main button title
    var buttonTitle: String {
        return currentTab == tabCount ? "Finish" : "Next"
    }

    var body: some View {
        VStack(alignment: .center) {
            TabView(selection: $currentTab,
                    content: {
                        OnboardingCardView(imageName: "cat1", title: "First Card")

                            .tag(0)
                        OnboardingCardView(imageName: "cat2", title: "Second Card")
                            .tag(1)
                        OnboardingCardView(imageName: "cat3", title: "Third Card")
                            .tag(2)
                    })
                    .padding()
                    .tabViewStyle(PageTabViewStyle())
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: showDots ? .always : .never))

            Button(action: {
                if currentTab < tabCount {
                    currentTab += 1
                }
            }) {
                Text(buttonTitle)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .font(.title3)
                    .fontWeight(.bold)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding([.leading, .trailing], 16)
            .padding(.bottom, 16)

            Spacer()
        }
    }
}

#Preview {
    OnboardingView()
}
