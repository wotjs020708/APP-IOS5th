//
//  JounrnalEntry.swift
//  JRNL
//
//  Created by 어재선 on 5/10/24.
//

import UIKit

class JournalEntry {
    // MARK: - Properties
    let date: Date
    let rating: Int
    let entryTitle: String
    let entrybody: String
    let photo: UIImage?
    let latitude: Double?
    let longitude: Double?
    
    init?(date: Date, rating: Int, title: String, body: String, photo: UIImage? = nil, latitude: Double? = nil, longitude: Double? = nil) {
        if title.isEmpty || body.isEmpty || rating < 0 || rating > 5 { return nil }
        self.date = Date()
        self.rating = rating
        self.entryTitle = title
        self.entrybody = body
        self.photo = photo
        self.latitude = latitude
        self.longitude = longitude
    }
}
