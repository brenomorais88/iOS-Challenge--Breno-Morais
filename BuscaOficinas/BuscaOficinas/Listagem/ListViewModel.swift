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
    private let delegate: ListViewControllerProtocol
    private let tableView: UITableView
    private var responseList: [Oficina] = []
    
    init(delegate: ListViewControllerProtocol,
         tableView: UITableView) {
        self.tableView = tableView
        self.delegate = delegate
    }
    
    func loadOficinas() {
        self.responseList = OficinaService().mockListResult().results ?? []
        self.delegate.didChangeUIStatus(status: .showing)
        self.tableView.reloadData()
        
//        OficinaService().getNearMe { (response) in
//            guard let data = response.result.value?.results  else {
//                self.delegate.didChangeUIStatus(status: .empty)
//                return
//            }
//
//            if data.count > 0 {
//                self.responseList = data
//                self.delegate.didChangeUIStatus(status: .showing)
//                self.tableView.reloadData()
//
//            } else {
//                self.delegate.didChangeUIStatus(status: .empty)
//            }
//        }
    }
    
    public func getData() -> [Oficina] {
        return self.responseList
    }
}
