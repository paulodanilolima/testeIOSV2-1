//
//  BankCellTableViewCell.swift
//  TesteiOSV2
//
//  Created by Paulo Danilo Conceição Lima on 11/05/22.
//

import UIKit

class BankCellTableViewCell: UITableViewCell {
    
    @IBOutlet private var lblNome: UILabel!
    @IBOutlet private var lblValue: UILabel!
    @IBOutlet private var swContentView: UIView!
    @IBOutlet private var swContent: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        swContentView.layer.cornerRadius = 8
        swContentView.layer.shadowColor = UIColor.lightGray.cgColor
        swContentView.layer.shadowOpacity = 0.2
        swContentView.layer.shadowOffset = .zero
        swContentView.layer.shadowRadius = 5
        
        swContent.frame = swContent.frame.inset(by: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func loadUI(debitName: String, debitValue: String){
        
        lblValue.text = debitValue
        lblNome.text = debitName
    }
}
