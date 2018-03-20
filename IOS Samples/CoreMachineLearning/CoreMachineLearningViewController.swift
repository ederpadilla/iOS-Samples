//
//  CoreMachineLearningViewController.swift
//  IOS Samples
//
//  Created by Eder Padilla on 14/03/18.
//  Copyright © 2018 Eder Padilla. All rights reserved.
//

import UIKit
import CoreML
import Vision
import AVFoundation

class CoreMachineLearningViewController: UIViewController,UINavigationControllerDelegate,
                                         UIImagePickerControllerDelegate{
    @IBOutlet weak var mImgTake: UIImageView!
    @IBOutlet weak var mTextObjectDes: UITextView!
    var imagePicker : UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func mBuTakePic(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        mImgTake.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imagePicker.dismiss(animated: true, completion: nil)
        pictureIdentifyML(image: (info[UIImagePickerControllerOriginalImage] as? UIImage)!)
    }
    func pictureIdentifyML(image : UIImage){
        guard let model = try? VNCoreMLModel(for : Resnet50().model) else {
            fatalError("Can not load ML model")
        }
        let request = VNCoreMLRequest(model : model){
            [weak self]request, error in
            guard let results = request.results as? [VNClassificationObservation],
                let firstResult = results.first else{
                    fatalError("Can not get result from VNCoreMLRequest")
            }
            DispatchQueue.main.async {
                self?.mTextObjectDes.text = "Nivel de confianza = \(Int(firstResult.confidence * 100))% ,\n Se identifica \(firstResult.identifier) "
                
                self?.textToSpeech(text: (self?.mTextObjectDes.text)!)
            }
        }
        guard let ciImage = CIImage(image : image) else{
            fatalError("Cannot convert CIImage")
        }
        let imageHandler = VNImageRequestHandler(ciImage : ciImage)
        DispatchQueue.global(qos: .userInteractive).async {
            do{
                try imageHandler.perform([request])
            }catch{
                print("Error👹👹👹👹👹 \(error)")
            }
        }
    }
    func textToSpeech(text : String){
        let utTerance = AVSpeechUtterance(string : text)
        utTerance.voice = AVSpeechSynthesisVoice(language : "esp-mx")
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utTerance)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
