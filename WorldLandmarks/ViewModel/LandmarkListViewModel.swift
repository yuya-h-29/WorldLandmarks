//
//  LandmarkListViewModel.swift
//  WorldLandmarks
//
//  Created by Yuya Harada on 2024/02/10.
//

import SwiftUI
import Observation

@Observable
final class LandmarkListViewModel {
    
    var landmarks: [Landmark] {
        if searchText.isEmpty {
            return landmarkData
        } else {
            return landmarkData.filter { $0.name.localizedStandardContains(searchText) }
        }
    }
    
    var searchText = ""
}
