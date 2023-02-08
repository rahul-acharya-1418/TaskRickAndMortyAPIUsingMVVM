//
//  RMCharacterDetailsVC.swift
//  TaskRickAndMortyAPIUsingMVVM
//
//  Created by Rahul Acharya on 2023-01-20.
//

import UIKit
import Lottie
import Kingfisher

class RMCharacterDetailsVC: UIViewController {
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterDetailsCollectionView: UICollectionView!
    let viewModel = CharacterListViewViewModel()
    var result: RMResults?
    var characterArray: [RMCharacterDetails] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        characterImage.kf.setImage(with: URL(string: (result?.image ?? "")))
        setUpUI(name: LottieStatus(rawValue: result?.status ?? "")?.changeName ?? "")
        getAllDetails()

    }
    

    func setUpUI(name: String) {
        let aniView = LottieAnimationView(name: name)
        aniView.contentMode = .scaleToFill
        aniView.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        aniView.loopMode = .loop
        aniView.play()
        let aniViewItem = UIBarButtonItem.init(customView: aniView)
        navigationItem.rightBarButtonItem = aniViewItem
    }
    
    
    func convertDateFormater(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?

        guard let date = dateFormatter.date(from: date) else {
            assert(false, "no date from string")
            return ""
        }
        dateFormatter.dateFormat = "EEEE dd, MMM yy, HH:mm"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        let timeStamp = dateFormatter.string(from: date)
        return timeStamp
    }
    
}
