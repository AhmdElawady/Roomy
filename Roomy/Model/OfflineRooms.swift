//
//  offlineRooms.swift
//  Roomy
//
//  Created by Awady on 8/27/19.
//  Copyright © 2019 Awady. All rights reserved.
//

import Foundation
import RealmSwift

class OfflineRooms: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var address: String = ""
    @objc dynamic var place: String = ""
    @objc dynamic var price: String = ""
    @objc dynamic var bed: Int = 0
    @objc dynamic var bath: Int = 0
    @objc dynamic var roomImageLink: String = ""
    @objc dynamic var roomDescription: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func addOfflineRooms (room: RoomContent) {
        
        let realm = try! Realm()
        
        try! realm.write {
            let roomsRealm = OfflineRooms()
            
            roomsRealm.id = room.id
            roomsRealm.address = room.address
            roomsRealm.price = room.price
            roomsRealm.place = room.city
            roomsRealm.bed = room.bed
            roomsRealm.bath = room.bath
            roomsRealm.roomImageLink = room.roomImageLink
            roomsRealm.roomDescription = room.roomDescription
            
            realm.add(roomsRealm, update: .modified)
        }
    }
    
    func readRoomsRealm() -> Results <OfflineRooms> {
        let realm = try! Realm()
        let rooms = realm.objects(OfflineRooms.self)
        
        return rooms
    }
}
