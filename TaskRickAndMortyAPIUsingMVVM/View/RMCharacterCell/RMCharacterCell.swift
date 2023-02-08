//
//  RMCharacterCell.swift
//  TaskRickAndMortyAPIUsingMVVM
//
//  Created by Rahul Acharya on 2023-01-20.
//

import UIKit
import Kingfisher

class RMCharacterCell: UITableViewCell {
    
    static let cellID: String = "RMCharacterCell"
    @IBOutlet weak var cellBackGroundView: UIView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    var cellObject: RMResults? {
        didSet {
            getDetials()
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellBackGroundView.backgroundColor = .tertiarySystemBackground
        cellBackGroundView.layer.cornerRadius = 8
        userImageView.layer.cornerRadius = 10
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func getDetials() {
        userImageView.kf.setImage(with: URL(string: cellObject?.image ?? ""))
        idLabel.text = "ID: \(cellObject?.id ?? 0)"	
        nameLabel.text = cellObject?.name
        statusButton.tintColor = RMStatus(rawValue: (cellObject?.status ?? ""))?.statusColor
        statusLabel.text = cellObject?.status
        speciesLabel.text = cellObject?.species
        genderLabel.text = cellObject?.gender
        locationLabel.text = cellObject?.location.name
    }
    
    
}
