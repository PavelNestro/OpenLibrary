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
    
    @IBOutlet weak var imageHeart: UIImageView!
    static let identifier = "BooksTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    var imageDidTapHandler: (() -> ())?

    var image: UIImage? = UIImage(systemName: "heart") {
        didSet {
            self.imageHeart.image = image
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
    }

    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer()
        tapGesture.numberOfTapsRequired = 1
        tapGesture.addTarget(self, action: #selector(handleTap(_:)))
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc private func handleTap(_ sender: UITapGestureRecognizer)  {
        imageDidTapHandler?()
    }
    
}
