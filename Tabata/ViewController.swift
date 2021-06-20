//
//  ViewController.swift
//  Tabata
//
//  Created by  Mr.Ki on 15.06.2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var seconds = 150
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
        guard let url = Bundle.main.url(forResource: "win", withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player = player else { return }
            
           // player.numberOfLoops = 2
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!

    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        label.text = "150"
       // start.layer.cornerRadius = 25
        //   stop.layer.cornerRadius = 25
        slider.minimumTrackTintColor = #colorLiteral(red: 0.337254902, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        //slider.currentMinimumTrackImage = UIImage.
        slider.setValue(150, animated: true)
        slider.thumbTintColor = #colorLiteral(red: 0.9607843137, green: 0.3607843137, blue: 0.2784313725, alpha: 1)
        
        //segmentedControl.tintColor = .black //background
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 0.62, green: 0.90, blue: 0.63, alpha: 1.00) ], for: .selected)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 0.34, green: 0.29, blue: 0.29, alpha: 1.00)], for: .normal)
        
    }
    
    @IBAction func segmentedControlTapped(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 1 :
            timer.invalidate()
            seconds = 150
            slider.setValue(150, animated: true)
            label.text = "150"
            
        case 0 :
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            
        default:
            return
        }
        
    }
    
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        
        seconds = Int(sender.value)
        label.text = String(seconds)
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
           
            
        } else {
            timer.invalidate()
            playSoundTwice()
            segmentedControl.selectedSegmentIndex = UISegmentedControl.noSegment
            
            self.performSegue(withIdentifier: "goToUp", sender: self)
        }
    }
    
    
    
}

