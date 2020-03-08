//
//  CameraViewController.swift
//  ParstagramA
//
//  Created by Ayo  on 3/1/20.
//  Copyright © 2020 Ayo . All rights reserved.
//

import UIKit
import AlamofireImage
import Parse
// Add UIImagePickerControllerDelegate to access camera features
class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commentField: UITextField!
    @IBAction func onSubmit(_ sender: Any) {
        let post = PFObject(className: "Posts")
        post["caption"] = commentField.text!
        post["author"] = PFUser.current()!
        
        //Grab image data to be stored as a url in parse
        let imageData = imageView.image!.pngData()
        // Photo is saved in a separate table
        let file = PFFileObject(data: imageData!)
        post["image"] = file
        
        post.saveInBackground{(success, error) in
            if success {
                self.dismiss(animated:true, completion:nil)
            } else{
                print("error!")
            }
        }
    }
    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        //To know what photo the user took
        picker.delegate = self
        //Provides second screen to the user after they take the photo to allow them to tweak the photo.
        picker.allowsEditing = true
        
        //check if camera is available
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
            
        }
        present(picker, animated: true, completion: nil)
    }
    
    // implement function that stores the image the user picked.
    //image comes in a dictionary
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey:Any]){
        
        let image = info[.editedImage] as! UIImage
        //resize image so we can upload it to heroku. Import alamofireimage to resize it
        let size = CGSize(width: 300, height:300)
        let scaledImage = image.af_imageAspectScaled(toFit: size)
        //store scaled image to image view
        imageView.image = scaledImage
        //dismiss camera view
        dismiss(animated: true, completion:nil)
    }
    
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

}
