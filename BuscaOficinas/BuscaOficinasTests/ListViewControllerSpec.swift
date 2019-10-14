//
//  ListViewControllerSpec.swift
//  BuscaOficinasTests
//
//  Created by Breno Carvalho Alves Morais on 14/10/2019.
//  Copyright © 2019 Breno Carvalho Alves Morais. All rights reserved.
//

import Quick
import Nimble

@testable import BuscaOficinas

class ListViewControllerSpec: QuickSpec {
    override func spec() {
        var sut: ListViewController?
        
        describe("Layout") {
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
            vc.loadView()
            sut = vc
            
            it("view with default layout in loading") {
                sut?.viewDidLoad()
                expect(sut?.loading?.isHidden).to(beFalse())
                expect(sut?.tableView?.isHidden).to(beTrue())
                expect(sut?.emptyState?.isHidden).to(beTrue())
            }
            
            it("view with default layout in empty") {
                sut?.didChangeUIStatus(status: .empty)
                expect(sut?.loading?.isHidden).to(beTrue())
                expect(sut?.tableView?.isHidden).to(beTrue())
                expect(sut?.emptyState?.isHidden).to(beFalse())
            }
            
            it("view with default layout in showing") {
                sut?.didChangeUIStatus(status: .showing)
                expect(sut?.loading?.isHidden).to(beTrue())
                expect(sut?.tableView?.isHidden).to(beFalse())
                expect(sut?.emptyState?.isHidden).to(beTrue())
            }
        }
    }
}

