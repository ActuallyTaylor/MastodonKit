//
//  Client.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 4/22/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

public struct Client: ClientType {
    let baseURL: String
    let session: URLSession
    public var accessToken: String?

    public init(baseURL: String, accessToken: String? = nil, session: URLSession = .shared) {
        self.baseURL = baseURL
        self.session = session
        self.accessToken = accessToken
    }

    @available(iOS 13.0, *)
    public func createWebSocketRequest<Model>(_ request: Request<Model>, streamingURL: String) throws -> URLRequest {
        guard
            let components = URLComponents(baseURL: streamingURL, request: request),
            let url = components.url
        else {
            throw ClientError.malformedURL
        }

        let urlRequest = URLRequest(url: url, request: request, accessToken: accessToken)
        return urlRequest
    }
    
    public func healthCheck(completion: @escaping (Bool) -> Void) {
        let request = Streaming.checkHealth()
        guard
            let components = URLComponents(baseURL: baseURL, request: request),
            let url = components.url
        else {
            completion(false)
            return
        }

        let urlRequest = URLRequest(url: url, request: request, accessToken: accessToken)
        let task = session.dataTask(with: urlRequest) { data, response, error in
            guard error != nil else {
                completion(false)
                return
            }
            
            guard data != nil else {
                completion(false)
                return
            }

            guard
                let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200
            else {
                completion(false)
                return
            }

            completion(true)

        }

        task.resume()
    }
    
#if compiler(>=5.6.0) && canImport(_Concurrency)
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func healthCheck() async throws -> Bool {
        try await withCheckedThrowingContinuation { continuation in
            healthCheck() { result in
                continuation.resume(returning: result)
            }
        }
    }
#endif

    public func run<Model>(_ request: Request<Model>,
                           completion: @escaping (Result<Response<Model>, Error>) -> Void) {
        guard
            let components = URLComponents(baseURL: baseURL, request: request),
            let url = components.url
        else {
            completion(.failure(ClientError.malformedURL))
            return
        }

        let urlRequest = URLRequest(url: url, request: request, accessToken: accessToken)
        let task = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(ClientError.malformedJSON))
                return
            }

            guard
                let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200
            else {
                let mastodonError = try? MastodonError.decode(data: data)
                let error: ClientError = mastodonError.map { .mastodonError($0.description) } ?? .genericError
                completion(.failure(error))
                return
            }

            do {
                let model = try Model.decode(data: data)
                completion(.success(.init(value: model, pagination: httpResponse.pagination)))
            } catch {
                completion(.failure(ClientError.invalidModel(error: error)))
                return
            }
        }

        task.resume()
    }

#if compiler(>=5.6.0) && canImport(_Concurrency)
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func run<Model>(_ request: Request<Model>) async throws -> Response<Model> {
        try await withCheckedThrowingContinuation { continuation in
            run(request) { result in
                continuation.resume(with: result)
            }
        }
    }
#endif
}
