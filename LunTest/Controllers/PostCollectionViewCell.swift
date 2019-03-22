//
//  PostCollectionViewCell.swift
//  LunTest
//
//  Created by Danil Shchegol on 3/22/19.
//  Copyright © 2019 Danil Shchegol. All rights reserved.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    
    override func awakeFromNib() {
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1, height: 1)
    }
    
    //configuring cell with models
    func configureCell(person: Person, images: [Image]) {
        
        nameLabel.text = person.name
        
        let phoneAttributedString = NSMutableAttributedString(string: "Phone number: ", attributes: [
            NSAttributedString.Key.font: UIFont(name: "Helvetica Bold", size: 16)!])
        phoneAttributedString.append(NSAttributedString(string: "\(person.phone)", attributes: [
            NSAttributedString.Key.font: UIFont(name: "Helvetica Oblique", size: 16)!]))
        phoneLabel.attributedText = phoneAttributedString
        
        let addressAttributedString = NSMutableAttributedString(string: "Address: ", attributes: [
            NSAttributedString.Key.font: UIFont(name: "Helvetica Bold", size: 16)!])
        addressAttributedString.append(NSAttributedString(string: "\(person.address)", attributes: [
            NSAttributedString.Key.font: UIFont(name: "Helvetica Oblique", size: 16)!]))
        addressLabel.attributedText = addressAttributedString
        
        //choosing image that has the same id as user's profile image and downloading image from url
        for image in images {
            if image.image_id == person.profile_image_id {
                avatarImage.download(from: image.link)
                break
            }
        }
    }
}
