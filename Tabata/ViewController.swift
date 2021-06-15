//
//  ViewController.swift
//  Tabata
//
//  Created by  Mr.Ki on 15.06.2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var seconds = 30
    var timer = Timer()
    var player: AVAudioPlayer?
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var stop: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "30"
        start.layer.cornerRadius = 25
        stop.layer.cornerRadius = 25
        slider.minimumTrackTintColor = UIColor.black
        //slider.currentMinimumTrackImage = UIImage.
        slider.setValue(30, animated: true)
        
        
        
        
    }

    
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        
        seconds = Int(sender.value)
        label.text = String(seconds)
        
    }
    
    @IBAction func startPressed(_ sender: UIButton) {
        
       // sender.setTitle("YO", for: .normal)
        
        
        
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
     
        @objc func updateTimer() {
            if seconds != 0 {
             seconds -= 1
                label.text = String(seconds)
                slider.setValue(Float(seconds), animated: true)
         //    print(Float(secondsPassed) / Float(totalTime))
                
            } else {
             timer.invalidate()
                
            playSound()
            }
        
        
        
        
        
//
//        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
//
//             func counter() {
//            seconds -= 1
//            label.text = String(seconds)
//            if seconds == 0 {
//                timer.invalidate()
//            }
//
//
//        }
        
        
    }
    
    @IBAction func stopPressed(_ sender: UIButton) {
        timer.invalidate()
        seconds = 30
        slider.setValue(30, animated: true)
        label.text = "30"
        
    }
}

