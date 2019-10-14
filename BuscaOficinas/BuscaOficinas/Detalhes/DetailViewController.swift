//
//  DetailViewController.swift
//  BuscaOficinas
//
//  Created by Breno Carvalho Alves Morais on 27/09/2019.
//  Copyright © 2019 Breno Carvalho Alves Morais. All rights reserved.
//

import UIKit
import Nuke

protocol DetailViewControllerProtocol {
    func didLoadDetails(details: Details)
}
class DetailViewController: UIViewController {
    @IBOutlet private var detailView: UIView!
    @IBOutlet private var loadingView: UIActivityIndicatorView!
    @IBOutlet private var nameValue: UILabel!
    @IBOutlet private var phoneValue: UILabel!
    @IBOutlet private var addressValue: UILabel!
    @IBOutlet private var rattingValue: UILabel!
    @IBOutlet private var iconView: UIImageView!
    
    var detailViewModel: DetailViewModel?
    var oficina: Oficina?
    private var webSite: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detalhe da oficina"
        detailViewModel = DetailViewModel(view: self,
                                          delegate: self)
        detailViewModel?.loadDetails()
        setupViewMode(viewMode: .loading)
    }
    
    func setupViewMode(viewMode: ViewMode) {
        self.detailView.isHidden = true
        self.loadingView.isHidden = true
        
        switch viewMode {
        case .loading:
            self.loadingView.isHidden = false
        case .showing:
            self.detailView.isHidden = false
        default:
            break
        }
    }
    
    @IBAction func openWebSite(_ sender: Any) {
        guard let url = URL(string: webSite ?? "") else { return }
        UIApplication.shared.open(url,
                                  options: [:],
                                  completionHandler: nil)
    }
}

extension DetailViewController: DetailViewControllerProtocol {
    func didLoadDetails(details: Details) {
        self.nameValue.text = details.name
        self.phoneValue.text = details.phone
        self.addressValue.text = details.vicinity
        self.rattingValue.text = details.rating
        self.webSite = details.website
        
        if let url = URL(string: details.icon ?? "") {
            Nuke.loadImage(with: url,
                           into: self.iconView)
        }
        setupViewMode(viewMode: .showing)
    }
}
