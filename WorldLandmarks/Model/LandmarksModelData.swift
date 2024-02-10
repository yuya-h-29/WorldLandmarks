//
//  LandmarksModelData.swift
//  WorldLandmarks
//
//  Created by Yuya Harada on 2024/02/10.
//

import Foundation

var landmarkData: [Landmark] = loadJson(filename: "LandmarkData.json")

struct ResponseData: Decodable {
    var landmarks: [Landmark]
}

struct Landmark: Codable, Identifiable {
    var id: Int
    var name: String
    var location: String
}

func loadJson(filename fileName: String) -> [Landmark] {
    
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("Couldn't find \(fileName).")
    }
    
    let data: Data
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(fileName). Error: \(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        let jsonData = try decoder.decode(ResponseData.self, from: data)
        return jsonData.landmarks
    } catch {
        fatalError("Couldn't parse data. Error: \(error)")
    }
}
