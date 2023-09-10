//
//  NetworkService.swift
//  TestFrameWorks
//
//  Created by Abdullah Omar on 28/08/2023.
//



import Foundation

protocol NetworkServiceProtocol {
    func performGETRequest<T: Decodable>(url: URL, responseType: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void)
     func performPOSTRequest<T: Decodable>(url: URL, body: Data, responseType: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void)
}

public class NetworkService: NetworkServiceProtocol {
      func performGETRequest<T: Decodable>(url: URL, responseType: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.requestFailed))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            if let apiError = self.extractAPIError(from: data) {
                completion(.failure(.serverError(apiError)))
            } else if let decodedResponse = self.decodeJSON(data: data, type: responseType) {
                completion(.success(decodedResponse))
            } else {
                completion(.failure(.serializationFailed))
            }
        }.resume()
    }
    
      func performPOSTRequest<T: Decodable>(url: URL, body: Data, responseType: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                completion(.failure(.requestFailed))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            if let apiError = self.extractAPIError(from: data) {
                completion(.failure(.serverError(apiError)))
            } else if let decodedResponse = self.decodeJSON(data: data, type: responseType) {
                completion(.success(decodedResponse))
            } else {
                completion(.failure(.serializationFailed))
            }
        }.resume()
    }
    
    private func extractAPIError(from data: Data) -> String? {
        // Assuming the server returns error details in JSON format
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            return json?["error"] as? String
        } catch {
            // JSON serialization failed
            return nil
        }
    }
    
    private func decodeJSON<T: Decodable>(data: Data, type: T.Type) -> T? {
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(type, from: data)
        } catch {
            print("Decoding error:", error)
            return nil
        }
    }

}
