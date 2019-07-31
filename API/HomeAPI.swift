//
//  HomeAPI.swift
//  Roomy
//
//  Created by Awady on 7/31/19.
//  Copyright © 2019 Awady. All rights reserved.
//

/*
 "id": 1,
 "title": "First Room",
 "price": "200$",
 "place": "Tahrir",
 "image": "www.google.com",
 "description": "Anything goes here",
 "created_at": "2009-04-30T09:44:35.000Z",
 "updated_at": "2009-04-30T09:44:35.000Z"
*/
import Foundation
import Alamofire
import SwiftyJSON

extension API {
    class func Homes(completion: @escaping (_ error: Error?, _ Rooms: [RoomContent]?)-> Void) {
        
        let url = URLs.Home
        guard let auth_token = helper.getAuthToken() else {
            completion(nil, nil)
            return
        }
        let parameter = [
            "auth_token": auth_token
        ]
        
        Alamofire.request(url, method: .get, parameters: parameter, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    guard let dataArray = json["data"].array else {
                        completion(nil, nil)
                        return
                    }
                    var rooms = [RoomContent]()
                    for data in dataArray {
                        guard let data = data.dictionary else { return }
                        
                        let room = RoomContent()
                        room.id = data["id"]?.int ?? 1
                        room.price = data["price"]?.int ?? 222
                        room.place = data["place"]?.string ?? "aaa"
                        room.title = data["title"]?.string ?? "aaa"
                        room.descriptions = data["description"]?.string ?? "11"
                        room.image = data["image"]?.string ?? "11"
                        
                        rooms.append(room)
                    }
                    completion(nil, rooms)
                    
                case .failure(let error):
                    completion(error, nil)
                    print(error)
                }
                
                
        }
    }
}
