//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 宋 圭彬 on 2021/04/30.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var slideImageView: UIImageView!
    
    var current: Int = 0
    var total: Int = 0
    
    let fm = FileManager.default
    let path = Bundle.main.resourcePath!
    var images: [String] = []
    
    var timer: Timer!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var backwardButton: UIButton!
    @IBOutlet weak var playOrStopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        do {
            images = try fm.contentsOfDirectory(atPath: path + "/images")
            total = images.count
            
            
            for image in images {
                print("Found \(image)")
            }
            print(images[0])
        } catch {
            print("Failed to load images\(error)")
        }
        setCurrentImage(pos: current)
    }
    
    func setCurrentImage(pos: Int) {
        slideImageView.image = UIImage(named: "images/\(images[pos]).jpeg")
    }
    

    @IBAction func forward(_ sender: Any) {
        play(nil)
    }
    
    @objc func play(_ timer: Timer!) {
        if current < (total - 1) {
            current += 1
        } else {
            current = 0
        }
        setCurrentImage(pos: current)
    }
    
    @IBAction func backward(_ sender: Any) {
        if current == 0 {
            current = total - 1
        } else {
            current -= 1
        }

        setCurrentImage(pos: current)
    }
    
    @IBAction func playOrStop(_ sender: Any) {
        if self.timer == nil {
            playOrStopButton.setTitle("停止", for: .normal)   
            forwardButton.isEnabled = false
            backwardButton.isEnabled = false
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(play(_:)), userInfo: nil, repeats: true)
        } else {
            playOrStopButton.setTitle("再生", for: .normal)

            forwardButton.isEnabled = true
            backwardButton.isEnabled = true
            self.timer.invalidate()
            self.timer = nil
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("aa")
        if self.timer != nil {
            playOrStopButton.setTitle("再生", for: .normal)

            forwardButton.isEnabled = true
            backwardButton.isEnabled = true
            self.timer.invalidate()
            self.timer = nil
        }
        
        let zoomInViewController:ZoomInViewController = segue.destination as! ZoomInViewController
        zoomInViewController.image = UIImage(named: "images/\(images[current]).jpeg")
    }

    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}
