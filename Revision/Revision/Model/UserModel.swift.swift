//
//  UserModel.swift.swift
//  Revision
//
//  Created by Santiago Castañeda Restrepo- Ceiba Software on 13/12/21.
//

import Foundation

let urlUsers = "https://jsonplaceholder.typicode.com/users"

struct UserModel {
    let profilePic : String
    let userName : String
    let description : String
    
    static func getList() -> [UserModel]{
        let list = [
            UserModel(profilePic: "isaac-hunt", userName: "Isaac Hunt", description: "iOS Developer at Google"),
            UserModel(profilePic: "hyon-suk", userName: "Hu Hyon-Suk", description: "Project Manager at Faebook"),
            UserModel(profilePic: "wen-yahui", userName: "Wen Yahui", description: "iOS Developer at Amazon"),
            UserModel(profilePic: "john-doe", userName: "John Doe", description: "Android Developer at Amazon"),
            UserModel(profilePic: "mike-swift", userName: "Mike Swift", description: "Reac Native Developer at Instagram"),
        ]
        return (list+list+list+list+list)
    }
}

struct User: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: addres
    let phone: String
//    let website: String
//    let company: companyObject
}

struct addres: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: geoLocation
}

struct geoLocation: Codable {
    let lat: String
    let lng: String
}

struct companyObject: Codable {
    let name: String
    let catchPhrase: String
    let bs: String
}
