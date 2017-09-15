//
//  BubbleGameOver.swift
//  Pop the water bubble
//
//  Created by Srivastava, Richa on 04/04/17.
//  Copyright © 2017 ShivHari Apps. All rights reserved.
//

import Foundation
import SpriteKit

class BubbleGameOver: SKScene {
    let clickSound = SKAction.playSoundFileNamed("click.wav", waitForCompletion: false)
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "water-background")
        background.size = self.size
        background.position = CGPoint(x: (self.size.width)/2, y: (self.size.height)/2)
        background.zPosition = 0
        self.addChild(background)
     
        let gameOver = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        gameOver.text = "Game Over"
        gameOver.fontSize = 180
        gameOver.position = CGPoint(x: self.size.width/2, y: self.size.height*0.75)
        gameOver.zPosition = 1
        gameOver.fontColor = SKColor.white
        self.addChild(gameOver)
        
        let gameScore = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        gameScore.text = "Score : \(scoreNumber)"
        gameScore.fontSize = 100
        gameScore.position = CGPoint(x: self.size.width/2, y: self.size.height*0.65)
        gameScore.zPosition = 1
        gameScore.fontColor = SKColor.white
        self.addChild(gameScore)
        
        let defaults = UserDefaults()
        var highScoreNumber = defaults.integer(forKey: "highScoreSaved")
        
        if scoreNumber > highScoreNumber{
            highScoreNumber = scoreNumber
            defaults.set(highScoreNumber, forKey: "highScoreSaved")
            
        }
        
       
        let highScore = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        highScore.text = "High Score : \(highScoreNumber)"
        highScore.fontSize = 80
        highScore.position = CGPoint(x: self.size.width/2, y: self.size.height*0.50)
        highScore.zPosition = 1
        highScore.fontColor = SKColor.white
        self.addChild(highScore)
        
        
        let restart = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        restart.text = "Restart"
        restart.fontSize = 80
        restart.position = CGPoint(x: self.size.width/2, y: self.size.height*0.30)
        restart.zPosition = 1
        restart.fontColor = SKColor.white
        restart.name = "restartBtn"
        self.addChild(restart)
        
        let exit = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        exit.text = "Exit"
        exit.fontSize = 80
        exit.position = CGPoint(x: self.size.width/2, y: self.size.height*0.20)
        exit.zPosition = 1
        exit.fontColor = SKColor.white
        exit.name = "exitBtn"
        self.addChild(exit)
  
        
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let pointOfTouch = touch.location(in: self)
            let tappedNode = nodes(at: pointOfTouch)
            let tappedNodeName = tappedNode[0].name
            
            if tappedNodeName == "restartBtn" {
                self.run(clickSound)
                if Chartboost.hasInterstitial(CBLocationMainMenu) {
                    Chartboost.showInterstitial(CBLocationMainMenu)
                    print("hasInterstitial")
                } else {
                    print("noInterstitial")
                    Chartboost.cacheInterstitial(CBLocationMainMenu)
                }
                let sceneToMove = GameLevels(size: self.size)
                sceneToMove.scaleMode = self.scaleMode
                let transition = SKTransition.fade(withDuration: 0.2)
                self.view?.presentScene(sceneToMove, transition: transition)
            }
            if tappedNodeName == "exitBtn" {
                self.run(clickSound)
                let sceneToMove = BubbleMainMenu(size: self.size)
                sceneToMove.scaleMode = self.scaleMode
                let transition = SKTransition.fade(withDuration: 0.2)
                self.view?.presentScene(sceneToMove, transition: transition)
            }
            
        }
    }
}
