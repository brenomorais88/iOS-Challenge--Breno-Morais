//
//  DetailViewModel.swift
//  BuscaOficinas
//
//  Created by Breno Carvalho Alves Morais on 27/09/2019.
//  Copyright © 2019 Breno Carvalho Alves Morais. All rights reserved.
//

import Foundation

class DetailViewModel {
    let view: DetailViewController
    let delegate: DetailViewControllerProtocol
    
    init(view: DetailViewController,
         delegate: DetailViewControllerProtocol) {
        self.view = view
        self.delegate = delegate
    }
    
    func loadDetails() {
        OficinaService().getDetails { (response) in
            guard let details = response.result.value  else {
                return
            }
            
//            let mockedDetails = Details()
//            mockedDetails.icon = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStiKiMyoiXWsDhbVlvcQ1uCmaLUTamfPUlKzoWUJmOrcjbhQb_"
//            mockedDetails.id = "10"
//            mockedDetails.name = "breno"
//            mockedDetails.rating = "4.5"
//            mockedDetails.website = "www.google.com"
//            mockedDetails.vicinity = "via anchieta"
//            mockedDetails.phone = "11-29039293"
            
            self.delegate.didLoadDetails(details: details)
        }
    }
}
