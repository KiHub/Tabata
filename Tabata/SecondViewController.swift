//
//  SecondViewController.swift
//  Tabata
//
//  Created by  Mr.Ki on 20.06.2021.
//

import UIKit

class SecondViewController: UIViewController {

   
    
    override func viewDidLoad() {
        super.viewDidLoad()

 
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
            if event?.subtype == UIEvent.EventSubtype.motionShake {
                self.dismiss(animated: true, completion: nil)
            }
    }

    
    @IBAction func upPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
