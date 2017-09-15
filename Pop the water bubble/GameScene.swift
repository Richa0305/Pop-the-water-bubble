//
//  GameScene.swift
//  Pop the water bubble
//
//  Created by Srivastava, Richa on 04/04/17.
//  Copyright © 2017 ShivHari Apps. All rights reserved.
//

import SpriteKit
import GameplayKit

var scoreNumber = 0
class GameScene: SKScene {
    
    let gameArea:CGRect
    let scoreLabel = SKLabelNode(fontNamed: "MarkerFelt-Wide")
    let bannerView = SKView()
    let playPopSoundEffect = SKAction.playSoundFileNamed("pop.wav", waitForCompletion: false)
    let gameOverSoundEffect = SKAction.playSoundFileNamed("gameover.wav", waitForCompletion: false)
    
    override init(size: CGSize) {
        
        let maxAspectRatio:CGFloat = 16.0/9.0
        let playableWidth = size.height / maxAspectRatio
        let gameAreaMargin = (size.width - playableWidth)/2
        gameArea = CGRect(x: gameAreaMargin, y: 0, width: playableWidth, height: size.height)
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func random() -> CGFloat{
        return CGFloat(Float(arc4random())/0xFFFFFFFF)
    }
    
    func random(min:CGFloat,max:CGFloat) -> CGFloat{
        return random() * (max - min) + min
    }
    
    override func didMove(to view: SKView) {
        scoreNumber = 0
        let background = SKSpriteNode(imageNamed: "water-background")
        background.size = self.size
        background.position = CGPoint(x: (self.size.width)/2, y: (self.size.height)/2)
        background.zPosition = 0
        self.addChild(background)
        
        let bubble = SKSpriteNode(imageNamed: "bubble1")
        bubble.position = CGPoint(x: (self.size.width)/2, y: (self.size.height)/2)
        bubble.zPosition = 2
        bubble.name = "bubbleObject"
        self.addChild(bubble)
        
        scoreLabel.fontSize = 200
        scoreLabel.text = "0"
        scoreLabel.fontColor = SKColor.white
        scoreLabel.zPosition = 1
        scoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.90)
        self.addChild(scoreLabel)
        
        
    }
    func addNewBubble()  {
        var randomNumber = arc4random()%5
        randomNumber += 1
        let bubble = SKSpriteNode(imageNamed: "bubble\(randomNumber)")
        bubble.zPosition = 2
        bubble.name = "bubbleObject"
        let randomX = random(min: gameArea.minX + ((bubble.size.width)/2),
                             max: gameArea.maxX - ((bubble.size.width)/2))
        let randomY = random(min: gameArea.minY + ((bubble.size.height)/2),
                             max: gameArea.maxY - ((bubble.size.height)/2))
        
        bubble.position = CGPoint(x: randomX, y: randomY)
        
        self.addChild(bubble)
        
        bubble.run(SKAction.sequence([
                SKAction.scale(to: 0, duration: 3),
                gameOverSoundEffect,
                SKAction.run(runGameOver)
            ]))
    }
    
    
    func runGameOver()  {
        var fadeSpeed:Double!
        if levelNumber == 1 {
            fadeSpeed = 0.9
        }else if levelNumber == 2{
            fadeSpeed = 0.8
        }else if levelNumber == 3{
            fadeSpeed = 0.7
        }else if levelNumber == 4{
            fadeSpeed = 0.6
        }else if levelNumber == 5{
            fadeSpeed = 0.5
        }else if levelNumber == 6{
            fadeSpeed = 0.4
        }else if levelNumber == 7{
            fadeSpeed = 0.3
        }else if levelNumber == 8{
            fadeSpeed = 0.2
        }else if levelNumber == 9{
            fadeSpeed = 0.1
        }
        
        let sceneToMove = BubbleGameOver(size: self.size)
        sceneToMove.scaleMode = self.scaleMode
        let transition = SKTransition.fade(withDuration: fadeSpeed)
        self.view?.presentScene(sceneToMove, transition: transition)
        
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let touchPosition = touch.location(in: self)
            let nodeTapped = nodes(at: touchPosition)
            let tappedNodeName = nodeTapped[0].name
            
            if tappedNodeName == "bubbleObject" {
                
                nodeTapped[0].name = ""
                
                nodeTapped[0].removeAllActions()
                
                nodeTapped[0].run(SKAction.sequence([
                    SKAction.fadeOut(withDuration: 0.1),
                    SKAction.removeFromParent()
                    
                    ]))
                self.run(playPopSoundEffect)
                
                addNewBubble()
                scoreNumber += 1
                scoreLabel.text = String(scoreNumber)
                
                if (scoreNumber == 2 || scoreNumber == 5 || scoreNumber == 10 || scoreNumber == 50 || scoreNumber == 100 || scoreNumber == 150 || scoreNumber == 300 || scoreNumber == 500 ) {
                        addNewBubble()
                }
            }
            
        }
    }
}
