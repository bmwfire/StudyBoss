//
//  FlipViewController.swift
//  StudyBoss
//
//  Created by Andrew Millard on 12/5/17.
//  Copyright © 2017 BMW Fire. All rights reserved.
//

import UIKit

class FlipViewController: UIViewController {

    @IBOutlet weak var NextBtn: UIBarButtonItem!
    @IBOutlet weak var Button: UIButton!
    var isOpen: Bool!
    var frontsFlip: [String]!
    var backsFlip: [String]!
    var front: String!
    var back: String!
    var count: Int!
    //TEST
    override func viewDidLoad() {
        isOpen = false
        Button.backgroundColor = UIColor.cyan
        if(count == nil){
            count = 0
        }
        super.viewDidLoad()
        if(frontsFlip.count == 0){
            front = "default front"
            back = "default back"
        }else{
            front = frontsFlip[count]
            back = backsFlip[count]
        }
        
        Button.setTitle(front, for: .normal)
        if(frontsFlip.count > count + 1){
            count = count + 1
        }else{
            NextBtn.isEnabled = false
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ContinueFlip"){
            if let nav_vc = segue.destination as? UINavigationController{
                if let vc = nav_vc.topViewController as? FlipViewController{
                    let cardfronts = self.frontsFlip
                    let cardbacks = self.backsFlip
                    let cardcount = self.count
                    vc.frontsFlip = cardfronts
                    vc.backsFlip = cardbacks
                    vc.count = cardcount
                }
                
            }
            
        }
    }
    
    @IBAction func Next(_ sender: UIBarButtonItem) {
        /*
        let myVC = storyboard?.instantiateViewController(withIdentifier: "flipViewController") as! FlipViewController
        myVC.frontsFlip = frontsFlip.self
        myVC.backsFlip = backsFlip.self
        myVC.count = count.self
        navigationController?.pushViewController(myVC, animated: true)
         */
    }
    @IBAction func Cancel(_ sender: Any) {
        self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)

        //dismiss(animated: true, completion: nil)
    }
    
    @IBAction func Flip(_ sender: Any) {
        
        if isOpen{
            isOpen = false
            Button.setTitle(front, for: .normal)
            Button.backgroundColor = UIColor.cyan
            UIView.transition(with: Button, duration: 0.3, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: nil, completion: nil)
        }else{
            isOpen = true
            Button.setTitle(back, for: .normal)
            Button.backgroundColor = UIColor.green
            UIView.transition(with: Button, duration: 0.3, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: nil, completion: nil)
        }
    }
}
