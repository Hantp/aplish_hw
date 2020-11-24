//
//  ViewController.swift
//  Q15
//
//  Created by Zepiao Han on 11/24/20.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBOutlet var imgView: UIImageView!
    var imgPicker: UIImagePickerController?
    
    @IBAction func tapMove(_ sender: UITapGestureRecognizer) {
        if imgPicker == nil {
            imgPicker = UIImagePickerController()
        }
        
        imgPicker?.delegate = self
        #if targetEnvironment(simulator)
        imgPicker?.sourceType = .photoLibrary
        #else
        imgPicker?.sourceType = .camera
        #endif
        
        present(imgPicker!, animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let img = info[.originalImage] {
            self.imgView.image = img as? UIImage
            self.imgView.contentMode = .scaleAspectFit
            picker.dismiss(animated: true, completion: nil)
        }
    }
}

