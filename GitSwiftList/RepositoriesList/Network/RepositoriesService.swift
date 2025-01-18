//
//  RepositoriesService.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 17/01/25.
//

import Alamofire

final class RepositoriesService {
    private let baseURL = "https://api.github.com/search/repositories"
    
    func fetchRepositories(page: Int, completion: @escaping (Result<[Repository], Error>) -> Void) {
        let parameters: [String: Any] = [
            "q": "language:swift",
            "sort": "stars",
            "order": "desc",
            "page": page,
            "per_page": 20
        ]
        
        AF.request(baseURL, parameters: parameters).validate().responseDecodable(of: RepositoriesResponse.self) { response in
            switch response.result {
            case .success(let repositoriesResponse):
                completion(.success(repositoriesResponse.items))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
