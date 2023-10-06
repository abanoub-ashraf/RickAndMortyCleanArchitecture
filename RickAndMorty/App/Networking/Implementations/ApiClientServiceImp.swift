//
//  ApiClientServiceImp.swift
//  RickAndMorty
//
//  Created by Abanoub Ashraf on 03/10/2023.
//

import Foundation

struct ApiClientServiceImp: ApiClientService {
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func request<T: Decodable>(url: URL?, type: T.Type) async throws -> T {
        guard let url = url else {
            throw ApiError.errorInUrl
        }
        
        return try await self.makeRequest(url: url)
    }
    
    private func makeRequest<T: Decodable>(url: URL) async throws -> T {
        let request = try await self.session.data(from: url)
        return try self.validateResponse(request: request)
    }
    
    private func validateResponse<T: Decodable>(request: (data: Data, httpResponse: URLResponse)) throws -> T {
        guard let httpResponse = request.httpResponse as? HTTPURLResponse else {
            throw ApiError.unknownError
        }
        
        switch httpResponse.statusCode {
            case HttpResponseStatus.ok:
                return try self.decodeModel(data: request.data)
                
            case HttpResponseStatus.clientError:
                throw ApiError.clientError
                
            case HttpResponseStatus.serverError:
                throw ApiError.serverError
                
            default:
                throw ApiError.unknownError
        }
    }
    
    private func decodeModel<T: Decodable>(data: Data) throws -> T {
        let decoder = JSONDecoder()
        let model = try? decoder.decode(T.self, from: data)
        
        guard let model = model else {
            throw ApiError.errorDecoding
        }
        
        return model
    }
}
