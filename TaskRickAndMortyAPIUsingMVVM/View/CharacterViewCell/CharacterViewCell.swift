//
//  CharacterViewCell.swift
//  TaskRickAndMortyAPIUsingMVVM
//
//  Created by Rahul Acharya on 2023-01-23.
//

import UIKit

class CharacterViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var characterView: UIView!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleNameLabel: UILabel!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var colorButton: UIButton!
    static let cellID: String = "CharacterViewCell"
    

}
