

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    @Published var ipAddress: String = ""
    @Published var geoInfo: GeoInfo?
    @Published var isLoading: Bool = true

    
    func fetchPublicIP() {
        NetworkManager.fetchData(networkType: .GET, urlStr: .ipify, modelType: IPResponse.self){ result in
            DispatchQueue.main.async{[weak self] in
                switch result {
                case .success(let ipResponse):
                    self?.ipAddress = ipResponse.ip ?? ""
                    self?.fetchGeoInfo(for: ipResponse.ip ?? "") // Fetch geolocation info using the retrieved IP
                case .failure(let error):
                        MyAlerts.shared.showToast(error.localizedDescription)
                    
                }
            }
        }
    }

    private func fetchGeoInfo(for ip: String) {
        NetworkManager.fetchData(networkType: .POST, urlStr: .geo(ip: ip), modelType: GeoInfo.self){ result in
            DispatchQueue.main.async{[weak self] in
                switch result {
                case .success(let geoInfoRes):
                    self?.geoInfo = geoInfoRes
                    self?.isLoading = false
                case .failure(let error):
                        MyAlerts.shared.showToast(error.localizedDescription)
                    
                }
            }
        }
      
    }
}
