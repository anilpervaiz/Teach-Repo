//
//  SessionMock.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//

import Foundation

struct Session {
    var subject: String
    var curriculum: String
    var user: User
    var date: Date
    var medium: Medium
    var state: State

    lazy var sessionDate: String = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E d MMM, h:mm a"

        return dateFormatter.string(from: date)
    }()

    static var mockData: [Session] {
        [
            Session(subject: "Math",
                    curriculum: "American Curriculum",
                    user: .mockData,
                    date: Date(),
                    medium: .online,
                    state: .upcoming),
            Session(subject: "Math",
                    curriculum: "American Curriculum",
                    user: .mockData,
                    date: Date(),
                    medium: .online,
                    state: .upcoming),
            Session(subject: "Math",
                    curriculum: "American Curriculum",
                    user: .mockData,
                    date: Date(),
                    medium: .online,
                    state: .upcoming),
            Session(subject: "Math",
                    curriculum: "American Curriculum",
                    user: .mockData,
                    date: Date(),
                    medium: .online,
                    state: .upcoming)
        ]
    }

    enum State {
        case upcoming

        var title: String {
            switch self {
            case .upcoming: return "Upcoming"
            }
        }

        var titleColor: ColorAsset {
            switch self {
            case .upcoming: return Asset.Colors.halfBaked
            }
        }

        var backgroundColor: ColorAsset {
            switch self {
            case .upcoming: return Asset.Colors.lightHalfBaked
            }
        }
    }

    enum Medium {
        case online

        var themeColor: ColorAsset {
            switch self {
            case .online: return Asset.Colors.blue
            }
        }

        var title: String {
            switch self {
            case .online: return "Online"
            }
        }

        var icon: ImageAsset {
            switch self {
            case .online: return Asset.Media.sessionTypeOnline
            }
        }
    }

}

