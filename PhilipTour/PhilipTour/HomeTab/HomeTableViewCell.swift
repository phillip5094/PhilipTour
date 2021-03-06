//
//  HomeTableViewCell.swift
//  PhilipTour
//
//  Created by NHN on 2021/02/04.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var placeImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupView() {
        self.placeImageView.clipsToBounds = true
        self.placeImageView.contentMode = .scaleAspectFill
        self.placeImageView.layer.cornerRadius = 20
    }
}
