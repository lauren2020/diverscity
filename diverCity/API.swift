//
//  API.swift
//  diverCity
//
//  Created by Lauren Shultz on 10/12/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import Foundation

class API {
    var users = [User?]()
    //var user1 = User(firstName: "Lauren", lastName: "Shultz")
    var communities = [Community?]()
    var myCommunities = [Community?]()

    init () {
        //user1.userName = "Lauren"
        //user1.password = "password"
        //users = [user1]
    }

    func getUserAccountInformation(username: String, password: String) {
//        for user in users {
//            if(user?.userName == username && user?.password == password) {
//                return user!
//            }
//        }
        //var user: User?
        //5.2 5.3
        //startActivity()
//        DispatchQueue.global().async
//            {
//                User.accountInfo(withUsername: "lshultz") {
//                    (results:[User]) in
//                    print("Results: ", results)
//                    for result in results {
//                        print("result: ", result)
//                    }
//                }
//                DispatchQueue.main.async {
//                    //self.stopActivity()
//                    return user!
//                }
//        }
//        DispatchQueue.global().async {
//            User.accountInfo(withUsername: "lshultz") {
//                (results:[User]) in
//                print("Results: ", results)
//                for result in results {
//                    print("result: ", result)
//                }
//            }
//            DispatchQueue.main.async {
//                <#code#>
//            }
//        }
//        User.accountInfo(withId: "1") {
//            (results:[User]) in
//            print("Results: ", results)
//            for result in results {
//                UserSession.user = result
//                print("result: ", result)
//            }
//        }
            //return user!
    }

    func getUsers() {
        //https://divircity-api.herokuapp.com/api/v1/users?username=testuser&password=password
//        let params = ["username":"john", "password":"123456"] as Dictionary<String, String>
        //let params = []
        print("getUsers()")

//        var request = URLRequest(url: URL(string: "https://divircity-api.herokuapp.com/api/v1/users")!)
//        request.httpMethod = "GET"//"POST"
//       // request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        print(request)
//        let session = URLSession.shared
//        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
//            print(response!)
//            do {
////                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
//                var users: [User] = []
//                guard let json = try JSONSerialization.jsonObject(with: data!) else { return }
//                print(json)
//                for case let result in json["user"] {
//                    if let user = User(json: result) {
//                        users.append(user)
//                    }
//                }
//            } catch {
//                print("error")
//            }
//        })
//        print("DONE")
//        task.resume()
    }

    func createNewUser(username: String, password: String, firstName: String, lastName: String, email: String) {
//        let newUser = User(firstName: firstName, lastName: lastName)
//        newUser.userName = username
//        newUser.password = password
//        newUser.email = email
//        users.append(newUser)
    }

    func getMyCommunities(user: User) -> [Community?] {
        let myFoundCommunities = myCommunities
        return myFoundCommunities
    }
}
