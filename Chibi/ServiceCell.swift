//
//  ServiceCell.swift
//  CS-Living
//
//  Created by ThanhTung on 7/15/20.
//

import UIKit

class ServiceCell: UICollectionViewCell {
    @IBOutlet weak var lblName: UILabel!
    let nameLabel: UILabel = {
        let label = UILabel(frame: CGRect.init(x: 0, y: 0, width: 100, height: 30))
        
//            label.font = UIFont.systemFontOfSize(14)
//            label.textColor = UIColor.darkGrayColor()
            label.text = "Bob Lee"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(frame: CGRect) {
           super.init(frame: frame)

          addSubview(nameLabel)
       }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
}
