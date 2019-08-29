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
    
    class func getRooms(completion: @escaping (_ error: Error?, _ Rooms: [RoomContent]?)-> Void) {
        
        let roomEndPoint = URLs.Home
        guard let auth_token = helper.getAuthToken() else {
            completion(nil, nil)
            return
        }

        let headers: HTTPHeaders = ["Authorization": auth_token]
        
        Alamofire.request(roomEndPoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).validate(statusCode: 200..<500)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    guard let jsonData = json.array else {
                        completion(nil, nil)
                        return
                    }
                    var rooms = [RoomContent]()
                    for data in jsonData {
                        guard let data = data.dictionary else { return }
                        let room = RoomContent()
                        let offlineRoom = OfflineRooms()
                        room.id = data["id"]?.int ?? 0
                        room.price = data["price"]?.string ?? "0 $"
                        room.city = data["place"]?.string ?? "place"
                        room.address = data["title"]?.string ?? "address"
                        room.roomImageLink = data["image"]?.string ?? "image link"
                        room.roomDescription = data["description"]?.string ?? ""
                        
                        rooms.append(room)
                        offlineRoom.addOfflineRooms(room: room)
                    }
                    completion(nil, rooms)
                    
                case .failure(let error):
                    completion(error, nil)
                    print(error)
                }
        }
    }
    
    class func getRoomFromRealm(completion: @escaping (_ error: Error?, _ rooms: [RoomContent]?) -> Void) {
        guard ((helper.getAuthToken()) != nil) else {
            completion(nil, nil)
            return
        }
        
        var rooms = [RoomContent]()
        let offlineRooms = OfflineRooms()
        let realmRooms = offlineRooms.readRoomsRealm()
        
        for data in realmRooms {
            let room = RoomContent()
            
            room.id = data.id
            room.address = data.address
            room.city = data.place
            room.price = data.price
            room.bed = data.bed
            room.bath = data.bath
            room.roomDescription = data.roomDescription
            room.roomImageLink = data.roomImageLink
            
            rooms.append(room)
        }
        completion(nil, rooms)
    }
}
