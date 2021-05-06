//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 宋 圭彬 on 2021/04/30.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var slide_image: UIImageView!
    var current: Int = 0
    var total: Int = 0
    
    let fm = FileManager.default
    let path = Bundle.main.resourcePath!
    var images: Array<String> = []
    
    var timer: Timer!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var backwardButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        slide_image.isUserInteractionEnabled = true

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
        slide_image.image = UIImage(named: "images/\(images[pos]).jpeg")
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
            forwardButton.isEnabled = false
            backwardButton.isEnabled = false
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(play(_:)), userInfo: nil, repeats: true)
        } else {
            forwardButton.isEnabled = true
            backwardButton.isEnabled = true
            self.timer.invalidate()
            self.timer = nil
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let zoomInViewController:ZoomInViewController = segue.destination as! ZoomInViewController
        zoomInViewController.imageName = images[current]
    }
    @IBAction func imageTapGesture(_ sender: Any) {
        print("aaa")
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}

