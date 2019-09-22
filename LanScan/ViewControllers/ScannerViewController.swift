//
//  ScannerViewController.swift
//  LanScan
//
//  Created by Aritro Paul on 22/09/19.
//  Copyright © 2019 Aritro Paul. All rights reserved.
//

import UIKit
import AVKit
import Vision

class ScannerViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {

    let allowedDevices = ["laptop", "desktop computer", "phone"]
    var detectedDevices = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let captureSession = AVCaptureSession()
           captureSession.sessionPreset = .photo
           
           guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
           guard let input = try? AVCaptureDeviceInput(device: captureDevice) else { return }
           captureSession.addInput(input)
           
           captureSession.startRunning()
           
           let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
           view.layer.addSublayer(previewLayer)
           previewLayer.frame = CGRect(x:0, y:0, width: view.frame.width, height: view.frame.height)
           
           let dataOutput = AVCaptureVideoDataOutput()
           dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
           captureSession.addOutput(dataOutput)
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
            
            guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
            guard let model = try? VNCoreMLModel(for: Resnet50().model) else { return }
            let request = VNCoreMLRequest(model: model) { (finishedReq, err) in
                
                guard let results = finishedReq.results as? [VNClassificationObservation] else { return }
                
                guard let firstObservation = results.first else { return }
                if firstObservation.confidence > 30 {
                    print(firstObservation.identifier, firstObservation.confidence)
                }
                
            }
            
            try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
        }

}
