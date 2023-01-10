//
//  NetworkManager.swift
//  Weather App
//
//  Created by Dalveer singh on 05/01/23.
//

import Foundation
import SwiftUI
import Combine

class NetworkManager{
    
    enum NetworkManagerError:LocalizedError{
        case badURLResponse(url:URL)
        case unknown
        
        var errorDescription: String?{
            switch self{
                
            case .badURLResponse(url: let url):
                return "[🔥] Bad response from URL: \(url)"
            case .unknown:
                return "[⚠️] Unknown Error occured"
            }
        }
        
    }
    
    static func donwload(url:URL)->AnyPublisher<Data,Error>
    {
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({try handleURLRepsonse(output: $0, url: url)})
            .retry(3)
            .eraseToAnyPublisher()
    }
    static func handleURLRepsonse(output:URLSession.DataTaskPublisher.Output,url:URL) throws ->Data{
        guard let respone = output.response as? HTTPURLResponse,respone.statusCode >= 200 && respone.statusCode <= 300 else
        {
            throw NetworkManagerError.badURLResponse(url: url)
        }
        return output.data
    }
    static func handleCompletion(completion: Subscribers.Completion<Error>)
    {
        switch(completion)
        {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
