//
//  LibraryTableViewController.swift
//  project
//
//  Created by Vandan  on 11/29/19.
//  Copyright © 2019 Vandan Inc. All rights reserved.
//

import UIKit


class LibraryTableViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    
    
    @IBOutlet var collectionView1 : UICollectionView!
    let reuseIdentifierFeatured = "FeaturedCell"
    
    
    var library = MusicLibrary().library
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 50.0, bottom: 0.0, right: 50.0)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionView1
        {
            return library.count
        }
        else{
            return 0
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == collectionView1
        {
            let cell : FeaturedCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierFeatured, for: indexPath) as! FeaturedCollectionViewCell
            
            if let coverImage = library[indexPath.row]["coverImage"]{
                cell.featuredImage.image = UIImage(named: "\(coverImage).jpg")
            }
            cell.lbSong.text = "Song: " + library[indexPath.row]["title"]!
            cell.lbArtist.text = "Artist: " + library[indexPath.row]["artist"]!
            
            
            return cell
        }
        return UICollectionViewCell()
       
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        mainDelegate.selectedIndex = library[indexPath.row]["index"]!
        mainDelegate.selectedImage = library[indexPath.row]["coverImage"]!
        mainDelegate.selectedSong = library[indexPath.row]["title"]!
        mainDelegate.selectedArtist = library[indexPath.row]["artist"]!
        performSegue(withIdentifier: "showPlayer", sender: nil)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return library.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    

}
