//
//  DetailViewControllerSpec.swift
//  BuscaOficinasTests
//
//  Created by Breno Carvalho Alves Morais on 14/10/2019.
//  Copyright © 2019 Breno Carvalho Alves Morais. All rights reserved.
//

import Quick
import Nimble

@testable import BuscaOficinas

class DetailViewControllerSpec: QuickSpec {
    override func spec() {
        var sut: DetailViewController?
        
        describe("Layout") {
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            vc.loadView()
            sut = vc
            
            it("view with default layout in loading") {
                sut?.viewDidLoad()
                
                expect(sut?.loadingView?.isHidden).to(beFalse())
                expect(sut?.detailView?.isHidden).to(beTrue())
            }
            
            it("view with default layout in showing") {
                let details = Details()
                details.name = "teste"
                
                sut?.didLoadDetails(details: details)
                expect(sut?.loadingView?.isHidden).to(beTrue())
                expect(sut?.detailView?.isHidden).to(beFalse())
            }
        }
    }
}
