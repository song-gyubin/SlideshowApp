//
//  ZoomInViewController.swift
//  SlideshowApp
//
//  Created by 宋 圭彬 on 2021/05/06.
//

import UIKit

class ZoomInViewController: UIViewController {
    var imageName: String = ""
    @IBOutlet weak var zoomInImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        zoomInImage.isUserInteractionEnabled = true
        // Do any additional setup after loading the view.
        zoomInImage.image = UIImage(named: "images/\(imageName).jpeg")
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
