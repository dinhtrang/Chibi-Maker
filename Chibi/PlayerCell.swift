//
//  PlayCell.swift
//  Chibi
//
//  Created by tung on 06/02/2023.
//

import Foundation
import UIKit

class PlayerCell: UICollectionViewCell {
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    // load xib
    func setupUI() {
        //
        
    }


}






