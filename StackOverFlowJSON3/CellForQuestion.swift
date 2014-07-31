//
//  CellForQuestion.swift
//  StackOverFlowJSON3
//
//  Created by Victor  Adu on 7/30/14.
//  Copyright (c) 2014 Victor  Adu. All rights reserved.
//

import UIKit

class CellForQuestion: UITableViewCell {

    @IBOutlet weak var textView: UITextView!
    
    init(style: UITableViewCellStyle, reuseIdentifier: String) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Initialization code
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
