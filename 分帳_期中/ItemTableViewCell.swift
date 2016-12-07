//
//  ItemTableViewCell.swift
//  分帳_期中
//
//  Created by JACK on 2016/11/27.
//  Copyright © 2016年 JACK. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet var itemLabel: UILabel!
    @IBOutlet var tatolPayLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
