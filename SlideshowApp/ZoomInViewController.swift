//
//  ZoomInViewController.swift
//  SlideshowApp
//
//  Created by 宋 圭彬 on 2021/05/06.
//

import UIKit

class ZoomInViewController: UIViewController {
    var image: UIImage!
    @IBOutlet weak var zoomInImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        zoomInImageView.image = image
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
