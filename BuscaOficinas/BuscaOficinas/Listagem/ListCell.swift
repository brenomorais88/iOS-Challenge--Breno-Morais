//
//  ListCell.swift
//  BuscaOficinas
//
//  Created by Breno Carvalho Alves Morais on 27/09/2019.
//  Copyright © 2019 Breno Carvalho Alves Morais. All rights reserved.
//

import UIKit
import Nuke

class ListCell: UITableViewCell {
    @IBOutlet private var name: UILabel?
    @IBOutlet private var address: UILabel!
    @IBOutlet private var icon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func setupCell(oficina: Oficina) {
        name?.text = oficina.name
        address?.text = oficina.vicinity
        
        if let url = URL(string: oficina.icon ?? "") {
            Nuke.loadImage(with: url,
                           into: self.icon)
        }
    }
}
