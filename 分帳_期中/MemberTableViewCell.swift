//
//  MemberTableViewCell.swift
//  分帳_期中
//
//  Created by JACK on 2016/11/26.
//  Copyright © 2016年 JACK. All rights reserved.
//

import UIKit

class MemberTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var shouldPayLabel: UILabel!
    @IBOutlet var shouldGetLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
