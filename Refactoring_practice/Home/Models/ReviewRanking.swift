

import Foundation

struct ReviewRanking: Identifiable, Equatable {
    let id: Int
    let reviewImageURL: String
    let userProfileImageURL: String
    let nickname: String
    let comment: String?
}
