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
        guard let url = Bundle.main.url(forResource: "retro_sound", withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
    func playSoundTwice() {
        guard let url = Bundle.main.url(forResource: "retro_sound", withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            
            
            guard let player = player else { return }
            
            player.numberOfLoops = 2
            
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
        //   stop.layer.cornerRadius = 25
        slider.minimumTrackTintColor = UIColor.black
        //slider.currentMinimumTrackImage = UIImage.
        slider.setValue(30, animated: true)
        
        
        
        
        
        
        
    }
    
    
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        
        seconds = Int(sender.value)
        label.text = String(seconds)
        
        
        
        
        
        
    }
    
    @IBAction func startPressed(_ sender: UIButton) {
        
        
        let buttonTitle = sender.title(for: .normal)
        print("\(String(describing: buttonTitle))")
        
        switch buttonTitle {
        case "NOO":
            timer.invalidate()
            seconds = 30
            slider.setValue(30, animated: true)
            label.text = "30"
            sender.setTitle("GOO", for: .normal)
        case "DONE":
            timer.invalidate()
            seconds = 30
            slider.setValue(30, animated: true)
            label.text = "30"
            sender.setTitle("GOO", for: .normal)
            
            
            
        default:
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            sender.setTitle("NOO", for: .normal)
            
            
            
        }
        
        
        
        
        
        
        
    }
    
    @objc func updateTimer() {
        if seconds != 0 {
            seconds -= 1
            label.text = String(seconds)
            slider.setValue(Float(seconds), animated: true)
            print("\(seconds)")
            if seconds % 30 == 0 {
                print("ALARM!")
                playSound()
            }
            if seconds == 0 {
                start.setTitle("DONE", for: .normal)
                
                
            }
            
        } else {
            timer.invalidate()
            
            playSoundTwice()
            
        }
        
        
        
        
        
        
        
        
        
    }
    
    
}

