//
//  SplashScreen.swift
//  Chibi
//
//  Created by tung on 21/02/2023.
//

import UIKit

class SplashScreen: UIViewController {
    
//    var orientations = UIInterfaceOrientationMask.landscape //or what orientation you want
//       override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
//       get { return self.orientations }
//       set { self.orientations = newValue }
//       }
//    override func shouldAutorotate() -> Bool {
//        // Lock autorotate
//        return false
//    }
//
//    override func supportedInterfaceOrientations() -> Int {
//
//        // Only allow Portrait
//        return Int(UIInterfaceOrientationMask.landscapeRight.rawValue)
//    }
//
//    override func preferredInterfaceOrientationForPresentation() -> UIInterfaceOrientation {
//
//        // Only allow Portrait
//        return UIInterfaceOrientation.landscapeRight
//    }
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       
       AppUtility.lockOrientation(.landscape)
       // Or to rotate and lock
       // AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
       
   }

   override func viewWillDisappear(_ animated: Bool) {
       super.viewWillDisappear(animated)
       
       // Don't forget to reset when view is being removed
       AppUtility.lockOrientation(.landscape)
   }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation")

        // Do any additional setup after loading the view.
        
//        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
           // Excecute after 3 seconds
            let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
//    //        mainStoryBoard.instantiateViewController(withIdentifier: <#T##String#>)
//            let redViewController = mainStoryBoard.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
//
//            self.navigationController?.pushViewController(redViewController, animated: true)
            
//
//            let transition = CATransition()
//            transition.duration = 0.5
//            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//            transition.type = CATransitionType.fade
//            self.navigationController?.view.layer.add(transition, forKey: nil)
//            let redViewController = mainStoryBoard.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController

//            self.navigationController?.pushViewController(redViewController, animated: true)

            
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func anAction(_sender : AnyObject){

        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
//        mainStoryBoard.instantiateViewController(withIdentifier: <#T##String#>)
        let redViewController = mainStoryBoard.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        
        self.navigationController?.pushViewController(redViewController, animated: true)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .landscapeRight
        } else {
            return .landscapeRight
        }
    }
    
  

}
