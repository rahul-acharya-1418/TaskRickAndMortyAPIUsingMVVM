//
//  CharacterLIstViewViewModel.swift
//  TaskRickAndMortyAPIUsingMVVM
//
//  Created by Rahul Acharya on 2023-01-20.
//

import Foundation


final class CharacterListViewViewModel {
    
    var rmCharacter: RMCharacter?
    var modelClosure: ((_ event: Event) -> Void)?
    var passData: String?
    var singleCharacter: RMResults?
    
    
    public func fetchAllCharacter() {
        RMService.shared.execute(rmCharacter?.info.next ?? baseUrl(endpoint: .character), method: .get, expecting: RMCharacter.self) { [weak self] result  in
            switch result {
            case .success(let model):
                if self?.rmCharacter?.results == nil {
                    self?.rmCharacter = model
                } else {
                    self?.rmCharacter?.results.append(contentsOf: model.results)
                    self?.rmCharacter?.info = model.info
                }
                self?.modelClosure?(.valid)
            case .failure(let error):
                self?.modelClosure?(.error(error))
            }
        }
    }
    
    
    private func baseUrl(endpoint: RMEndpoint) -> String {
        return endpoint.rawValue
    }
    
    
    public func getSingleCharacter() {
        guard let passData = passData else { return }
        RMService.shared.execute(passData, method: .get, expecting: RMResults.self) { [weak self] result in
            switch result {
            case .success(let model):
                self?.singleCharacter = model
                self?.modelClosure?(.dataPass)
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    
}
