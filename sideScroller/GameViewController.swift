//
//  GameViewController.swift
//  sideScroller
//
//  Created by JOHN BRUCKER on 5/2/22.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    @IBOutlet weak var winLabel: UILabel!
    var play = GameScene()
    override func viewDidLoad() {
        super.viewDidLoad()
         
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                play = scene as! GameScene
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    @IBAction func rightDown(_ sender: Any) {
        play.moveRight()
    }
    @IBAction func rightUpInside(_ sender: Any) {
        play.endRight()
    }
    @IBAction func rightUpOutside(_ sender: Any) {
        play.endRight()
    }
    
    @IBAction func leftDown(_ sender: Any) {
        play.moveLeft()
    }
    @IBAction func leftUpInside(_ sender: Any) {
        play.endLeft()
    }
    @IBAction func leftUpOutside(_ sender: Any) {
        play.endLeft()
    }
    
    @IBAction func jumpButton(_ sender: Any) {
        play.jump()
    }
    
    
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
