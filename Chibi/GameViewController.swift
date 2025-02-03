//
//  GameViewController.swift
//  Chibi
//
//  Created by tung on 04/02/2023.
//

import UIKit
import SpriteKit
import GameplayKit
import GoogleMobileAds

import AVFoundation

class GameViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var bannerView: GADBannerView!
    var viewBanner: UIView!
    var scene: GameScene?
    var selectImage: String = ""
    var selectIndex: Int = 0
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("VAO DAY")
        if(currentMenuItem == 2) {
            let index = indexPath.row
//            if(index <= 6) { // eye
//                return CGSize(width: wCell * 0.7, height: wCell * 0.7)
//            }
//            if(index > 6 && index < 12) {
//                return CGSize(width: 60 * 1.1, height: 20 * 1.2)
//            }// 7-> 11 brow
//
//            if(index > 11 && index < 19) {
//                return CGSize(width: 70 * 1.2, height: 20 * 1.2)
//            } // other
//
            if(index > 18 && index < 27) {
                return CGSize(width: 60, height: 60)
            }  // face
            return CGSize(width: 70, height:60)
        }
        if (currentMenuItem == 4 ){
            return CGSize(width: wCell * 0.7, height: wCell * 0.7)
        } else {
            return CGSize(width: wCell, height: hCell)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        
        // other 35 lr
//        let top    = UIApplication.shared.windows.first?.safeAreaInsets.top
//        let margin = top! > 0 ? 70 : 50
//        print("TOPPP: ",top)
        var margin = 50.0
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            let topPadding = window?.safeAreaInsets.top
            let bottomPadding = window?.safeAreaInsets.bottom
            if(bottomPadding! > 0 || topPadding! > 0) {
                margin = 70.0
            }
            print("topPadding: ",topPadding)
            print("bottomPadding: ",bottomPadding)

        }
        print("MARHIN: ",margin)
        return UIEdgeInsets(top: 15.0,left: margin,bottom: 5.0,right: margin) // top, left, bottom, right
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(currentMenuItem == 2) {
            return kFaceFiles.count
        }
        if(currentMenuItem == 1) {
            return kHairFiles.count
        }
        if(currentMenuItem == 3) {
            return kClothFiles.count
        }
        if(currentMenuItem == 4) {
            return kOtherFiles.count
        }
        if(currentMenuItem == 0)  {
            return  arItem.count
        }
        return 0
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(currentMenuItem == 2) {
            if(indexPath.row > 18 && indexPath.row < 27) {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MouthCell", for: indexPath) as! MouthCell
//                cell.backgroundColor = UIColor.yellow
                cell.imageView.image = UIImage(named: kFaceFiles[indexPath.row])
                return cell
            } else {
                if(indexPath.row > 6 && indexPath.row < 19) {
                    let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "FaceOtherCell", for: indexPath) as! FaceOtherCell
                    cell.imvFaceOther.image = UIImage(named: kFaceFiles[indexPath.row])
                    return cell
                    
                }else {
                    let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "FaceCell", for: indexPath) as! FaceCell
//                    cell.backgroundColor = UIColor.blue
                    cell.imvFace.image = UIImage(named: kFaceFiles[indexPath.row])
                    return cell
                }
                    
            }
            return UICollectionViewCell()
           
        }
        
        if(currentMenuItem == 4) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OtherCell", for: indexPath) as! OtherCell
//            cell.backgroundColor = UIColor.yellow
            cell.imvOther.image = UIImage(named: kOtherFiles[indexPath.row])
            return cell
        }
        
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "BodyCell", for: indexPath) as! BodyCell
//                cell.backgroundColor = UIColor.green
        if(currentMenuItem == 1) {
            cell.imageView.image = UIImage(named: kHairFiles[indexPath.row])
        }
        
        if(currentMenuItem == 3) {
            cell.imageView.image = UIImage(named: kClothFiles[indexPath.row])
        }
        
        if(currentMenuItem == 0)  {
            cell.imageView.image = UIImage(named: arItem[indexPath.row])
        }
        
        print("CELLLL: \(cell.frame.size.width)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //                let rect = self.view?.bounds
        //                UIGraphicsBeginImageContextWithOptions(rect!.size, false, 1)
        //                self.view.drawHierarchy(in: rect!, afterScreenUpdates: true)
        //                let imag = UIGraphicsGetImageFromCurrentImageContext()
        //                UIGraphicsEndImageContext()
        //               let image3 = imag!.cgImage?.cropping(to: CGRect.init(x: -40, y: -30, width: 400, height: UIScreen.main.bounds.size.height))
        //                let image99: UIImage = UIImage(cgImage: image3!)
        //                let imv = UIImageView(frame: CGRect(x: 300, y: 0, width: 400, height: UIScreen.main.bounds.size.height))
        //                imv.backgroundColor = UIColor.red
        //                imv.contentMode = .scaleToFill
        //                imv.image = image99
        //                print("IMAMAAM: \(imag)")
        //                self.view.addSubview(imv)
        //        return
        
        
        switch currentMenuItem {
        case 0:
            selectImage = arItem[indexPath.row]
            break
        case 1:
            selectImage = kHairFiles[indexPath.row]
            break
        case 2:
            selectImage = kFaceFiles[indexPath.row]
            break
        case 3:
            selectImage = kClothFiles[indexPath.row]
            break
        case 4:
            selectImage = kOtherFiles[indexPath.row]
            break
            
        default:
            selectImage = ""
            break
        }
        selectIndex = indexPath.row
        self.scene?.userDidPressMenuButton()
    }
    
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
    
    
    var  kClothFiles: [String] = [
        "Clothes1.png",
        "Clothes2.png",
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
    
    let kMouthFiles: [String] = [
        "Mouth1.png",
        "Mouth2.png",
        "Mouth3.png",
        "Mouth4.png",
        "Mouth5.png",
        "Mouth6.png",
        "Mouth7.png",
        "Mouth8.png"
    ]
    
    let kEyeFiles: [String] = [
        "Eye1-1.png",
        "Eye1-2.png",
        "Eye1-3.png",
        "Eye1-4.png",
        "Eye1-5.png",
        "Eye1-6.png",
        "Eye1-7.png",
        
        "Eye2-1.png",
        "Eye2-2.png",
        "Eye2-3.png",
        "Eye2-4.png",
        "Eye2-5.png",
        "Eye2-6.png",
        "Eye2-7.png"
    ]
    
    let kBrowFiles: [String] = [
        "Brow1.png",
        "Brow2.png",
        "Brow3.png",
        "Brow4.png",
        "Brow5.png"
    ]
    
    var player: AVAudioPlayer?
    
    var scViewOther:UIScrollView!
    var scView:UIScrollView!
    var playerCV: UICollectionView!
    var hairCV: UICollectionView!
    
    let buttonPadding:CGFloat = 0
    var xOffset:CGFloat = 10
    
    let kButtonFiles: [String] = ["Tab1-1","Tab1-2","Tab1-3","Tab1-4","Tab1-5"]
    let kButtonFilesActive: [String] = ["Tab2-1","Tab2-2","Tab2-3","Tab2-4","Tab2-5"]
    
    let arItem: [String] = ["Body2.png","Body1.png","Body3.png"]
    let wCollectionView = UIScreen.main.bounds.size.width - 265 - 20
    
    var currentMenuItem = 0
    
    weak var gameDelegate: GameSceneDelegate?
    
    var wCell =  (UIScreen.main.bounds.size.width - 265 - 70)/4
    var hCell = ((UIScreen.main.bounds.size.width - 265 - 70)/4) * 1.1
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
//        var wItem = (wCollectionView - 70)/4
//        var hItem = wItem * 1.1
//        if(currentMenuItem == 2) {
//            wItem = 80
//            hItem = 70
//        }
//        if(currentMenuItem == 4) {
//            wItem = 80
//            hItem = 70
//        }
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: CGRect.init(x: 0, y: 65, width: wCollectionView, height: UIScreen.main.bounds.size.height - 145), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.showsHorizontalScrollIndicator = false
//        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        return collectionView
    }()
    
    var scene1: GameScene!
    
    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        viewBanner.addSubview(bannerView)
        // This example doesn't give width or height constraints, as the provided
        // ad size gives the banner an intrinsic content size to size the view.
//        viewBanner.addConstraints(
//          [NSLayoutConstraint(item: bannerView,
//                              attribute: .bottom,
//                              relatedBy: .equal,
//                              toItem: view.safeAreaLayoutGuide,
//                              attribute: .bottom,
//                              multiplier: 1,
//                              constant: 0),
//          NSLayoutConstraint(item: bannerView,
//                              attribute: .centerX,
//                              relatedBy: .equal,
//                              toItem: view,
//                              attribute: .centerX,
//                              multiplier: 1,
//                              constant: 0)
//          ])
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        
        
        playSound()
        
        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities and graphs.
        let widtdViewSelect = UIScreen.main.bounds.size.width - 265
        self.scene = GameScene(fileNamed: "GameScene")
        self.scene?.referenceOfGameViewController = self
        if let scene = GKScene(fileNamed: "GameScene") {
            if let sceneNode = scene.rootNode as! GameScene? {
                sceneNode.entities = scene.entities
                sceneNode.graphs = scene.graphs
                // Set the scale mode to scale to fit the window
                sceneNode.scaleMode = .resizeFill
                scene1 = sceneNode
                
                let btnRandom = UIButton(frame: CGRect.init(x: 55, y: UIScreen.main.bounds.size.height - 65, width: 155, height: 65))
//                btnRandom.imageView?.image =  UIImage(named: "random.png")
                
                btnRandom.setImage(UIImage(named: "random.png"), for: .normal)

                
                
                let viewSelect = UIView(frame: CGRect.init(x: 265, y:  50, width: widtdViewSelect - 20, height: UIScreen.main.bounds.size.height - 15 - 50))
                viewSelect.backgroundColor = UIColor.white
                scView = UIScrollView(frame: CGRect.init(x: 0, y: 10, width: viewSelect.frame.size.width, height: 60))
                scView.backgroundColor = UIColor.white

//                scView.setContentOffset(CGPoint.init(x: 0, y: 20), animated: true)
//                topView.addSubview(scViewOther)
//                topView.addSubview(scView)
                viewSelect.addSubview(scView)
//                viewSelect.backgroundColor = .red
                let yourColor : UIColor = UIColor( red: 238, green: 138, blue:163, alpha: 1.0 )
                                viewSelect.layer.masksToBounds = true
                viewSelect.layer.borderColor = UIColor.systemPink.cgColor
                                viewSelect.layer.cornerRadius = 15.0
                                viewSelect.layer.borderWidth = 3.0
                scView.translatesAutoresizingMaskIntoConstraints = false
                for i in 0 ... 4 {
                    let button = UIButton()
                    button.tag = i
//                    button.backgroundColor = UIColor.darkGray
                    if(i == 0) {
                        button.setImage(UIImage(named: kButtonFilesActive[i]), for: .normal)
                    } else {
                        button.setImage(UIImage(named: kButtonFiles[i]), for: .normal)
                    }
                   
                    button.imageView?.contentMode = .scaleAspectFit
                    button.setTitle("\(i)", for: .normal)
                    button.addTarget(self, action: #selector(btnTouch), for: .touchUpInside)
                    let wItem = (widtdViewSelect - 80)/5
                    button.frame = CGRect(x: xOffset, y: CGFloat(buttonPadding), width: wItem, height: 50)
                    xOffset = xOffset + CGFloat(10) + button.frame.size.width
                    scView.addSubview(button)
                }
                
                scView.contentSize = CGSize(width: xOffset, height: scView.frame.height)
//                collectionView.backgroundColor = UIColor.yellow
                
                collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0)

                viewSelect.addSubview(collectionView)
                
                
                let originY = UIScreen.main.bounds.size.height - 100 - 12
                let viewBottom = UIView(frame: CGRect.init(x: 0, y: originY, width: collectionView.frame.size.width, height:40))
//                viewBottom.backgroundColor = UIColor.green
                
                let divView = UIView(frame: CGRect.init(x: 0, y: 0, width: collectionView.frame.size.width, height: 0.75))
//                divView.backgroundColor = UIColor.systemPink
//                viewBottom.addSubview(divView)
                viewSelect.addSubview(viewBottom)
                
                let wItemBtn = (widtdViewSelect - 80)/4
                print("width Item \(wItemBtn)")
                
                let btnBack = UIButton(frame: CGRect.init(x: 5, y: 0, width: wItemBtn, height: 40))
                btnBack.setImage(UIImage.init(named: "back.png"), for: .normal)
                btnBack.imageView?.contentMode = .scaleAspectFit
                btnBack.addTarget(self, action: #selector(backAction), for: .touchUpInside)
                viewBottom.addSubview(btnBack)
                viewBottom.backgroundColor = .blue
                
                
                
                let buttonRandom = UIButton(frame: CGRect.init(x: 5 + wItemBtn + 10, y: 0, width: wItemBtn, height: 40))
                buttonRandom.setImage(UIImage.init(named: "random.png"), for: .normal)
                buttonRandom.imageView?.contentMode = .scaleAspectFit
                buttonRandom.addTarget(self, action: #selector(randomAction), for: .touchUpInside)
                viewBottom.addSubview(btnBack)
                viewBottom.addSubview(buttonRandom)
                
                let originXbtnNext = viewBottom.frame.origin.x + viewBottom.frame.size.width - wItemBtn - 5
                
                let btnNext = UIButton(frame: CGRect.init(x: originXbtnNext, y: 0, width: wItemBtn, height: 40))
                btnNext.setImage(UIImage.init(named: "next.png"), for: .normal)
                btnNext.imageView?.contentMode = .scaleAspectFit
                
                btnNext.addTarget(self, action: #selector(nextAction), for: .touchUpInside)
                
                viewBottom.addSubview(btnNext)
                
                
                let btnSave = UIButton(frame: CGRect.init(x: originXbtnNext - wItemBtn - 10, y: 0
                                                          , width: wItemBtn, height: 40))
                btnSave.setImage(UIImage.init(named: "btnSave.png"), for: .normal)
//                btnSave.buttonType = .
                btnSave.adjustsImageWhenHighlighted = false
                btnSave.imageView?.contentMode = .scaleAspectFit
                
                btnSave.addTarget(self, action: #selector(shareAtion(_:)), for: .touchUpInside)

                
                viewBottom.addSubview(btnSave)
                
                
                
                
                collectionView.register(UINib(nibName: "BodyCell", bundle: nil), forCellWithReuseIdentifier: "BodyCell")
                collectionView.register(UINib(nibName: "OtherCell", bundle: nil), forCellWithReuseIdentifier: "OtherCell")
                collectionView.register(UINib(nibName: "FaceCell", bundle: nil), forCellWithReuseIdentifier: "FaceCell")
                collectionView.register(UINib(nibName: "MouthCell", bundle: nil), forCellWithReuseIdentifier: "MouthCell")
                
                collectionView.register(UINib(nibName: "FaceOtherCell", bundle: nil), forCellWithReuseIdentifier: "FaceOtherCell")
                
                
                
                if let view = self.view as! SKView? {
                    view.presentScene(self.scene)
                    view.ignoresSiblingOrder = true
                    view.showsFPS = true
                    view.showsNodeCount = true
                    view.addSubview(viewSelect)
                    
                    viewBanner = UIView(frame: CGRect.init(x: 265, y: 0, width: widtdViewSelect - 20, height: 50))
                    viewBanner.backgroundColor = .yellow
                    view.addSubview(viewBanner)
                    
                    
                    let viewWidth = view.frame.inset(by: view.safeAreaInsets).width

                      // Here the current interface orientation is used. Use
                      // GADLandscapeAnchoredAdaptiveBannerAdSizeWithWidth or
                      // GADPortraitAnchoredAdaptiveBannerAdSizeWithWidth if you prefer to load an ad of a
                      // particular orientation,
                      let adaptiveSize = GADCurrentOrientationAnchoredAdaptiveBannerAdSizeWithWidth(viewWidth)
                      bannerView = GADBannerView(adSize: adaptiveSize)

            //          addBannerViewToView(bannerView)
                    bannerView.adSize = GADCurrentOrientationAnchoredAdaptiveBannerAdSizeWithWidth(viewWidth)

                    bannerView.adUnitID = "ca-app-pub-8740356244682464/6097060559"
                     bannerView.rootViewController = self

                     bannerView.load(GADRequest())
                    
                    addBannerViewToView(bannerView)
                    
//                    view.addSubview(btnRandom)
                    //                    viewSelect.isHidden = true
                }
            }
            
            //            let btn: UIButton = UIButton(frame: CGRect(x: 600, y: 0, width: 100, height: 50))
            //            btn.backgroundColor = UIColor.green
            //            btn.setTitle("Click Me", for: .normal)
            //            btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            //            btn.tag = 1
            //            self.view.addSubview(btn)
        }
    }
    
    
    @IBAction func btnTouch(_ sender: UIButton)
    {
        print("button tag: \(sender.tag)")
        currentMenuItem = sender.tag
        for i in 0 ... 4 {
            if(sender.tag != i) {
                if let btn = scView.subviews[i] as? UIButton {
                    btn.setImage(UIImage(named: kButtonFiles[i]), for: .normal)
                }
            } else {
                sender.setImage(UIImage(named: kButtonFilesActive[i]), for: .normal)
                
            }
        }
        collectionView.reloadData()
    }
    
    @objc func buttonAction(_ sender:UIButton) {
        //        let rect = self.view?.bounds
        //        UIGraphicsBeginImageContextWithOptions(rect!.size, false, 1)
        //        self.view.drawHierarchy(in: rect!, afterScreenUpdates: true)
        //        let imag = UIGraphicsGetImageFromCurrentImageContext()
        //        UIGraphicsEndImageContext()
        //       let image3 = imag!.cgImage?.cropping(to: CGRect.init(x: -40, y: -30, width: 400, height: UIScreen.main.bounds.size.height))
        //        let image99: UIImage = UIImage(cgImage: image3!)
        //        let imv = UIImageView(frame: CGRect(x: 300, y: 0, width: 400, height: UIScreen.main.bounds.size.height))
        //        imv.backgroundColor = UIColor.red
        //        imv.contentMode = .scaleToFill
        //        imv.image = image99
        //        print("IMAMAAM: \(imag)")
        //        self.view.addSubview(imv)
    }
    
    @objc func nextAction(_ sender: UIButton) {
        print("next action")
        if currentMenuItem == 4 {
            return
        }
        currentMenuItem =  currentMenuItem + 1
        
        for i in 0 ... 4 {
            if let btn = scView.subviews[i] as? UIButton {
                btn.setImage(UIImage(named: kButtonFiles[i]), for: .normal)
            
            if(currentMenuItem != i) {
                
            } else {
                btn.setImage(UIImage(named: kButtonFilesActive[i]), for: .normal)
                
            }
            }
        }
        collectionView.reloadData()
    }
    
    @objc func backAction(_ sender: UIButton) {
        print("back action")
        if currentMenuItem == 0 {
            return
        }
        currentMenuItem =  currentMenuItem - 1
        for i in 0 ... 4 {
            if let btn = scView.subviews[i] as? UIButton {
                btn.setImage(UIImage(named: kButtonFiles[i]), for: .normal)
                if(currentMenuItem != i) {
                    
                } else {
                    btn.setImage(UIImage(named: kButtonFilesActive[i]), for: .normal)
                    
                }
            }
            
        }
        collectionView.reloadData()
    }
    
    func playSound() {
        guard let path = Bundle.main.path(forResource: "music_background1", ofType:"mp3") else {
            print("VAO DAYYY989")
            return }
        let url = URL(fileURLWithPath: path)

        do {
            print("LOG play")
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            print("LOG play1")
            
        } catch let error {
            print("LOG err")
            print(error.localizedDescription)
        }
    }
    
    @objc func shareAtion(_ sender: UIButton) {
//        if #available(iOS 14.0, *) {
//            let colorPickerVC = UIColorPickerViewController()
//            colorPickerVC.modalPresentationStyle = .popover
//            colorPickerVC.modalTransitionStyle = .crossDissolve
//            present(colorPickerVC, animated: true)
//            return
//        } else {
//            // Fallback on earlier versions
//        }
        
        // Tạo một context đồ họa
//        let renderer = UIGraphicsImageRenderer.init(size: self.scene?.player.size!)
            
        let size =   self.scene?.size
        
        
        let renderer1 = UIGraphicsImageRenderer(size: size!)
            // Tạo hình ảnh từ renderer
            let image = renderer1.image { ctx in
                // Tạo một SKScene mới để chứa node
//                let scene = SKScene(size: size)
//                scene.addChild(node)
                
                // Vẽ scene vào context
//                scene.view?.presentScene(scene)
//                scene.view?.drawHierarchy(in: ctx.cgContext)
            }
      
        
         
        
        print("share acion")
                        let rect = self.view?.bounds
                        UIGraphicsBeginImageContextWithOptions(rect!.size, false, 1)
                        self.view.drawHierarchy(in: rect!, afterScreenUpdates: true)
                        let imag = UIGraphicsGetImageFromCurrentImageContext()
                        UIGraphicsEndImageContext()
                       let image3 = imag!.cgImage?.cropping(to: CGRect.init(x: -40, y: -30, width: 400, height: UIScreen.main.bounds.size.height))
                        let image99: UIImage = UIImage(cgImage: image3!)
        
                        let postText: String = "Chibi maker!"
//                       let postImage: UIImage = getScreenshot(scene!)
                        let activityItems = [postText, image99] as [Any]
      
                       let activityController = UIActivityViewController(
                           activityItems: activityItems,
                           applicationActivities: nil
                       )
        
//        UIActivityViewController(

//                       let controller: UIViewController = scene!.view!.window!.rootViewController!
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            activityController.popoverPresentationController?.sourceView = sender
            activityController.modalPresentationStyle = .pageSheet
                }

                        self.present(
                           activityController,
                           animated: true,
                           completion: nil
                       )
//                        let imv = UIImageView(frame: CGRect(x: 300, y: 0, width: 400, height: UIScreen.main.bounds.size.height))
//                        imv.backgroundColor = UIColor.red
//                        imv.contentMode = .scaleToFill
//                        imv.image = image99
//                        print("IMAMAAM: \(imag)")
//                        self.view.addSubview(imv)
    }
    
    @objc func randomAction(_ sender: UIButton) {
        self.scene?.randomAction()
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .landscapeRight
        } else {
            return .landscapeRight
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}


extension UIImage {
    
    convenience init?(view: UIView?) {
        guard let view: UIView = view else { return nil }
        
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, UIScreen.main.scale)
        guard let context: CGContext = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return nil
        }
        
        view.layer.render(in: context)
        let contextImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard
            let image: UIImage = contextImage,
            let pngData: Data = image.pngData()
        else { return nil }
        
        self.init(data: pngData)
    }
    
}

extension SKScene {
    func toImage(ignoreScreenScale: Bool = false) -> UIImage? {
        guard let device = MTLCreateSystemDefaultDevice(),
              let commandQueue = device.makeCommandQueue(),
              let commandBuffer = commandQueue.makeCommandBuffer() else { return nil }
        
        let scale = ignoreScreenScale ? 1 : UIScreen.main.scale
        let size = self.size.applying(CGAffineTransform(scaleX: scale, y: scale))
        let renderer = SKRenderer(device: device)
        let renderPassDescriptor = MTLRenderPassDescriptor()
        
        var r = CGFloat.zero, g = CGFloat.zero, b = CGFloat.zero, a = CGFloat.zero
        backgroundColor.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let textureDescriptor = MTLTextureDescriptor()
        textureDescriptor.usage = [.renderTarget, .shaderRead]
        textureDescriptor.width = Int(size.width)
        textureDescriptor.height = Int(size.height)
        let texture = device.makeTexture(descriptor: textureDescriptor)
        
        renderPassDescriptor.colorAttachments[0].loadAction = .clear
        renderPassDescriptor.colorAttachments[0].texture = texture
        renderPassDescriptor.colorAttachments[0].clearColor = MTLClearColor(
            red: Double(r),
            green: Double(g),
            blue: Double(b),
            alpha:Double(a)
        )
        
        renderer.scene = self
        renderer.render(withViewport: CGRect(origin: .zero, size: size), commandBuffer: commandBuffer, renderPassDescriptor: renderPassDescriptor)
        commandBuffer.commit()
        
        let image = CIImage(mtlTexture: texture!, options: nil)!
        let transformed = image.transformed(by: CGAffineTransform(scaleX: 1, y: -1).translatedBy(x: 0, y: -image.extent.size.height))
        return UIImage(ciImage: transformed)
    }
}

extension UIImage {
    
    func crop(to:CGSize) -> UIImage {
        
        guard let cgimage = self.cgImage else { return self }
        
        let contextImage: UIImage = UIImage(cgImage: cgimage)
        
        guard let newCgImage = contextImage.cgImage else { return self }
        
        let contextSize: CGSize = contextImage.size
        
        //Set to square
        var posX: CGFloat = 30.0
        var posY: CGFloat = 30.0
        let cropAspect: CGFloat = to.width / to.height
        
        var cropWidth: CGFloat = to.width
        var cropHeight: CGFloat = to.height
        
        if to.width > to.height { //Landscape
            cropWidth = contextSize.width
            cropHeight = contextSize.width / cropAspect
            posY = (contextSize.height - cropHeight) / 2
        } else if to.width < to.height { //Portrait
            cropHeight = contextSize.height
            cropWidth = contextSize.height * cropAspect
            posX = (contextSize.width - cropWidth) / 2
        } else { //Square
            if contextSize.width >= contextSize.height { //Square on landscape (or square)
                cropHeight = contextSize.height
                cropWidth = contextSize.height * cropAspect
                posX = (contextSize.width - cropWidth) / 2
            }else{ //Square on portrait
                cropWidth = contextSize.width
                cropHeight = contextSize.width / cropAspect
                posY = (contextSize.height - cropHeight) / 2
            }
        }
        
        let rect: CGRect = CGRect(x: posX, y: posY, width: cropWidth, height: cropHeight)
        
        // Create bitmap image from context using the rect
        guard let imageRef: CGImage = newCgImage.cropping(to: rect) else { return self}
        
        // Create a new image based on the imageRef and rotate back to the original orientation
        let cropped: UIImage = UIImage(cgImage: imageRef, scale: self.scale, orientation: self.imageOrientation)
        
        UIGraphicsBeginImageContextWithOptions(to, false, self.scale)
        cropped.draw(in: CGRect(x: 0, y: 0, width: to.width, height: to.height))
        let resized = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return resized ?? self
    }
    
    //    func cropImage(screenshot: UIImage) -> UIImage {
    //        let scale = screenshot.scale
    //        let imgSize = screenshot.size
    //        let screenHeight = UIScreen.mainScreen().applicationFrame.height
    //        let bound = self.view.bounds.height
    //        let navHeight = self.navigationController!.navigationBar.frame.height
    //        let bottomBarHeight = screenHeight - navHeight - bound
    //        let crop = CGRectMake(0, 0, //"start" at the upper-left corner
    //            (imgSize.width - 1) * scale, //include half the width of the whole screen
    //            (imgSize.height - bottomBarHeight - 1) * scale) //include the height of the navigationBar and the height of view
    //
    //        let cgImage = CGImageCreateWithImageInRect(screenshot.CGImage, crop)
    //        let image: UIImage = UIImage(CGImage: cgImage)!
    //        return image
    //    }
}
