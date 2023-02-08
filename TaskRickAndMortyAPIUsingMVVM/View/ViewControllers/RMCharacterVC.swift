//
//  RMCharacterVC.swift
//  TaskRickAndMortyAPIUsingMVVM
//
//  Created by Rahul Acharya on 2023-01-20.
//

import UIKit


class RMCharacterVC: UIViewController {
    
    let viewModel = CharacterListViewViewModel()
    @IBOutlet weak var RMCharacterListTableView: UITableView!
    let spinner = UIActivityIndicatorView(style: .large)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RMCharacterListTableView.register(UINib(nibName: RMCharacterCell.cellID, bundle: nil), forCellReuseIdentifier: RMCharacterCell.cellID)
        spinner.startAnimating()
        RMCharacterListTableView.backgroundView = spinner
        viewModel.fetchAllCharacter()
        modelReady()
    }
    
    
    func modelReady(){
        viewModel.modelClosure = { [weak self] event in
            switch event {
            case .valid:
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self?.spinner.stopAnimating()
                    self?.spinner.hidesWhenStopped = true
                    self?.RMCharacterListTableView.reloadData()
                }
            case .error(let error):
                print(String(describing: error))
            case .dataPass: break
            }
        }
    }
    
    
}
