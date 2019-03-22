//
//  PostsViewController.swift
//  LunTest
//
//  Created by Danil Shchegol on 3/22/19.
//  Copyright © 2019 Danil Shchegol. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var personsWithImages: [PersonWithImages] = [PersonWithImages]()
    
    let cellReuseIdentifier = "postCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupCollectionView()
    }
    
    //creating 100 objects (each of them is decoded from json file)
    private func setupData() {
        for _ in 0..<100 {
            if let personWithImages = PersonWithImages() {
                personsWithImages.append(personWithImages)
            }
        }
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "postCell", bundle: nil), forCellWithReuseIdentifier: cellReuseIdentifier)
    }
}

extension PostsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return personsWithImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! PostCollectionViewCell
        cell.configureCell(person: personsWithImages[indexPath.row].person, images: personsWithImages[indexPath.row].images)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.collectionView.bounds.width
        return CGSize(width: width, height: width + 130)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "mapVC") as! MapViewController
        let selectedPerson = personsWithImages[indexPath.row].person
        //transfer info about address of selected person to the next controller
        vc.address = Address(title: selectedPerson.address, lng: selectedPerson.lng, lat: selectedPerson.lat)
        //transition to the next controller
        self.present(vc, animated: true, completion: nil)
    }
}
