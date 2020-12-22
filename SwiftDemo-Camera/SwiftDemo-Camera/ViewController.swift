//
//  ViewController.swift
//  SwiftDemo-Camera
//
//  Created by zhulei on 2019/5/17.
//  Copyright © 2019 zhulei. All rights reserved.
//

import UIKit
import AVFoundation
import Photos

class ViewController: UIViewController {

    
    var imagePicker : UIImagePickerController!
    var imageView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Camera"
        
        let rightBtn = UIButton(type: .custom)
        rightBtn.setImage(UIImage(named: "f_more_i"), for: .normal)
        rightBtn.addTarget(self, action: #selector(rightBtnClick), for: .touchUpInside)
        rightBtn.frame.size = CGSize(width: 44, height: 44)
    
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
        
        let someLabel = UILabel.init(frame: CGRect(x: 0, y: 100, width: self.view.frame.width, height: 80))
        someLabel.text = "YOU NEED A PICTURE."
        someLabel.font = UIFont.systemFont(ofSize: 30)
        someLabel.textAlignment = .center
        self.view.addSubview(someLabel)
        
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 200, width: self.view.frame.width, height: self.view.frame.width))
        imageView.contentMode = .scaleAspectFit
        self.view.addSubview(imageView)
        
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    }


    
    @objc func rightBtnClick() {

        let cameraAction = UIAlertAction(title: "拍照", style: UIAlertAction.Style.default) { [weak self] (_) in
            self?.takeCamera()
        }
        let pictureAction = UIAlertAction(title: "从相册中选择", style: .default) { [weak self] (_) in
            self?.takePhoto()
        }
        let cancelAction = UIAlertAction(title: "取消", style: .cancel) { (_) in
            
        }
        let alterVC = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alterVC.addAction(pictureAction)
        alterVC.addAction(cameraAction)
        alterVC.addAction(cancelAction)
        self.navigationController?.present(alterVC, animated: true, completion: nil)
    }
    
    
    func takePhoto() {
        if isRightPhoto() {
            imagePicker.allowsEditing  = true
            imagePicker.sourceType = .savedPhotosAlbum
            self.present(imagePicker, animated: true, completion: nil)
        }else{
            print("不支持访问相册")
        }
    }
    
    func takeCamera(){
        if isRightCamera() {
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            }else{
                print("没有相机")
            }
        }else{
            print("不允许拍照")
        }
    }
    
   

    
    
}

extension ViewController :UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        var image = UIImage()
        if picker.sourceType == .camera {
            image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        }else{
            image = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
        }
        
        self.imageView.image = image
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func isRightCamera() -> Bool {
        let authStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        return authStatus != .restricted && authStatus != .denied
        
    }
    
    func isRightPhoto() -> Bool {
        let authStatus = PHPhotoLibrary.authorizationStatus()
        return authStatus != .restricted && authStatus != .denied
    }
    
}



