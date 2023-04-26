//
//  File.swift
//  ChatGPT-App
//
//  Created by Leonardo Cardoso on 13/04/23.
//

import Foundation
import OpenAISwift

final class Service {
    
    public static let shared = Service()
    
    private let openAI = OpenAISwift(authToken: API.authToken)
    
    private let model = OpenAIModelType.gpt3(.davinci)
    
    public func sendMessage(text: String, completion: @escaping (Result<String, OpenAIError>) -> Void) {
        openAI.sendCompletion(with: text, model: model, maxTokens: 4000) { result in
            switch result {
            case .success(let success):
                guard let result = success.choices?.first else { return }
                completion(.success(result.text))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
        
    }
    
}
