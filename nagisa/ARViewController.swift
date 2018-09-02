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
    
    var comic: Int = 1
    var mangaPage: Int = 0
    var hereWeAre: Int = -1 // 今ユーザがどのページを見ているか
    
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
        //
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        sceneView.addGestureRecognizer(panGesture)
        
        // 大きさと座標
        sceneView.snp.makeConstraints{(make) in
            make.width.equalTo(view.snp.width)
            make.height.equalTo(view.snp.height)
        }
    }
        
    
    // 画面がタップされた時に呼ばれる関数(tapGestureから)
    @objc func handleTap(_ gestureRecognize: UIGestureRecognizer){
        guard let currentFrame = self.sceneView.session.currentFrame else{
            print("error occured in handleTap")
            return
        }
        
        print("tapped")
        
        let tappedLocation = gestureRecognize.location(in: sceneView)
        let hitResults = sceneView.hitTest(tappedLocation, options: [:])
        
        // 何もタップされていない時
        if hitResults.count == 0 {
            putImageInScene(comicId: comic)
            comic += 1
            hereWeAre = -1
            
            print("当たってへんよ")
            return
        }
        
        let result: AnyObject = hitResults[0]
        result.node!.removeFromParentNode()
        
        putImageInScene(comicId: comic)
        
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
        //skScene.addChild(myLabel)
        let backgroundPlane = SCNPlane(width: 0.64, height: 0.48)
        backgroundPlane.firstMaterial?.diffuse.contents = skScene
        backgroundPlane.firstMaterial?.isDoubleSided    = true
        
        let imageNode = SCNNode(geometry: backgroundPlane)
        var translation = matrix_identity_float4x4
        translation.columns.3.z = 0.0001
        imageNode.simdTransform = matrix_multiply(currentFrame.camera.transform, translation)
        imageNode.eulerAngles   = SCNVector3(0, 0, 0)
        
        result.node!.addChildNode(imageNode)
        
        /*
        print("result")
        print(result)
        print("child")
        print(result.node!.childNodes.count)
         */
    }
    
    
    @objc func handlePan(_ gestureRecognize: UIPanGestureRecognizer){
        guard let currentFrame = self.sceneView.session.currentFrame else{
            print("error occured in handlePan")
            return
        }
        
        // ドラッグの移動量を取得
        let move: CGPoint = gestureRecognize.translation(in: view)
        
        let tappedLocation = gestureRecognize.location(in: sceneView)
        let hitResults = sceneView.hitTest(tappedLocation, options: [:])
        
        var url = URL(string: "https://s3-ap-northeast-1.amazonaws.com/nagisa-intern/data/1/1/0000.jpeg")
        
        let turning = Double(move.x/50)
        let result: AnyObject = hitResults[0]
        
        print("Panってるよ", hereWeAre)
        print(move)
        
        var node: SCNNode
        
        
        for results in hitResults {
            let name = results.node.name
            
            /* PanがNodeに当たってない時
            if result.count == 0 {
                print("めくり損ねてる")
                return
            }
            */
            if (name == "\(hereWeAre)" || name == "\(hereWeAre-1)"){
            
            
            //if name == "\(hereWeAre)"{
                print("before", hereWeAre)
                if (turning <= 1.5 && turning >= -1.5){
                    results.node.eulerAngles = SCNVector3(Double.pi, turning, 0)
                }
                    // ここでめくれたとする
                else if turning > 1.5 {
                    results.node.position = SCNVector3(results.node.position.x, results.node.position.y, results.node.position.z - (0.0001*(100-Float(name!)!)))
                    
                    results.node.eulerAngles = SCNVector3(Double.pi, Double.pi-0.005*(10-Double(name!)!), 0)
                    hereWeAre += 1
                    print("gone", hereWeAre)
                    
                    // 蓄積されるから0にしてリセット
                    gestureRecognize.setTranslation(CGPoint(x: 0,y: 0), in:view)
                }
                else if turning < -1.5 {
                    results.node.position = SCNVector3(results.node.position.x, results.node.position.y, results.node.position.z + (0.0001*(100-Float(name!)!)))
                    
                    results.node.eulerAngles = SCNVector3(Double.pi, -(Double.pi-0.005*(10-Double(name!)!)), 0)
                    
                    hereWeAre -= 1
                    print("backed", hereWeAre)
                    
                    // 蓄積されるから0にしてリセット
                    gestureRecognize.setTranslation(CGPoint(x: 0,y: 0), in:view)
                }
            }
            print(results)
        }
        
        /*
        print(result.node!.name)
        print(result.node!.parent)
        print(result.node!.parent?.childNodes)
        print(result.node!.parent?.parent)
        print(hereWeAre)
        */

        //print(result.node!.parent)
        
        //print("move:", move)
        
        
    }
    
    // 漫画を空間に配置する関数
    func putImageInScene(comicId: Int) {
        guard let currentFrame = self.sceneView.session.currentFrame else{
            print("currentFrame enable")
            return
        }
        for i in 0..<6 {
            do{
                var url: URL
                if i == 0 {
                    url = URL(string: "https://s3-ap-northeast-1.amazonaws.com/nagisa-intern/comic/\(comicId)/thumb.jpeg")!
                    mangaPage = -1
                }
                else{
                    let mangaPage_s = String(format: "%04d", mangaPage)
                    url = URL(string: "https://s3-ap-northeast-1.amazonaws.com/nagisa-intern/data/\(comicId)/1/\(mangaPage_s).jpeg")!
                }
                
                let imageData: Data = try Data(contentsOf: url)
                let img = UIImage(data: imageData)
                let texture         = SKTexture(image: img!)
                let imageSpriteNode = SKSpriteNode(texture: texture)
                
                let skScene = SKScene(size: CGSize(width: 750, height: 526))
                skScene.addChild(imageSpriteNode)
                imageSpriteNode.position = CGPoint(x: skScene.size.width/4, y: skScene.size.height/2)
                imageSpriteNode.size     = CGSize(width: 375, height: 526)
                let marginSpriteNode = SKSpriteNode(color: Style().invisivle, size: CGSize(width: 375, height: 526))
                marginSpriteNode.position = CGPoint(x: skScene.size.width*3/4, y: skScene.size.height/2)
                skScene.addChild(marginSpriteNode)
                
                skScene.backgroundColor = Style().invisivle // ページめくる動きのためにジオメトリの横幅を画像の２倍にしてて、画像じゃない方は透過してる
                
                let backgroundPlane = SCNPlane(width: 0.375, height: 0.263)
                //backgroundPlane.name = "mangaPage\(mangaPage)"
                //let material        = SCNMaterial()
                //material.diffuse.contents                       = Style().skyblue
                //backgroundPlane.materials                       = [material]
                backgroundPlane.firstMaterial?.diffuse.contents = skScene
                backgroundPlane.firstMaterial?.isDoubleSided    = true
                
                let imageNode = SCNNode(geometry: backgroundPlane)
                imageNode.name = "\(mangaPage)"
                var translation = matrix_identity_float4x4
                translation.columns.3.z = -0.4 - 0.00005 * Float(i)
                
                imageNode.simdTransform = matrix_multiply(currentFrame.camera.transform, translation)
                imageNode.eulerAngles   = SCNVector3(Double.pi, 0, 0)
                
                self.sceneView.scene.rootNode.addChildNode(imageNode)
                
                mangaPage += 1
            } catch {
                print("error in getting imageData")
            }
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

