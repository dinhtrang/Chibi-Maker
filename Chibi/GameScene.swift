//
//  GameScene.swift
//  Chibi
//
//  Created by tung on 04/02/2023.
//

import SpriteKit
import GameplayKit



import SpriteKit

import SpriteKit

import SpriteKit

extension SKScene {
    func captureCharacter(bodyNode: SKNode) -> UIImage? {
        guard let view = self.view else { return nil }
        
        // Chụp ảnh toàn bộ nhóm nhân vật (bodyNode)
        let texture = view.texture(from: bodyNode)
        
        return texture?.toUIImage5()
    }
}

// Chuyển SKTexture thành UIImage
extension SKTexture {
    func toUIImage5() -> UIImage? {
        let size = CGSize(width: self.size().width, height: self.size().height)
        let rect = CGRect(origin: .zero, size: size)
        let renderer = UIGraphicsImageRenderer(size: size)
        
        return renderer.image { _ in
            UIImage(cgImage: self.cgImage()).draw(in: rect)
        }
    }
}



extension SKScene {
    func captureNode(_ node: SKNode) -> UIImage? {
        guard let view = self.view else { return nil }
        
        // Lấy texture từ node (nhân vật)
        let texture = view.texture(from: node)
        
        // Chuyển SKTexture thành UIImage
        return texture?.toUIImage2()
    }
}

// Chuyển SKTexture thành UIImage
extension SKTexture {
    func toUIImage2() -> UIImage? {
        let size = CGSize(width: self.size().width, height: self.size().height)
        let rect = CGRect(origin: .zero, size: size)
        let renderer = UIGraphicsImageRenderer(size: size)
        
        return renderer.image { _ in
            UIImage(cgImage: self.cgImage()).draw(in: rect)
        }
    }
}



extension SKScene {
    func captureScreenshot1(of rect: CGRect) -> UIImage? {
        guard let view = self.view else { return nil }
        
        // Chuyển phần mong muốn của scene thành texture
        let texture = view.texture(from: self, crop: rect)
        
        // Chuyển texture thành UIImage
        return texture?.toUIImage1()
    }
}

// Chuyển SKTexture thành UIImage
extension SKTexture {
    func toUIImage1() -> UIImage? {
        let size = CGSize(width: self.size().width, height: self.size().height)
        let rect = CGRect(origin: .zero, size: size)
        let renderer = UIGraphicsImageRenderer(size: size)
        
        return renderer.image { _ in
            UIImage(cgImage: self.cgImage()).draw(in: rect)
        }
    }
}



extension SKScene {
    func captureScreenshot() -> UIImage? {
        guard let view = self.view else { return nil }
        
        // Chuyển toàn bộ scene thành texture
        let texture = view.texture(from: self)
        
        // Convert texture thành UIImage
        let image = texture?.toUIImage()
        
        return image
    }
}

// Chuyển SKTexture thành UIImage
extension SKTexture {
    func toUIImage() -> UIImage? {
        let size = CGSize(width: self.size().width, height: self.size().height)
        let rect = CGRect(origin: .zero, size: size)
        let renderer = UIGraphicsImageRenderer(size: size)
        
        return renderer.image { _ in
            UIImage(cgImage: self.cgImage()).draw(in: rect)
        }
    }
}


protocol GameSceneDelegate: class {
    func didSelectItem(indexTab: Int, indexItem: Int)
}



//protocol BakeryDelegate {
//    func cookieWasBaked(_ cookie: Cookie)
//}

class GameScene: SKScene {
    
    //        weak var gameDelegate: GameSceneDelegate?
    
    var referenceOfGameViewController : GameViewController!
    
    
    // MARK: - Menu Actions
    
    func showAlert(on viewController: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        viewController.present(alert, animated: true, completion: nil)
    }
    
    func randomAction() {
        
        
        if let characterImage = captureCharacter(bodyNode: bodyNode) {
            UIImageWriteToSavedPhotosAlbum(characterImage, nil, nil, nil) // Lưu vào thư viện ảnh
            print("body node: \(characterImage) ")
        }

        
        
        if let playerImage = captureNode(player) {
//            UIImageWriteToSavedPhotosAlbum(playerImage, nil, nil, nil) // Lưu vào thư viện ảnh
            print("Đã chụp ảnh nhân vật: \(playerImage)")
        }

        
        self.showAlert(on: referenceOfGameViewController, title: "Notifcation", message: "Save image to Abbum success!")
        
        
        let hegiht = UIScreen.main.bounds.size.height - 15 - 15
        let rect = CGRect(x: 0, y: 0, width: 256, height: hegiht)
        if let screenshot1 = self.captureScreenshot1(of: rect) {
            //            UIImageWriteToSavedPhotosAlbum(screenshot, nil, nil, nil) // Lưu ảnh vào thư viện
            print("log anh: \(screenshot1)")
        }

        
        
        let screenshot = self.captureScreenshot()!
        print("log anh: \(screenshot)")
        
        return
        
        let randomInt = Int.random(in: 0..<8)
        background.texture = SKTexture(imageNamed: bgFiles[randomInt])
        
        let idxHair = Int.random(in: 0..<6)
        
        hair.texture = SKTexture(imageNamed: kHairFiles[idxHair])
        hair.size = CGSize(width: hair.texture!.size().width, height: hair.texture!.size().height)
        hair.isHidden = false
        hair.position = CGPoint(x: player.position.x - 4 , y:  30)
        
        let idxEye = Int.random(in: 0..<7)
        eyes.texture = SKTexture(imageNamed: kFaceFiles[idxEye])
        eyes.size = CGSize(width: eyes.texture!.size().width, height: eyes.texture!.size().height)
        eyes.isHidden = false
        eyes.position = CGPoint(x: player.position.x - 8, y: 65)
        
        let idxClother = Int.random(in: 3..<8)
        clothes.texture = SKTexture(imageNamed: kClothFiles[idxClother])
        clothes.size = CGSize(width: clothes.texture!.size().width, height:clothes.texture!.size().height)
        clothes.position = CGPoint(x: player.position.x  , y: -70)
        clothes.isHidden = false

        
        let idxMouth = Int.random(in: 19..<27)
            mouth.isHidden = false
        mouth.texture = SKTexture(imageNamed: kFaceFiles[idxMouth])

        mouth.size = CGSize(width: mouth.texture!.size().width, height: mouth.texture!.size().height)
        mouth.position = CGPoint(x: player.position.x - 8, y: 28)

        
        let idxShoes = Int.random(in: 0..<5)
        shoes1.isHidden = false
        shoes1.texture = SKTexture(imageNamed: kOtherFiles[idxShoes])
        shoes1.size = CGSize(width: shoes1.texture!.size().width, height:shoes1.texture!.size().height)
        shoes1.position = CGPoint(x: player.position.x - 5 , y: -170)
        
        
    }
    
    func userDidPressMenuButton() {
        ///Do what you want to do..
        print("userDidPressMenuButton", referenceOfGameViewController.currentMenuItem)
        if(referenceOfGameViewController.currentMenuItem == 0) {
            player.texture = SKTexture(imageNamed: referenceOfGameViewController.selectImage)
        }
        if(referenceOfGameViewController.currentMenuItem == 1) {
            hair.isHidden = false
            hair.texture = SKTexture(imageNamed: referenceOfGameViewController.selectImage)
            hair.size = CGSize(width: hair.texture!.size().width, height: hair.texture!.size().height)
            if(referenceOfGameViewController.selectIndex < 6) {
                
                print("!!!")
                hair.position = CGPoint(x: player.position.x - 4 , y:  30)
                //                    hair.yScale = 1
                //                    hair.yScale = 1
            } else {
                print("3333")
                hair.position = CGPoint(x: player.position.x - 5 , y:  95)
                
                //                    hair.yScale = 1
            }
        }
        
        // FACE
        if(referenceOfGameViewController.currentMenuItem == 2) {
            let index = referenceOfGameViewController.selectIndex
            print("index: \(index)")
            if(index <= 6) { // eye
                eyes.texture = SKTexture(imageNamed: referenceOfGameViewController.selectImage)
                eyes.size = CGSize(width: eyes.texture!.size().width, height: eyes.texture!.size().height)
                eyes.isHidden = false
                eyes.position = CGPoint(x: player.position.x - 8, y: 65)
            }
            if(index > 6 && index <= 11) {

                brow.texture = SKTexture(imageNamed: referenceOfGameViewController.selectImage)
                brow.size = CGSize(width: brow.texture!.size().width, height: brow.texture!.size().height)
                brow.isHidden = false
                brow.position = CGPoint(x: player.position.x - 11, y: 85)
            }// 7-> 11 brow
            
            if(index > 11 && index <= 18) {
                face.isHidden = false
                face.texture = SKTexture(imageNamed: referenceOfGameViewController.selectImage)
                face.size = CGSize(width: face.texture!.size().width, height: face.texture!.size().height)
                if(index == 13 || index == 14) {
                    face.position = CGPoint(x: player.position.x - 5 , y:  30)
                } else if(index == 15) {
                    face.position = CGPoint(x: player.position.x + 25 , y:  30)
                } else {
                    face.position = CGPoint(x: player.position.x + 3 , y:  130)
                }
            } // other
            
            if(index > 18) {
                mouth.isHidden = false
                mouth.isHidden = false
                mouth.texture = SKTexture(imageNamed: referenceOfGameViewController.selectImage)
                mouth.size = CGSize(width: mouth.texture!.size().width, height: mouth.texture!.size().height)
                mouth.position = CGPoint(x: player.position.x - 8, y: 28)
            } // mouth
            
            
//            if(index == 1 || index == 2) {
//                face.position = CGPoint(x: player.position.x + 3 , y:  30)
//            }
//            if(index == 3) {
//                face.position = CGPoint(x: player.position.x + 25 , y:  30)
//            }
//            if(index == 0 || index == 4 || index == 5 || index == 6) {
//                face.position = CGPoint(x: player.position.x + 25 , y:  eyes.position.y + 60)
//            }
            
        }
        if(referenceOfGameViewController.currentMenuItem == 3) {
            
            clothes.isHidden = false
            clothes1.isHidden = false
            other2.isHidden = false
            other1.isHidden = false
            
            let index = referenceOfGameViewController.selectIndex
            if( 8 < index && index < 14) {
                // 9 => 12
                other2.isHidden = false
                clothes1.isHidden = true
                other2.texture = SKTexture(imageNamed: referenceOfGameViewController.selectImage)
                other2.size = CGSize(width: other2.texture!.size().width, height: other2.texture!.size().height)
                other2.position = CGPoint(x: player.position.x - 5 , y: -110)
                return
            }
            
            
            if(index != 1) {
                clothes.texture = SKTexture(imageNamed: referenceOfGameViewController.selectImage)
                clothes.size = CGSize(width: clothes.texture!.size().width, height: clothes.texture!.size().height)
            }
            
            if(index == 0) {
                clothes.position = CGPoint(x: player.position.x + 5 , y: -40)
            }
            if(index == 0 || index == 2 || index == 1) {
                clothes1.isHidden = false
            } else {
                clothes1.isHidden = true
            }
            if(index == 1) {
                other2.isHidden = true
                clothes1.isHidden = false
                clothes.position = CGPoint(x: player.position.x + 5 , y: -40)
                clothes.texture = SKTexture(imageNamed: "Clothes1.png")
                clothes.size = CGSize(width: clothes.texture!.size().width, height: clothes.texture!.size().height)
            }
            //                clothes1.isHidden = !(index == 1)
            //                if(index == 1) {
            //                    clothes1.isHidden = false
            ////                    clothes1.position = CGPoint(x: player.position.x - 5 , y: -110)
            //                }
            if(index == 2) {
                clothes.position = CGPoint(x: player.position.x - 5 , y: -40)
            }
            if(2 < index && index < 8) {
                // 3=> 7
                clothes.position = CGPoint(x: player.position.x  , y: -70)
            }
            if(index == 8) {
                clothes.position = CGPoint(x: player.position.x, y: -80)
            }
            
            
            
            if(13 < index && index < 18) {
                clothes.position = CGPoint(x: player.position.x - 9 , y: -70)
            }
            if(index > 18) {
                clothes.position = CGPoint(x: player.position.x - 9 , y: -70)
            }
        }
        if(referenceOfGameViewController.currentMenuItem == 4) {
            let index = referenceOfGameViewController.selectIndex
            if(15 < index && index < 22) {
                other.isHidden = false
                other.texture = SKTexture(imageNamed: referenceOfGameViewController.selectImage)
                other.size = CGSize(width: other.texture!.size().width, height:other.texture!.size().height)
                other.position = CGPoint(x: player.position.x - 8, y: eyes.position.y - 8)
            }
            else if( 12 < index && index < 16) {
                other1.isHidden = false
                other1.texture = SKTexture(imageNamed: referenceOfGameViewController.selectImage)
                other1.size = CGSize(width: other1.texture!.size().width, height:other1.texture!.size().height)
                other1.position = CGPoint(x: player.position.x - 8, y: eyes.position.y + 52)
            }
            else if(index >= 0 && index < 6) {
                shoes1.isHidden = false
                shoes1.texture = SKTexture(imageNamed: referenceOfGameViewController.selectImage)
                shoes1.size = CGSize(width: shoes1.texture!.size().width, height:shoes1.texture!.size().height)
                shoes1.position = CGPoint(x: player.position.x - 5 , y: -170)
            } else {
                shoes1.isHidden = false
                shoes1.texture = SKTexture(imageNamed: referenceOfGameViewController.selectImage)
                shoes1.size = CGSize(width: shoes1.texture!.size().width, height:shoes1.texture!.size().height)
                shoes1.position = CGPoint(x: player.position.x - 9 , y: -170)
            }
        }
    }
    
    
    
    
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    var topScrollView = UIView()
    
    private var lastUpdateTime : TimeInterval = 0
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    let widthScreen = UIScreen.main.bounds.size.width
    let heightScreen = UIScreen.main.bounds.size.height
    
    
    //    Sprite* _character;
    //
    //    Sprite* _background;
    //
    //    Sprite* _eyes;
    //    Sprite* _hair;
    //    Sprite* _brow;
    //    Sprite* _mouth;
    //    Sprite* _shoes;
    //    Sprite* _face;
    //    Sprite* _clothe;
    //    Sprite* _pan;
    //    Sprite* _other;
    //    Sprite* _glasses;
    
    let kFaceFiles: [String] = [
      
        
        "Eye2-1.png",
        "Eye2-2.png",
        "Eye2-3.png",
        "Eye2-4.png",
        "Eye2-5.png",
        "Eye2-6.png",
        "Eye2-7.png",
        
        
        "Brow1.png",
        "Brow2.png",
        "Brow3.png",
        "Brow4.png",
        "Brow5.png",
        
        "Face1.png",
        "Face2.png",
        "Face3.png",
        "Face4.png",
        "Face5.png",
        "Face6.png",
        "Face7.png",
        
        "Mouth1.png",
        "Mouth2.png",
        "Mouth3.png",
        "Mouth4.png",
        "Mouth5.png",
        "Mouth6.png",
        "Mouth7.png",
        "Mouth8.png",
        
      
        
        
    ]
    
    var kShoeFiles: [String] = [
        "Shoes1.png",
        "Shoes1-1.png",
        "Shoes1-2.png",
        "Shoes1-3.png",
        "Shoes1-4.png",
        "Shoes1-5.png",
        "Shoes2.png",
        "Shoes2-1.png",
        "Shoes2-3.png",
        "Shoes2-3.png",
        "Shoes2-4.png",
        "Shoes2-5.png",
        "Shoes2-6.png"
    ]
    
    
    var  kClothFiles: [String] = [
        "Clothes1.png",
        "Clothes1.png",
        "Clothes3.png",
        "Clothes4.png",
        "Clothes4-1.png",
        "Clothes4-2.png",
        "Clothes4-3.png",
        "Clothes4-4.png",
        "Clothes5.png",
        "Clothes6.png",
        "Clothes6-1.png",
        "Clothes6-2.png",
        "Clothes6-3.png",
        "Clothes6-4.png",
        "Clothes7.png",
        "Clothes7-1.png",
        "Clothes7-2.png",
        "Clothes7-3.png",
        "Clothes7-4.png",
        "Clothes8.png",
        "Clothes8-1.png",
        "Clothes8-2.png",
        "Clothes8-3.png",
        "Clothes8-4.png",
        "Clothes8-5.png"
    ]
    
    
    var kMouthFiles: [String] = [
        "Mouth1.png",
        "Mouth2.png",
        "Mouth3.png",
        "Mouth4.png",
        "Mouth5.png",
        "Mouth6.png",
        "Mouth7.png",
        "Mouth8.png"
    ]
    
    
    let  bgFiles: [String] = [
        "Background1.jpg",
        "Background2.jpg",
        "Background3.jpg",
        "Background4.png",
        "Background5.jpg",
        "Background 1-1.jpg",
        "Background 1-2.jpg",
        "Background 1-3.jpg"
    ];
    
    let kOtherFiles: [String] = [
//        "Shoes1.png",
//        "Shoes1-1.png",
//        "Shoes1-2.png",
//        "Shoes1-3.png",
//        "Shoes1-4.png",
//        "Shoes1-5.png",
//        "Shoes2.png",
//        "Shoes2-1.png",
//        "Shoes2-3.png",
//        "Shoes2-3.png",
//        "Shoes2-4.png",
//        "Shoes2-5.png",
//        "Shoes2-6.png",
        "Shoes1.png",
        "Shoes1-1.png",
        "Shoes1-2.png",
        "Shoes1-3.png",
        "Shoes1-4.png",
        "Shoes1-5.png",
        "Shoes2.png",
        "Shoes2-1.png",
        "Shoes2-3.png",
        "Shoes2-3.png",
        "Shoes2-4.png",
        "Shoes2-5.png",
        "Shoes2-6.png",
        
        "Other1.png",
        "Other2.png",
        "Other4.png",
        "Other3.png",
        "Other3-1.png",
        "Other3-2.png",
        "Other3-3.png",
        "Other3-5.png",
        "Other3-6.png",
    ]
    
    var bodyNode = SKNode()
    
    
    var shoes = SKSpriteNode(imageNamed: "Shoes1.png")
    var clothes = SKSpriteNode(imageNamed: "Clothes4-1.png")
    var clothes1 = SKSpriteNode(imageNamed: "Clothes2.png")
    
    var shoes1 = SKSpriteNode(imageNamed: "")
    var shoes2 = SKSpriteNode(imageNamed: "")
    var brow = SKSpriteNode(imageNamed: "")
    var mouth = SKSpriteNode(imageNamed: "Mouth4.png")
    var eyes = SKSpriteNode(imageNamed: "Eye1-1.png")
    var background = SKSpriteNode(imageNamed: "Background 1-1.jpg")
    var player = SKSpriteNode(imageNamed: "Body1.png")
    var hair = SKSpriteNode(imageNamed: "Hair1-3.png")
    var face = SKSpriteNode(imageNamed: "Face1.png")
    var other = SKSpriteNode(imageNamed: "Other1.png")
    var other1 = SKSpriteNode()
    var other2 = SKSpriteNode()
    let kBodyFiles: [String] = ["Body1.png","Body2.png","Body3.png"]
    let  kHairFiles: [String] = [
//        "Hair1-1.png",
        "Hair1-2.png",
        "Hair1-3.png",
        "Hair1-4.png",
        "Hair1-5.png",
        "Hair1-6.png",
        "Hair1-7.png",
        //      "Hair2-1.png",
        "Hair2-2.png",
        "Hair2-3.png",
        "Hair2-4.png",
        "Hair2-5.png",
        "Hair2-6.png",
        "Hair2-7.png"
        
    ]
    
    override func sceneDidLoad() {
        
        
        self.lastUpdateTime = 0
        self.view?.backgroundColor = UIColor.white
        // Get label node from scene and store it for use later
        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
        self.label?.horizontalAlignmentMode = .left
        if let label = self.label {
            label.alpha = 0.0
            label.run(SKAction.fadeIn(withDuration: 2.0))
            label.horizontalAlignmentMode = .left
        }
        
        // Create shape node to use during mouse interaction
        let w = (self.size.width + self.size.height) * 0.05
        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
        
        if let spinnyNode = self.spinnyNode {
            spinnyNode.lineWidth = 2.5
            
            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                              SKAction.fadeOut(withDuration: 0.5),
                                              SKAction.removeFromParent()]))
        }
        print(self.size.height/2)
        print("origin bound: \(-(self.size.height/2))")
        print("origin bound3: \(-(self.size.width/2))")
        print("origin bound1: \(-(UIScreen.main.bounds.size.height/2))")
        print("origin bound44: \(-(UIScreen.main.bounds.size.width/1))")
        print(player.texture?.textureRect().height)
        
        //        self.view.
        
        background.position.x = -self.position.x - ((widthScreen - 256)/2)
        print("toa do: \(self.position.x - ((widthScreen - 256)/2))")
        //        background.
        background.size = CGSize(width: 512/2, height: self.size.height)
        print("size bg \(background.size.width) \(background.size.height) \(self.size.height) \(self.size.width)")
        
        player.position = CGPoint(x: background.position.x, y: 0)
        //        player.position.
        //        player.size = CGSize(width: 163 * 1, height: 354 * 0.8)
        
        hair.position = CGPoint(x: player.position.x, y:  30)
        eyes.position = CGPoint(x: player.position.x - 8, y: 65)
        brow.position = CGPoint(x: player.position.x, y: 85)
        
        mouth.position = CGPoint(x: player.position.x - 5, y: 25)
        clothes.position = CGPoint(x: player.position.x, y: -70)
        clothes1.position = CGPoint(x: player.position.x - 5 , y: -110)
        shoes.position = CGPoint(x: player.position.x - 7, y: -180)
        
        hair.isHidden = false
        clothes1.isHidden = true
        other.isHidden = true
        
        hair.zPosition = 4
        eyes.zPosition = 3
        brow.zPosition = 3
        mouth.zPosition = 3
        player.zPosition = 2
        clothes.zPosition = 5
        clothes1.zPosition = 5
        shoes.zPosition = 3
        other.zPosition = 7
        other1.zPosition = 7
        other2.zPosition = 3
        face.zPosition = 7
        shoes1.zPosition = 7
        shoes2.zPosition = 7
        
//
        shoes1.isHidden = true
        shoes2.isHidden = true
        brow.isHidden = true
        hair.isHidden = true
        eyes.isHidden = true
        mouth.isHidden = true
        player.isHidden = false
        clothes.isHidden = true
        clothes1.isHidden = true
        shoes.isHidden = true
        other.isHidden = true
        other1.isHidden = true
        other2.isHidden = true
        face.isHidden = true
        
        
        hair.name = "hair name"
        
        
        
        
        bodyNode.addChild(background)
        bodyNode.addChild(player)
        bodyNode.addChild(hair)
        bodyNode.addChild(eyes)
        bodyNode.addChild(mouth)
        bodyNode.addChild(clothes)
        bodyNode.addChild(shoes)
        bodyNode.addChild(clothes1)
        bodyNode.addChild(other)
        bodyNode.addChild(other1)
        bodyNode.addChild(other2)
        bodyNode.addChild(face)
        bodyNode.addChild(brow)
        bodyNode.addChild(shoes1)
        bodyNode.addChild(shoes2)
        addChild(bodyNode)
    }
    
    
    
//    func touchDown(atPoint pos : CGPoint) {
//        //        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//        //            n.position = pos
//        //            n.strokeColor = SKColor.green
//        //            self.addChild(n)
//        //        }
//
//
//        //        let randomInt1 = Int.random(in: 0..<10)
//        //        hair.texture = SKTexture(imageNamed: kHairFiles[randomInt1])
//
//        //        self.view?.texture(from: scene, crop: <#T##CGRect#>)
//
//        //        hair.updateFocusIfNeeded()
//    }
//
//    func touchMoved(toPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.blue
//            self.addChild(n)
//        }
//    }
//
//    func touchUp(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.red
//            self.addChild(n)
//        }
//    }
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let label = self.label {
//            //            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
//        }
//
//
//
//        for t in touches {
//            //            let node = self.nodeAtPoint(t.location(in: self)!)
//            //            self.nodes(at: t.location(in: self!.view))
//
//            self.touchDown(atPoint: t.location(in: self))
//
//        }
//
//
//        //        let location = touches.anyObject()?.locationInNode(self)
//        //            let node = self.nodeAtPoint(location!)
//        //            if (node.name == "InstantReplay") {
//        //                println("you hit me with your best shot!")
//        //            }
//
//
//    }
//
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
//    }
//
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
//    }
//
//    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
//    }
//
//
//    override func update(_ currentTime: TimeInterval) {
//        // Called before each frame is rendered
//
//        // Initialize _lastUpdateTime if it has not already been
//        if (self.lastUpdateTime == 0) {
//            self.lastUpdateTime = currentTime
//        }
//
//        // Calculate time since last update
//        let dt = currentTime - self.lastUpdateTime
//
//        // Update entities
//        for entity in self.entities {
//            entity.update(deltaTime: dt)
//        }
//
//        self.lastUpdateTime = currentTime
//    }
}

