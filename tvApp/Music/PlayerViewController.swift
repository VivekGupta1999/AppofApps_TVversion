//
//  PlayerViewController.swift
//  project
//
//  Created by Vandan  on 11/29/19.
//  Copyright © 2019 Vandan Inc. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {
    
    
    
    @IBOutlet var lblSong : UILabel!
    @IBOutlet var lblArtist : UILabel!
    @IBOutlet var coverImageView : UIImageView!
    @IBOutlet var progressView : UIProgressView!
    
    
    var trackId : Int = 0
    
    var library = MusicLibrary().library
    
    var audioPlayer : AVAudioPlayer!
    
    @IBAction func playAction( sender: Any)
    {
        if !audioPlayer.isPlaying{
            audioPlayer.play()
        }
        
    }
    @IBAction func stopAction( sender: Any)
    {
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        progressView.progress = 0
        
    }
    @IBAction func pauseAction( sender: Any)
    {
        audioPlayer.pause()
        
    }
    @IBAction func nextAction( sender: Any)
    {
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        if trackId == 0 || trackId < 2{
            
            trackId += 1
            
            
            if let coverImage = library[trackId]["coverImage"]{
                coverImageView.image = UIImage(named: "\(coverImage).jpg")
            }
            
            lblSong.text = library[trackId]["title"]
            lblArtist.text = library[trackId]["artist"]
            
            audioPlayer.currentTime = 0
            progressView.progress = 0
            mainDelegate.selectedIndex = String(trackId)
            
            let path = Bundle.main.path(forResource: mainDelegate.selectedIndex, ofType: "mp3")
            
            if let path = path{
                let mp3URL = NSURL(fileURLWithPath: path)
                do{
                    
                    audioPlayer = try AVAudioPlayer(contentsOf: mp3URL as URL)
                    audioPlayer.play()
                    
                    Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(PlayerViewController.updateProgressView), userInfo: nil, repeats: true)
                    progressView.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: true)
                    
                }catch let error as NSError{
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    
    @IBAction func previousAction( sender: Any)
    {
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        if trackId != 0 || trackId > 0 {
            
            trackId -= 1
            
            
            if let coverImage = library[trackId]["coverImage"]{
                coverImageView.image = UIImage(named: "\(coverImage).jpg")
            }
            
            lblSong.text = library[trackId]["title"]
            lblArtist.text = library[trackId]["artist"]
            
            audioPlayer.currentTime = 0
            progressView.progress = 0
            
            mainDelegate.selectedIndex = String(trackId)
            
            let path = Bundle.main.path(forResource: mainDelegate.selectedIndex, ofType: "mp3")
            
            if let path = path{
                let mp3URL = NSURL(fileURLWithPath: path)
                do{
                    
                    audioPlayer = try AVAudioPlayer(contentsOf: mp3URL as URL)
                    audioPlayer.play()
                    
                    Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(PlayerViewController.updateProgressView), userInfo: nil, repeats: true)
                    progressView.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: true)
                    
                }catch let error as NSError{
                    print(error.localizedDescription)
                }
            }
            
        }
        
        
        
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        audioPlayer.stop()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        
        coverImageView.image = UIImage(named: "\(mainDelegate.selectedImage).jpg")
        lblSong.text = mainDelegate.selectedSong
        lblArtist.text = mainDelegate.selectedArtist
        
        trackId = Int(mainDelegate.selectedIndex)!
        
        let path = Bundle.main.path(forResource: mainDelegate.selectedIndex, ofType: "mp3")
        
        if let path = path{
            let mp3URL = NSURL(fileURLWithPath: path)
            do{
                
                audioPlayer = try AVAudioPlayer(contentsOf: mp3URL as URL)
                audioPlayer.play()
                
                
                Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(PlayerViewController.updateProgressView), userInfo: nil, repeats: true)
                progressView.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: true)
                
            }catch let error as NSError{
                print(error.localizedDescription)
            }
        }
        
        
        
        
    }
    
    @objc func updateProgressView(){
        if audioPlayer.isPlaying{
            progressView.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: true)
            
        }
        
    }
    

}
