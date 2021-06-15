//
//  ViewController.swift
//  Tabata
//
//  Created by  Mr.Ki on 15.06.2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var stop: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        start.layer.cornerRadius = 25
        stop.layer.cornerRadius = 25
        slider.minimumTrackTintColor = UIColor.black
        
        
        
        
    }

    
    
    @IBAction func sliderChanged(_ sender: UISlider) {
    }
    
    @IBAction func startPressed(_ sender: UIButton) {
    }
    
    @IBAction func stopPressed(_ sender: UIButton) {
    }
}

