//
//  ListResponse.swift
//  BuscaOficinas
//
//  Created by Breno Carvalho Alves Morais on 14/10/2019.
//  Copyright © 2019 Breno Carvalho Alves Morais. All rights reserved.
//

import Foundation
import ObjectMapper

class ListResponse: Mappable {
    var results: [Oficina]?
    
    func mapping(map: Map) {
        results <- map["results"]
    }
    
    required init?(map: Map){
        
    }
    
    init() {
        
    }
}
