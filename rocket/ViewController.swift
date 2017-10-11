////  ViewController.swift
//  prog2
//
//  Created by Admin on 09.10.2017.
//  Copyright © 2017 vitalii. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var launchLabel: UILabel!
    @IBOutlet weak var onLabel: UILabel!
    @IBOutlet weak var roketImage: UIImageView!
    @IBOutlet weak var launchModeView: UIView!
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let path = Bundle.main.path(forResource: "rocket_launch", ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        player = try? AVAudioPlayer(contentsOf: url)
        player?.prepareToPlay()
    }

    @IBAction func launchPressed(_ sender: UIButton) {
        launchModeView.isHidden = false
        player?.play()
        UIView.animate(withDuration: 3.0, animations: {
            var roketFrame = self.roketImage.frame
            roketFrame.origin.y = 70
            self.roketImage.frame = roketFrame
        }) { _ in
            self.launchLabel.isHidden = false
            self.onLabel.isHidden = false
        }
        
    }
    
    
}

