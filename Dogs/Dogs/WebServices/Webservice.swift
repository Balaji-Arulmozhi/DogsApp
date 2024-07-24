//
//  Webservice.swift
//  Dogs
//
//  Created by Kumararaja Krishnan on 7/23/24.
//

import Foundation
import Combine

struct Webservice{
    
        static let shared = Webservice()
        private var cancellables = Set<AnyCancellable>()
        private let baseURL = "https://dog.ceo/api"
        func getMethod<T:Decodable>(path: String, isMock: Bool, type: T.Type , failureScenerio: Bool ,
                                    mockPath: String) -> AnyPublisher<T, NetworkError>{
            var urlData: URL?
            
            if failureScenerio {
                return Fail(error: NetworkError.unAuthuroziedError)
                    .eraseToAnyPublisher()
            }
            if isMock{
                guard let url = Bundle.main.url(forResource: mockPath, withExtension: "json")
                else{
                    return Fail(error: NetworkError.invalidURL)
                        .eraseToAnyPublisher()
                }
                urlData = url
                
                do {
                    let data = try Data(contentsOf: url)
                    return Just(data)
                        .decode(type: T.self, decoder: JSONDecoder())
                        .mapError { error in
                            NetworkError.decodingFailed(error)
                        }
                        .eraseToAnyPublisher()
                } catch {
                    return Fail(error: NetworkError.invalidURL)
                        .eraseToAnyPublisher()
                }
                
            }else{
                guard let url = URL(string: baseURL+path)
                else{
                    return Fail(error: NetworkError.invalidURL)
                        .eraseToAnyPublisher()
                }
                urlData = url
            }
            return URLSession.shared.dataTaskPublisher(for: urlData!)
            //            .receive(on: RunLoop.main)
                .tryMap { data, response in
                    print(data)
                    guard let httpResponse = response as? HTTPURLResponse ,
                          httpResponse.statusCode == 200
                    else{
                        throw NetworkError.invalidResponse
                    }
                    
                    return data
                }
                .decode(type: T.self, decoder:JSONDecoder())
                .mapError { error in
                    NetworkError.decodingFailed(error)
                }
                .eraseToAnyPublisher()
        }
        
    }

