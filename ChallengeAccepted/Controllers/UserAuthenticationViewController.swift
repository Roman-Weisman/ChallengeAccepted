//
//  UserAuthenticationViewController.swift
//  ChallengeAccepted
//
//  Created by Roman Weisman on 9/3/19.
//  Copyright © 2019 Roman Weisman. All rights reserved.
//

import UIKit
import AVKit
import Vision

class UserAuthenticationViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        startFrontCamera()
    }
    
    private func startFrontCamera() {
        let captureSession = AVCaptureSession()
        let captureDevice = getDeviceFrontCamera()
        
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else { return }
        captureSession.addInput(input)
        captureSession.startRunning() // don't forget to stop it
        
        startViewLayer(captureSession)
    }
    
    private func getDeviceFrontCamera() -> AVCaptureDevice{
        if let device = AVCaptureDevice.default(.builtInDualCamera, for: .video, position: .front) {
            return device
        } else if let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) {
            return device
        } else {
            fatalError("Device has no front camera")
        }
    }
    
    private func startViewLayer(_ captureSession : AVCaptureSession) {
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        view.layer.addSublayer(previewLayer)
        previewLayer.frame = view.frame
    }
}
