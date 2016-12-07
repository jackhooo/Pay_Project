//
//  ItemDetailTableViewCell.swift
//  分帳_期中
//
//  Created by JACK on 2016/11/28.
//  Copyright © 2016年 JACK. All rights reserved.
//

import UIKit

class ItemDetailTableViewCell: UITableViewCell {
    
    @IBOutlet var memberLabel: UILabel!
    @IBOutlet var memberPayLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
