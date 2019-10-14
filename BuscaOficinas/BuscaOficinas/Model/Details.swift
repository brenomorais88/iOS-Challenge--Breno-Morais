//
//  Details.swift
//  BuscaOficinas
//
//  Created by Breno Carvalho Alves Morais on 14/10/2019.
//  Copyright © 2019 Breno Carvalho Alves Morais. All rights reserved.
//

import Foundation
import ObjectMapper

class Details: Mappable {
    var icon: String?
    var id: String?
    var name: String?
    var rating: String?
    var website: String?
    var vicinity: String?
    var phone: String?
    
    func mapping(map: Map) {
        icon <- map["icon"]
        id <- map["id"]
        name <- map["name"]
        rating <- map["rating"]
        website <- map["website"]
        vicinity <- map["vicinity"]
        phone <- map["international_phone_number"]
    }
    
    required init?(map: Map){
        
    }
    
    init() {
        
    }
}
