//
//  GameLevels.swift
//  Pop the water bubble
//
//  Created by Srivastava, Richa on 16/06/17.
//  Copyright © 2017 ShivHari Apps. All rights reserved.
//

import UIKit
import SpriteKit
var levelNumber = 1
var levelAchieved = 1
class GameLevels: SKScene {
    
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
        
        let level1 = SKSpriteNode(imageNamed: "bubble1")
        level1.position = CGPoint(x: self.size.width*0.25, y: (self.size.height)/2)
        level1.zPosition = 2
        level1.name = "1"
        self.addChild(level1)
        
        let text1 = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        text1.text = "1"
        text1.fontSize = 120
        text1.position = CGPoint(x: (level1.size.width*0.03 - 15), y: (level1.size.height*0.03 - 40))
        text1.zPosition = 1
        text1.fontColor = SKColor.white
        level1.addChild(text1)
        
        
        let level2 = SKSpriteNode(imageNamed: "bubble2")
        level2.position = CGPoint(x: self.size.width*0.50, y: (self.size.height)/2)
        level2.zPosition = 2
        level2.name = "2"
        self.addChild(level2)
        
        let text2 = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        text2.text = "2"
        text2.fontSize = 120
        text2.position = CGPoint(x: (level2.size.width*0.03 - 15), y: (level2.size.height*0.03 - 40))
        text2.zPosition = 2
        text2.fontColor = SKColor.white
        level2.addChild(text2)
        
        
        let level3 = SKSpriteNode(imageNamed: "bubble3")
        level3.position = CGPoint(x: self.size.width*0.75, y: (self.size.height)/2)
        level3.zPosition = 2
        level3.name = "3"
        self.addChild(level3)
        
        let text3 = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        text3.text = "3"
        text3.fontSize = 120
        text3.position = CGPoint(x: (level3.size.width*0.03 - 15), y: (level3.size.height*0.03 - 40))
        text3.zPosition = 3
        text3.fontColor = SKColor.white
        level3.addChild(text3)
        
        
        let level4 = SKSpriteNode(imageNamed: "bubble2")
        level4.position = CGPoint(x: self.size.width*0.25, y: (((self.size.height)/2)-(level3.size.height + 20)))
        level4.zPosition = 4
        level4.name = "4"
        self.addChild(level4)
        
        let text4 = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        text4.text = "4"
        text4.fontSize = 120
        text4.position = CGPoint(x: (level4.size.width*0.03 - 15), y: (level4.size.height*0.03 - 40))
        text4.zPosition = 4
        text4.fontColor = SKColor.white
        level4.addChild(text4)
        
        let level5 = SKSpriteNode(imageNamed: "bubble3")
        level5.position = CGPoint(x: self.size.width*0.50, y: (((self.size.height)/2)-(level3.size.height + 20)))
        level5.zPosition = 5
        level5.name = "5"
        self.addChild(level5)
        
        let text5 = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        text5.text = "5"
        text5.fontSize = 120
        text5.position = CGPoint(x: (level5.size.width*0.03 - 15), y: (level5.size.height*0.03 - 40))
        text5.zPosition = 5
        text5.fontColor = SKColor.white
        level5.addChild(text5)
        
        let level6 = SKSpriteNode(imageNamed: "bubble1")
        level6.position = CGPoint(x: self.size.width*0.75, y: (((self.size.height)/2)-(level3.size.height + 20)))
        level6.zPosition = 6
        level6.name = "6"
        self.addChild(level6)
        
        let text6 = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        text6.text = "6"
        text6.fontSize = 120
        text6.position = CGPoint(x: (level6.size.width*0.03 - 15), y: (level6.size.height*0.03 - 40))
        text6.zPosition = 6
        text6.fontColor = SKColor.white
        level6.addChild(text6)
        
        let level7 = SKSpriteNode(imageNamed: "bubble1")
        level7.position = CGPoint(x: self.size.width*0.25, y: (((self.size.height)/2)-(level3.size.height*2 + 40)))
        level7.zPosition = 7
        level7.name = "7"
        self.addChild(level7)
        
        let text7 = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        text7.text = "7"
        text7.fontSize = 120
        text7.position = CGPoint(x: (level7.size.width*0.03 - 15), y: (level7.size.height*0.03 - 40))
        text7.zPosition = 7
        text7.fontColor = SKColor.white
        level7.addChild(text7)
        
        let level8 = SKSpriteNode(imageNamed: "bubble3")
        level8.position = CGPoint(x: self.size.width*0.50, y: (((self.size.height)/2)-(level3.size.height*2 + 40)))
        level8.zPosition = 8
        level8.name = "8"
        self.addChild(level8)
        
        let text8 = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        text8.text = "8"
        text8.fontSize = 120
        text8.position = CGPoint(x: (level8.size.width*0.03 - 15), y: (level8.size.height*0.03 - 40))
        text8.zPosition = 8
        text8.fontColor = SKColor.white
        level8.addChild(text8)
        
        let level9 = SKSpriteNode(imageNamed: "bubble2")
        level9.position = CGPoint(x: self.size.width*0.75, y: (((self.size.height)/2)-(level3.size.height*2 + 40)))
        level9.zPosition = 9
        level9.name = "9"
        self.addChild(level9)
        
        let text9 = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        text9.text = "9"
        text9.fontSize = 120
        text9.position = CGPoint(x: (level9.size.width*0.03 - 15), y: (level9.size.height*0.03 - 40))
        text9.zPosition = 9
        text9.fontColor = SKColor.white
        level9.addChild(text9)
        
        
//        let locker2 = SKSpriteNode(imageNamed: "locker")
//        locker2.position = CGPoint(x: (level1.size.width*0.28), y: (level1.size.height*0.10))
//        locker2.zPosition = 2
//        locker2.name = "L2"
//        level2.addChild(locker2)
//        
//        let locker3 = SKSpriteNode(imageNamed: "locker")
//        locker3.position = CGPoint(x: (level1.size.width*0.28), y: (level1.size.height*0.10))
//        locker3.zPosition = 2
//        locker3.name = "L3"
//        level3.addChild(locker3)
//        
//        let locker4 = SKSpriteNode(imageNamed: "locker")
//        locker4.position = CGPoint(x: (level1.size.width*0.28), y: (level1.size.height*0.10))
//        locker4.zPosition = 2
//        locker4.name = "L4"
//        level4.addChild(locker4)
//        
//        let locker5 = SKSpriteNode(imageNamed: "locker")
//        locker5.position = CGPoint(x: (level1.size.width*0.28), y: (level1.size.height*0.10))
//        locker5.zPosition = 2
//        locker5.name = "L5"
//        level5.addChild(locker5)
//        
//        let locker6 = SKSpriteNode(imageNamed: "locker")
//        locker6.position = CGPoint(x: (level1.size.width*0.28), y: (level1.size.height*0.10))
//        locker6.zPosition = 2
//        locker6.name = "L6"
//        level6.addChild(locker6)
//        
//        let locker7 = SKSpriteNode(imageNamed: "locker")
//        locker7.position = CGPoint(x: (level1.size.width*0.28), y: (level1.size.height*0.10))
//        locker7.zPosition = 2
//        locker7.name = "L7"
//        level7.addChild(locker7)
//        
//        let locker8 = SKSpriteNode(imageNamed: "locker")
//        locker8.position = CGPoint(x: (level1.size.width*0.28), y: (level1.size.height*0.10))
//        locker8.zPosition = 2
//        locker8.name = "L8"
//        level8.addChild(locker8)
//        
//        let locker9 = SKSpriteNode(imageNamed: "locker")
//        locker9.position = CGPoint(x: (level1.size.width*0.28), y: (level1.size.height*0.50))
//        locker9.zPosition = 2
//        locker9.name = "L9"
//        level9.addChild(locker9)
        
    
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchPoint = touch.location(in: self)
            let tappedNode = nodes(at: touchPoint)
            let tappedNodeLevel = Int(tappedNode[0].zPosition)
            print("tappedNodeLevel \(tappedNodeLevel)")
            print("tappedNodeNAME \(tappedNode[0].name)")
            
            if tappedNodeLevel >= 1 && tappedNodeLevel <= 9 {
                self.run(gameStartSoundEffect)
                if Chartboost.hasInterstitial(CBLocationHomeScreen) {
                    Chartboost.showInterstitial(CBLocationHomeScreen)
                } else {
                    Chartboost.cacheInterstitial(CBLocationHomeScreen)
                }
                levelNumber = tappedNodeLevel
                let sceneToMove = GameScene(size: self.size)
                sceneToMove.scaleMode = self.scaleMode
                let transition = SKTransition.fade(withDuration: 0.3)
                self.view?.presentScene(sceneToMove, transition: transition)
            }
        }
    }

    
    
    
}
