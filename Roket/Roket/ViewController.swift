//
//  ViewController.swift
//  Roket
//
//  Created by Admin on 11.10.2017.
//  Copyright © 2017 vitalii. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var launchLabel: UILabel!
    @IBOutlet weak var onLabel: UILabel!
    @IBOutlet weak var rocketImage: UIImageView!
    @IBOutlet weak var launchModeView: UIView!
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "rocket_launch", ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        player = try? AVAudioPlayer(contentsOf: url)
        player?.prepareToPlay()
    }
    
    @IBAction func launchPressed(_ sender: UIButton) {
        launchModeView.isHidden = false
        player?.play()
        UIView.animate(withDuration: 2.0, animations: {
            var rocketFrame = self.rocketImage.frame
            rocketFrame.origin.y = 70
            self.rocketImage.frame = rocketFrame
        }) { _ in
            self.launchLabel.isHidden = false
            self.onLabel.isHidden = false
        }
        
    }
}

