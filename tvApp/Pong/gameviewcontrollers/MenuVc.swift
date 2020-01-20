//
//  MenuVc.swift
//  AppofApps
//
//  Created by Vivek Gupta on 2019-12-06.
//  Copyright © 2019 Vivek Gupta inc. All rights reserved.
//

import Foundation
import UIKit

enum gameType {
    case easy
    case medium
    case hard
    case player2
}

class MenuVC : UIViewController {
    
    @IBAction func UnwindToHomeVC(sender : UIStoryboardSegue){
        
    }
    
    
    @IBAction func Player2(_ sender: Any) {
        moveToGame(game: .player2)
        let gameVC = self.storyboard?.instantiateViewController(withIdentifier: "gameVC") as! GameViewController
        
        currentGameType = .player2
       
        self.navigationController?.present(gameVC, animated: true)

    }
    
    @IBAction func Easy(_ sender: Any) {
        let gameVC = self.storyboard?.instantiateViewController(withIdentifier: "gameVC") as! GameViewController
        
        currentGameType = .easy
      
        
        self.navigationController?.present(gameVC, animated: true)

        moveToGame(game: .easy)
    }
    @IBAction func Medium(_ sender: Any) {
        moveToGame(game: .medium)
        let gameVC = self.storyboard?.instantiateViewController(withIdentifier: "gameVC") as! GameViewController
        
        currentGameType = .medium
     
        self.navigationController?.present(gameVC, animated: true)

        
    }
    @IBAction func Hard(_ sender: Any) {
        moveToGame(game: .hard)
        let gameVC = self.storyboard?.instantiateViewController(withIdentifier: "gameVC") as! GameViewController
        
        currentGameType = .hard
        
        self.navigationController?.present(gameVC, animated: true)

    }
    
    func moveToGame(game : gameType) {
        let gameVC = self.storyboard?.instantiateViewController(withIdentifier: "gameVC") as! GameViewController
        
        currentGameType = game
        debugPrint("Printing for the sake of initializing view of VC: \(gameVC.view)")
       
        self.navigationController?.present(gameVC, animated: true)
        
        
    }
}

