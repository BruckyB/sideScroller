//
//  GameScene.swift
//  sideScroller
//
//  Created by JOHN BRUCKER on 5/2/22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    let cam = SKCameraNode()
    var man : SKSpriteNode!
    var tilt1 : SKSpriteNode!
    var tilt2 : SKSpriteNode!
    var canJump = true
    var jumpPad : SKSpriteNode!
    var wins = 0
    var winLabel : SKLabelNode!
    var won = false
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        self.camera = cam
        tilt1.physicsBody?.applyTorque(0.555)
    }
    func didBegin(_ contact: SKPhysicsContact) {
        print("collided")
        canJump = true
        
        if let x = (contact.bodyA.node) as? SKSpriteNode {
            
            
            if x.name == "jumpPad" {
                print("jumppad")
                man.physicsBody?.velocity = CGVector(dx: (man.physicsBody?.velocity.dx)!, dy: 2200)
            }
            if x.name == "megaJumpPad" {
                print("jumppad2.1")
                man.physicsBody?.velocity = CGVector(dx: (man.physicsBody?.velocity.dx)!, dy: 5000)
            }
            if x.name == "lava" {
                
                var p = man.physicsBody
                man.physicsBody = nil
                man!.position = CGPoint(x: 0, y: 0)
                man.physicsBody = p
                man.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                
            }
            if x.name == "winPlatform" {
                wins += 1
                won = true
                winLabel.text = "Wins: \(wins)"
                
                var p = man.physicsBody
                man.physicsBody = nil
                man!.position = CGPoint(x: 0, y: 0)
                man.physicsBody = p
                man.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            }

            
        }
        if let x = (contact.bodyB.node) as? SKSpriteNode {
            
            if x.name == "jumpPad" {
                print("jumppad")
                man.physicsBody?.velocity = CGVector(dx: (man.physicsBody?.velocity.dx)!, dy: 2200)
            }
            if x.name == "megaJumpPad" {
                print("jumppad2.2")
                man.physicsBody?.velocity = CGVector(dx: (man.physicsBody?.velocity.dx)!, dy: 5000)
            }
            if x.name == "lava" {
                
                var p = man.physicsBody
                man.physicsBody = nil
                man!.position = CGPoint(x: 0, y: 0)
                man.physicsBody = p
                
            }
                if x.name == "winPlatform" {
                    wins += 1
                    won == true
                    winLabel.text = "Wins: \(wins)"
                    
                    var p = man.physicsBody
                    man.physicsBody = nil
                    man!.position = CGPoint(x: 0, y: 0)
                    man.physicsBody = p
                    man.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                }
            
        }
    }
    override func sceneDidLoad() {
        man = self.childNode(withName: "man") as? SKSpriteNode
        jumpPad = self.childNode(withName: "jumpPad") as? SKSpriteNode
        winLabel = self.childNode(withName: "winLabel") as? SKLabelNode
        tilt1 = self.childNode(withName: "tilt1") as? SKSpriteNode
        tilt2 = self.childNode(withName: "tilt2") as? SKSpriteNode
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        cam.position = man.position
        winLabel.position = CGPoint(x: (cam.position.x + 500), y: (cam.position.y + 200))
        self.backgroundColor = UIColor.lightGray
        
        
        
    }
    
    func moveLeft() {
        man.physicsBody?.velocity = CGVector(dx: -500, dy: (man.physicsBody?.velocity.dy)!)
    }
    func moveRight() {
        man.physicsBody?.velocity = CGVector(dx: 500, dy: (man.physicsBody?.velocity.dy)!)
    }
    
    func endRight() {
        man.physicsBody?.velocity = CGVector(dx: 0, dy: (man.physicsBody?.velocity.dy)!)
    }
    func endLeft() {
        man.physicsBody?.velocity = CGVector(dx: 0, dy: (man.physicsBody?.velocity.dy)!)
    }
    
    func jump() {
        if canJump == true {
            man.physicsBody?.velocity = CGVector(dx: (man.physicsBody?.velocity.dx)!, dy: 1000)
            canJump = false
        }
    }
}
