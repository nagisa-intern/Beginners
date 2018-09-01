//
//  ViewController.swift
//  nagisa
//
//  Created by 石黒晴也 on 2018/09/02.
//  Copyright © 2018年 Haruya Ishiguro. All rights reserved.
//

import UIKit
import SceneKit
import SpriteKit
import ARKit
import SnapKit

class ARViewController: UIViewController, ARSCNViewDelegate {

    var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ARSCNViewを定義
        sceneView = ARSCNView()
        sceneView.delegate = self
        view.addSubview(sceneView)
        
        // 影を表現する機能をオンにする
        sceneView.autoenablesDefaultLighting = true
        
        // 画面タップのレコナイザを定義(タップされたらhandleTapを呼ぶ)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        sceneView.addGestureRecognizer(tapGesture)
        
        // 大きさと座標
        sceneView.snp.makeConstraints{(make) in
            make.width.equalTo(view.snp.width)
            make.height.equalTo(view.snp.height)
        }
    }
    
    // 画面がタップされた時に呼ばれる関数(tapGestureから)
    @objc func handleTap(_ gestureRecognize: UIGestureRecognizer){
        let url = URL(string: "https://s3-ap-northeast-1.amazonaws.com/nagisa-intern/comic/2/thumb.jpeg")
        putImageInScene(url: url!)
        guard let currentFrame = self.sceneView.session.currentFrame else{
            print("error occured in handleTap")
            return
        }
        
        let tappedLocation = gestureRecognize.location(in: sceneView)
        let hitResults = sceneView.hitTest(tappedLocation, options: [:])
        
        if hitResults.count == 0 {
            print("当たってへんよ")
            return
        }
        
        let result: AnyObject = hitResults[0]
        
        // 子ノード（文字）があったら消す
        if result.node!.childNodes.count > 0 {
            result.node!.removeFromParentNode()
        }
        
        // ちゃうやん、文字に当たったらにせなあかんやん
        print("hitResults.count")
        print(hitResults.count)
        
        let myLabel = SKLabelNode(fontNamed: "AppleSDGothicNeo-Bold")
        myLabel.text      = "タップされましたよ"
        myLabel.fontSize  = 40
        myLabel.fontColor = Style().white
        let skScene = SKScene(size: CGSize(width: 640, height: 480))
        skScene.backgroundColor = Style().invisivle // 透明にしても文字とSKSceneとの境界がSceneの色になることに注意
        myLabel.position        = CGPoint(x: skScene.size.width/2, y: skScene.size.height/2)
        skScene.addChild(myLabel)
        let backgroundPlane = SCNPlane(width: 0.64, height: 0.48)
        backgroundPlane.firstMaterial?.diffuse.contents = skScene
        backgroundPlane.firstMaterial?.isDoubleSided    = true
        
        let imageNode = SCNNode(geometry: backgroundPlane)
        var translation = matrix_identity_float4x4
        translation.columns.3.z = 0.000001
        imageNode.simdTransform = matrix_multiply(currentFrame.camera.transform, translation)
        imageNode.eulerAngles   = SCNVector3(0, 0, 0)
        
        
        result.node!.addChildNode(imageNode)
        
        print("result")
        print(result)
        print("child")
        print(result.node!.childNodes.count)
    }
    
    // 画像を空間に配置する関数
    func putImageInScene(url: URL) {
        guard let currentFrame = self.sceneView.session.currentFrame else{
            print("currentFrame enable")
            return
        }
        do {
            let imageData: Data = try Data(contentsOf: url)
            let img             = UIImage(data: imageData)
            let texture         = SKTexture(image: img!)
            let imageSpriteNode = SKSpriteNode(texture: texture)
            
            let skScene = SKScene(size: CGSize(width: 640, height: 480))
            skScene.addChild(imageSpriteNode)
            imageSpriteNode.position = CGPoint(x: skScene.size.width/2, y: skScene.size.height/2)
            imageSpriteNode.size     = skScene.size
            
            let backgroundPlane = SCNPlane(width: 1.0, height: 0.75)
            //backgroundPlane.firstMaterial?.diffuse.contents = skScene
            //let material        = SCNMaterial()
            //material.diffuse.contents                       = Style().skyblue
            //backgroundPlane.materials                       = [material]
            backgroundPlane.firstMaterial?.diffuse.contents = skScene
            backgroundPlane.firstMaterial?.isDoubleSided    = true
            
            let imageNode = SCNNode(geometry: backgroundPlane)
            var translation = matrix_identity_float4x4
            translation.columns.3.z = -3
            imageNode.simdTransform = matrix_multiply(currentFrame.camera.transform, translation)
            imageNode.eulerAngles   = SCNVector3(Double.pi, 0, 0)
            
            self.sceneView.scene.rootNode.addChildNode(imageNode)
            
        } catch {
            print("error in getting imageData")
        }
    }

    //(以下デフォルト)-------------------------------------------------------------------------------

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }
    
    // 画面から非表示になる直前に呼ばれる(ARSCNのデフォルト)
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    // メモリー不足でインスタンスが記される直前に呼ばれる(ARSCNのデフォルト)
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        print(error)
    }
    func sessionWasInterrupted(_ session: ARSession) {
    }
    func sessionInterruptionEnded(_ session: ARSession) {
    }

}

