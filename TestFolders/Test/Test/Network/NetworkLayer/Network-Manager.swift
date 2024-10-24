
import Foundation

class NetworkManager {
    static func fetchData<T: Codable>(networkType: NetworkType, urlStr: EndPoint, modelType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: urlStr.url) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = networkType.rawValue
 
        request.setValue("Bearer \(AppConstant.apiToken)", forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                           completion(.failure(error))
                           return
                       }
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            if let httpResponse = response as? HTTPURLResponse {
                    print("Response status code: \(httpResponse.statusCode)")
                    
                    switch httpResponse.statusCode {
                    case 200...299:
                        do {
                            let decodedModel = try JSONDecoder().decode(T.self, from: data)
                            completion(.success(decodedModel))
                        } catch {
                            completion(.failure(error))
                        }
                        break


                    default:
                        // Handle other status codes
                        let errorMessage = "Unexpected response code: \(httpResponse.statusCode)"
                        print(errorMessage)
                        completion(.failure(NetworkError.requestFailed))
                        return
                    }
                }
                     

                    

           
        }

        task.resume()
    }
}
