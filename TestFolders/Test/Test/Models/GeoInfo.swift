

import Foundation

import Foundation
// Define your response structures
struct IPResponse: Codable {
    let ip: String?
}

struct GeoInfo: Codable {
    let city: String?
    let region: String?
    let country: String?
    let loc: String?
    let org: String?
    let postal: String?
}
