//
//  APIClient.swift
//  UsersList
//
//  Created by Fernando Ortiz - Parser on 13/05/2021.
//

import Foundation
import Alamofire

enum APIClient {
    static func getUsers(completion: @escaping ([User]) -> Void) {
        let request = AF.request("https://jsonplaceholder.typicode.com/users", method: .get)
        request.responseData { (response: AFDataResponse<Data>) in
            guard let data = response.data else {
                return
            }

            let decoder = JSONDecoder()
            do {
                let users = try decoder.decode([User].self, from: data)

                completion(users)
            } catch {
                print(error)
            }
        }
    }
}
