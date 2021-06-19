//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation //Audio/Visual Foundation module

class ViewController: UIViewController {

    var player: AVAudioPlayer?
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func playSound(Letter: String) {
        guard let url = Bundle.main.url(forResource: Letter, withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default) //.playback used to play sound even if phone is on silent
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(Letter: sender.currentTitle!)
    }
    
}
