//
//  ARViewController.swift
//  PhotoDrop
//
//  Created by ALIA M NEELY on 10/2/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import UIKit
import ARKit
import SpriteKit

class ARViewController: UIViewController, ARSKViewDelegate {

 

    //MARK: - ARKit
    
    @IBOutlet weak var sceneView: ARSKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
        if let scene = SKScene(fileNamed: "Scene") {
            sceneView.presentScene(scene)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Pause the view's session
        sceneView.session.pause()
    }
    
    private var arAssetName: String = "Apple-PNG-image"
    
    // MARK: - ARSKViewDelegate
    
    func view(_ view: ARSKView, nodeFor anchor: ARAnchor) -> SKNode? {
        let node = SKSpriteNode(imageNamed: arAssetName)
        node.size = CGSize(width: 40.0, height: 40.0)
        return node
    }

}


//
//extension ARViewController: AVCaptureVideoDataOutputSampleBufferDelegate {
//    
//    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
//        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
//            return
//        }
//        var requestOptions:[VNImageOption : Any] = [:]
//        if let camData = CMGetAttachment(sampleBuffer, kCMSampleBufferAttachmentKey_CameraIntrinsicMatrix, nil) {
//            requestOptions = [.cameraIntrinsics:camData]
//        }
//        let imageRequestHandler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, orientation: CGImagePropertyOrientation(rawValue: 6)!, options: requestOptions)
//        
//        do {
//            try imageRequestHandler.perform(self.requests)
//        } catch {
//            print(error)
//        }
//    }
//}

