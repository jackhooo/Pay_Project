//
//  MemberTableViewCell.swift
//  分帳
//
//  Created by JACK on 2016/12/27.
//  Copyright © 2016年 JACK. All rights reserved.
//

import UIKit

class MemberTableViewCell: UITableViewCell {

    @IBOutlet weak var memberTotal: UILabel!
    @IBOutlet weak var memberPayed: UILabel!
    @IBOutlet weak var memberNameLabel: UILabel!
    @IBOutlet weak var memberShouldPay: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
