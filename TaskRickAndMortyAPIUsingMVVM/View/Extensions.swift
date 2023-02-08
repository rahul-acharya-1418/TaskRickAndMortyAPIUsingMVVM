//
//  Extensions.swift
//  TaskRickAndMortyAPIUsingMVVM
//
//  Created by Rahul Acharya on 2023-01-23.
//

import Foundation
import UIKit

extension RMCharacterVC: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - No of Rows in Sections
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rmCharacter?.results.count ?? 0
    }
    
    
    // MARK: - Cell For Row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RMCharacterCell.cellID, for: indexPath) as? RMCharacterCell
        cell?.cellObject = viewModel.rmCharacter?.results[indexPath.row]
        return cell ?? UITableViewCell()
    }
    
    
    // MARK: - DidSelection Method
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // MARK: - Get single Character Request API Call
        let store = RMRequest(endpoint: .character, pathComponent: ["\(indexPath.row+1)"])
        viewModel.passData = store.urlString
        viewModel.getSingleCharacter()
        
        viewModel.modelClosure = { [weak self] event in
            switch event {
            case .valid:
                break
            case .dataPass:
                DispatchQueue.main.async {
                    guard let changeVC = self?.storyboard?.instantiateViewController(withIdentifier: "RMCharacterDetailsVC") as? RMCharacterDetailsVC else { return }
                    guard let singleCH = self?.viewModel.singleCharacter else { return }
                    changeVC.result = singleCH
                    self?.navigationController?.pushViewController(changeVC, animated: true)
                }
            case .error(let error):
                print(String(describing: error))
            }
        }
    }
    
    
    // MARK: - Will Display method For Fetch More Character From API Call
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == ((viewModel.rmCharacter?.results.count ?? 0) - 1) {
            if (viewModel.rmCharacter?.results.count ?? 0) < (viewModel.rmCharacter?.info.count ?? 0) {
                let spinner = UIActivityIndicatorView(style: .medium)
                spinner.startAnimating()
                self.RMCharacterListTableView.tableFooterView = spinner
                self.RMCharacterListTableView.tableFooterView?.isHidden = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    spinner.stopAnimating()
                    spinner.hidesWhenStopped = true
                    self.RMCharacterListTableView.tableFooterView?.isHidden = true
                    self.viewModel.fetchAllCharacter()
                }
            }
        }
    }
}



// MARK: - Collection View Extension in RMCharacterDetailsVC
extension RMCharacterDetailsVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterViewCell.cellID, for: indexPath) as? CharacterViewCell else { return UICollectionViewCell() }
        cell.characterView.backgroundColor = .tertiarySystemBackground
        cell.characterView.layer.borderWidth = 1
        cell.characterView.layer.cornerRadius = 10
        cell.titleView.backgroundColor = .tertiaryLabel
        cell.titleView.layer.borderWidth = 1
        cell.titleView.layer.cornerRadius = 10
        let character = characterArray[indexPath.row]
        cell.titleNameLabel.text = character.title
        cell.titleNameLabel.textColor = RMCharacterDetailsTitleColor(rawValue: character.title)?.tintColor
        cell.colorButton.tintColor = RMCharacterDetailsTitleColor(rawValue: character.title)?.tintColor
        
        cell.characterNameLabel.text = character.name
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (CGFloat(view.frame.width/2) - 5), height: 200)
    }
    
    
    func getAllDetails(){
        guard let result = result else { return }
        let details1 = RMCharacterDetails(title: "STATUS", name: result.status)
        characterArray.append(details1)
        let details2 = RMCharacterDetails(title: "GENDER", name: result.gender)
        characterArray.append(details2)
        let details3 = RMCharacterDetails(title: "LOCATION", name: result.location.name)
        characterArray.append(details3)
        let details4 = RMCharacterDetails(title: "SPECIES", name: result.species)
        characterArray.append(details4)
        let details5 = RMCharacterDetails(title: "ORIGIN", name: result.origin.name)
        characterArray.append(details5)
        let details6 = RMCharacterDetails(title: "TYPE", name: result.type)
        characterArray.append(details6)
        let details7 = RMCharacterDetails(title: "CREATED", name: convertDateFormater(date: "\(result.created)"))
        characterArray.append(details7)
        let details8 = RMCharacterDetails(title: "TOTAL EPISODE", name: "\(result.episode.count)")
        characterArray.append(details8)

    }
    
    
}
