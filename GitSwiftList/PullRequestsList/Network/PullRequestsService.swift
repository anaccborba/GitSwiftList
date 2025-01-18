//
//  PullRequestsService.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 17/01/25.
//

import Alamofire

class PullRequestsService {
    private let baseURL = "https://api.github.com/repos"
    
    func fetchPullRequests(owner: String, repository: String, page: Int, completion: @escaping (Result<[PullRequest], Error>) -> Void) {
        let url = "\(baseURL)/\(owner)/\(repository)/pulls"
        let parameters: [String: Any] = [
            "page": page,
            "per_page": 10
        ]
        
        AF.request(url, parameters: parameters).validate().responseDecodable(of: [PullRequest].self) { response in
            switch response.result {
            case .success(let pullRequests):
                completion(.success(pullRequests))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
