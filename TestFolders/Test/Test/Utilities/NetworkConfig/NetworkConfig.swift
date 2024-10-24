
import Foundation



enum NetworkError: String, Error {
    case invalidURL
    case noData
    case requestFailed = "request failed"
}


enum NetworkType: String {
    case POST
    case GET
    case PUT
}

enum EndPoint {
    case ipify
    case geo(ip: String) 
    var url: String {
        switch self {
        case .ipify:
            return "https://api.ipify.org?format=json"
        case .geo(let ip):
            return "https://ipinfo.io/\(ip)/geo"
        }
    }
}


