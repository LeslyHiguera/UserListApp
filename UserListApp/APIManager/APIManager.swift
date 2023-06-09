//
//  APIManager.swift
//  UserListApp
//
//  Created by Lesly Dahian Higuera Martínez on 12/03/23.
//

import Foundation

enum APIManager {
    
    static func request<T: Decodable>(with urlString: String,
                                      completionHandler: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            DispatchQueue.main.async {
            completionHandler(.failure(APIError.badURL))
            }
            return
        }
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                DispatchQueue.main.async {
                    completionHandler(.failure(error))
                }
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                DispatchQueue.main.async {
                    completionHandler(.failure(APIError.badResponse))
                }
                return
            }
            if let data = data {
                do {
                    let users = try JSONDecoder().decode(T.self, from: data)
                    DispatchQueue.main.async {
                        completionHandler(.success(users))
                    }
                } catch {
                    DispatchQueue.main.async {
                        completionHandler(.failure(error))
                    }
                }
            } else {
                DispatchQueue.main.async {
                    completionHandler(.failure(APIError.badResponse))
                }
            }
        })
        task.resume()
    }
    
}
