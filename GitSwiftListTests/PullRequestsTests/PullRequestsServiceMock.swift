//
//  PullRequestsServiceMock.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 18/01/25.
//

import XCTest
@testable import GitSwiftList

class PullRequestsServiceMock: PullRequestsService {
    var isErrorFlow = false
    var pullRequestsMock: [PullRequest] = []
    
    override func fetchPullRequests(owner: String, repository: String, page: Int, completion: @escaping (Result<[PullRequest], Error>) -> Void) {
        if isErrorFlow {
            completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
        } else {
            completion(.success(pullRequestsMock))
        }
    }
}
