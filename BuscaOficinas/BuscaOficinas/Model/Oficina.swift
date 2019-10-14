//
//  Oficina.swift
//  BuscaOficinas
//
//  Created by Breno Carvalho Alves Morais on 27/09/2019.
//  Copyright © 2019 Breno Carvalho Alves Morais. All rights reserved.
//

import Foundation
import ObjectMapper

class Oficina: Mappable {
    var icon: String?
    var id: String?
    var name: String?
    var place_id: String?
    var vicinity: String?
    
    func mapping(map: Map) {
        icon <- map["icon"]
        id <- map["id"]
        name <- map["name"]
        place_id <- map["place_id"]
        vicinity <- map["vicinity"]
    }
    
    required init?(map: Map){
        
    }
    
    init() {
        
    }
}
