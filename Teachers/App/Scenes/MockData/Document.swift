//
//  Document.swift
//  Teachers
//
//  Created by Rahim on 03/04/2021.
//

import Foundation
import DateToolsSwift

struct Document {
    var name: String
    var size: String
    var date: Date

    var formattedDate: String {
        date.timeAgoSinceNow
    }

    static var mockData = [
        Document(name: "Doc..Name.doc", size: "12 MB", date: Date()),
        Document(name: "Doc..Name.doc", size: "12 MB", date: Date()),
        Document(name: "Doc..Name.doc", size: "12 MB", date: Date())
    ]
}
