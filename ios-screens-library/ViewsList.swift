//
//  ViewsList.swift
//  ios-screens-library
//
//  Created by Gareth Richards on 2024-07-27.
//

import SwiftUI

enum AvailableViews: String, CaseIterable, Identifiable {
    case stretchyHeader = "Stretchy Header"

    var id: String { rawValue }

    @ViewBuilder
    var view: some View {
        switch self {
        case .stretchyHeader:
            ScrollView {
                StretchyHeader()
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
    }
}

struct ViewsList: View {
    var body: some View {
        List(AvailableViews.allCases) { viewCase in
            NavigationLink(destination: viewCase.view) {
                Text(viewCase.rawValue)
            }
        }
        .navigationTitle("Available Views")
    }
}

#Preview {
    ViewsList()
}
