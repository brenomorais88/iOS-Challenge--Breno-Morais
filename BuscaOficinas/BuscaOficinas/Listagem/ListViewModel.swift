//
//  ListViewModel.swift
//  BuscaOficinas
//
//  Created by Breno Carvalho Alves Morais on 27/09/2019.
//  Copyright © 2019 Breno Carvalho Alves Morais. All rights reserved.
//

import Foundation
import UIKit

class ListViewModel {
    let delegate: ListViewControllerProtocol
    var responseList: [Oficina] = []
    
    init(delegate: ListViewControllerProtocol) {
        self.delegate = delegate
    }
    
    func loadOficinas() {
//        self.responseList = OficinaService().mockListResult().results ?? []
//        self.delegate.didChangeUIStatus(status: .showing)
//        self.tableView.reloadData()
        
        OficinaService().getNearMe { (response) in
            guard let data = response.result.value?.results  else {
                self.delegate.didChangeUIStatus(status: .empty)
                return
            }

            if data.count > 0 {
                self.responseList = data
                self.delegate.didChangeUIStatus(status: .showing)

            } else {
                self.delegate.didChangeUIStatus(status: .empty)
            }
        }
    }
    
    public func getData() -> [Oficina] {
        return self.responseList
    }
}
