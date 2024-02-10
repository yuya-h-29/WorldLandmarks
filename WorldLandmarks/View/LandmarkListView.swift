//
//  LandmarkListView.swift
//  WorldLandmarks
//
//  Created by Yuya Harada on 2024/02/10.
//

import SwiftUI

struct LandmarkListView: View {
    
    @State private var viewModel = LandmarkListViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.landmarks) { landmark in
                   LandmarkCell(landmark: landmark)
                }
            }
            .navigationTitle("🌏Landmarks")
            .searchable(text: $viewModel.searchText, prompt: "Search for a famous landmark")
            .overlay {
                if viewModel.landmarks.isEmpty {
                    ContentUnavailableView("Hmm, that place hasn't been discovered yet!",
                                           systemImage: "binoculars.fill",
                                           description: Text("Search for something more popular or make this the start of your own adventure!!"))
                }
            }
        }
    }
}

struct LandmarkCell: View {
    var landmark: Landmark
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(landmark.name).font(.headline.bold())
            
            Text(landmark.location).font(.subheadline)
        }
    }
}

#Preview {
    LandmarkListView()
}
