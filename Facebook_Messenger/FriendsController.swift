//
//  ViewController.swift
//  Facebook_Messenger
//
//  Created by Xiaoheng Pan on 5/10/17.
//  Copyright © 2017 Xiaoheng Pan. All rights reserved.
//

import UIKit

class FriendsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    fileprivate let cellId = "cell"
    var messages: [Message]?
    
    func setupData() {
        let Mark = Friend()
        Mark.name = "Zuckerburg"
        Mark.profileImageName = "zuckprofile"
        
        let message = Message()
        message.friend = Mark
        message.date = NSDate()
        message.text = "Hello my name is Mark, nice to meet you"
        
        let Steve = Friend()
        Steve.name = "Steve Jobs"
        Steve.profileImageName = "steve_profile"
        
        let message2 = Message()
        message2.friend = Steve
        message2.date = NSDate()
        message2.text = "Apple creates great ios devices for the world"
        
        messages = [message, message2]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        collectionView?.register(FriendCell.self, forCellWithReuseIdentifier: cellId)
        
        navigationItem.title = "Recent"
        
        setupData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FriendCell
        
        if let message = messages?[indexPath.row] {
            cell.message = message
            
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let messages = messages else { return 0 }
        return messages.count
    }
    
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        <#code#>
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }

}

