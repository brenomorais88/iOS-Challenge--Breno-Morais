//
//  OficinaService.swift
//  BuscaOficinas
//
//  Created by Breno Carvalho Alves Morais on 27/09/2019.
//  Copyright © 2019 Breno Carvalho Alves Morais. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import Foundation

class OficinaService {
    private static let baseURL: String = "https://maps.googleapis.com/maps/api/place/nearbysearch/json"
    private static let apiKey: String = "AIzaSyBWnCuxLTO8ySwtSir8_7rf_jb1V9wrGrg"
    private static let radius: String = "1000"
    private static let types: String = "car_repair"
    
    func getNearMe(completionHandler: @escaping (DataResponse<ListResponse>) -> Void) {
        let requestUrl: String = "\(OficinaService.baseURL)" +
            "?location=-23.6085926,-46.6019705&" +
            "radius=\(OficinaService.radius)&" +
            "types=\(OficinaService.types)&" +
            "key=\(OficinaService.apiKey)"
        
        guard let url = URL(string: requestUrl) else { return }
        Alamofire.request(url).responseObject { (response: DataResponse<ListResponse>) in
            completionHandler(response)
        }
    }
    
    func getDetails(completionHandler: @escaping (DataResponse<Details>) -> Void) {
        let requestUrl: String = "\(OficinaService.baseURL)" +
            "?location=-23.6085926,-46.6019705&" +
            "radius=\(OficinaService.radius)&" +
            "types=\(OficinaService.types)&" +
        "key=\(OficinaService.apiKey)"
        
        guard let url = URL(string: requestUrl) else { return }
        Alamofire.request(url).responseObject { (response: DataResponse<Details>) in
            completionHandler(response)
        }
    }
    
    func mockListResult() -> ListResponse {
        let response: ListResponse = ListResponse()
        
        var listItens: [Oficina] = []
        
        let listItem1 = Oficina()
        listItem1.icon = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStiKiMyoiXWsDhbVlvcQ1uCmaLUTamfPUlKzoWUJmOrcjbhQb_"
        listItem1.id = "1"
        listItem1.name = "teste1"
        listItem1.place_id = "teste1"
        listItem1.vicinity = "teste1 endereço"
        listItens.append(listItem1)
        
        let listItem2 = Oficina()
        listItem2.icon = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStiKiMyoiXWsDhbVlvcQ1uCmaLUTamfPUlKzoWUJmOrcjbhQb_"
        listItem2.id = "2"
        listItem2.name = "teste2"
        listItem2.place_id = "teste2"
        listItem2.vicinity = "teste2 endereço"
        listItens.append(listItem2)
        
        let listItem3 = Oficina()
        listItem3.icon = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStiKiMyoiXWsDhbVlvcQ1uCmaLUTamfPUlKzoWUJmOrcjbhQb_"
        listItem3.id = "3"
        listItem3.name = "teste3"
        listItem3.place_id = "teste3"
        listItem3.vicinity = "teste3 endereço"
        listItens.append(listItem3)
        
        response.results = listItens
        
        return response
    }
}



