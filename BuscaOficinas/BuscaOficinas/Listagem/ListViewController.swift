//
//  ViewController.swift
//  BuscaOficinas
//
//  Created by Breno Carvalho Alves Morais on 27/09/2019.
//  Copyright © 2019 Breno Carvalho Alves Morais. All rights reserved.
//

import UIKit

enum ViewMode {
    case loading
    case empty
    case showing
}

protocol ListViewControllerProtocol {
    func didChangeUIStatus(status: ViewMode)
}

class ListViewController: UIViewController {
    var listViewModel: ListViewModel?
    
    @IBOutlet var loading: UIActivityIndicatorView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var emptyState: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Busca de oficinas"
        setupViewMode(viewMode: .loading)
        
        tableView.register(UINib(nibName: "ListCell", bundle: nil), forCellReuseIdentifier: "ListCell")
        tableView.delegate = self
        tableView.dataSource = self
        listViewModel = ListViewModel(delegate: self,
                                      tableView: self.tableView)
        
        listViewModel?.loadOficinas()
    }
    
    func setupViewMode(viewMode: ViewMode) {
        loading.isHidden = true
        tableView.isHidden = true
        emptyState.isHidden = true
        
        switch viewMode {
        case .loading:
            loading.isHidden = false
        case .empty:
            emptyState.isHidden = false
        case .showing:
            tableView.isHidden = false
        }
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let quantity = self.listViewModel?.getData().count {
            return quantity
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as? ListCell,
            let oficina = self.listViewModel?.getData()[indexPath.row] else {
            return UITableViewCell()
        }
        cell.setupCell(oficina: oficina)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let oficina = self.listViewModel?.getData()[indexPath.row] else {
            return
        }
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            vc.oficina = oficina
            self.navigationController?.pushViewController(vc, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
}

extension ListViewController: ListViewControllerProtocol {
    func didChangeUIStatus(status: ViewMode) {
        setupViewMode(viewMode: status)
    }
}


