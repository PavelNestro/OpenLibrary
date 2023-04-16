//
//  TableViewCell.swift
//  OpenLibrary
//
//  Created by Pavel Nesterenko on 13.04.23.
//
//chevron.right

import UIKit

class TableViewCell: UITableViewCell {
    

    @IBOutlet weak var viewConteiner: UIView!
    @IBOutlet weak var publishDateLabel: UILabel!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var imageViewCell: UIImageView!
    
    static let identifier = "BooksTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
    }

    
}
