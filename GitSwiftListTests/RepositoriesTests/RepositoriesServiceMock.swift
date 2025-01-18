//
//  RepositoriesServiceMock.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 18/01/25.
//

import XCTest
@testable import GitSwiftList

class RepositoriesServiceMock: RepositoriesService {
    var repositoriesMock: [Repository] = []
    var isErrorFlow = false
    
    override func fetchRepositories(page: Int, completion: @escaping (Result<[Repository], Error>) -> Void) {
        if isErrorFlow {
            completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
        } else {
            completion(.success(repositoriesMock))
        }
    }
}
