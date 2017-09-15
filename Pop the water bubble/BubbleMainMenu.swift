//
//  BubbleMainMenu.swift
//  Pop the water bubble
//
//  Created by Srivastava, Richa on 04/04/17.
//  Copyright © 2017 ShivHari Apps. All rights reserved.
//

import Foundation
import SpriteKit

class BubbleMainMenu: SKScene {
    let gameStartSoundEffect = SKAction.playSoundFileNamed("click.wav", waitForCompletion: false)
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "water-background")
        background.size = self.size
        background.position = CGPoint(x: (self.size.width)/2, y: (self.size.height)/2)
        background.zPosition = 0
        self.addChild(background)
        
        let gameName = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        gameName.text = "Pop the Bubble"
        gameName.fontSize = 100
        gameName.position = CGPoint(x: self.size.width/2, y: self.size.height*0.75)
        gameName.zPosition = 1
        gameName.fontColor = SKColor.white
        self.addChild(gameName)
        
        let desc = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        desc.text = "Tap the bubble before they disappear!"
        desc.fontSize = 50
        desc.position = CGPoint(x: self.size.width/2, y: self.size.height*0.69)
        desc.zPosition = 1
        desc.fontColor = SKColor.white
        self.addChild(desc)
        
        
        let startGame = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        startGame.text = "Play"
        startGame.fontSize = 150
        startGame.position = CGPoint(x: self.size.width/2, y: self.size.height*0.50)
        startGame.zPosition = 1
        startGame.fontColor = SKColor.white
        startGame.name = "startGame"
        self.addChild(startGame)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchPoint = touch.location(in: self)
            let tappedNode = nodes(at: touchPoint)
            let tappedNodeName = tappedNode[0].name
            
            if tappedNodeName == "startGame" {
                self.run(gameStartSoundEffect)
                if Chartboost.hasInterstitial(CBLocationHomeScreen) {
                    Chartboost.showInterstitial(CBLocationHomeScreen)
                } else {
                    Chartboost.cacheInterstitial(CBLocationHomeScreen)
                }
                let sceneToMove = GameLevels(size:self.size)
                //let sceneToMove = GameScene(size: self.size)
                sceneToMove.scaleMode = self.scaleMode
                let transition = SKTransition.fade(withDuration: 0.3)
                self.view?.presentScene(sceneToMove, transition: transition)
            }
        }
    }
}
