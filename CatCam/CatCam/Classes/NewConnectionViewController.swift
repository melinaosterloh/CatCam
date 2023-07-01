//
//  newConnectionViewController.swift
//  CatCam
//
//  Created by Melina Osterloh on 30.06.23.
//

import UIKit

class NewConnectionViewController: UIViewController {

    @IBOutlet weak var deviceLabel: UIView!
    @IBOutlet var popUpView: UIView!
    @IBOutlet var blurView: UIVisualEffectView!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var yesBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        deviceLabel.layer.cornerRadius = 5
        
        // blurView Größe ist gleich der Größe von der gesamten View
        blurView.bounds = self.view.bounds
        
        // width = 90%, height = 40%
        popUpView.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width * 0.7, height: self.view.bounds.height * 0.2)
        popUpView.layer.cornerRadius = 20
        
        yesBtn.layer.cornerRadius = 5
        yesBtn.layer.shadowRadius = 3
        yesBtn.layer.shadowOpacity = 0.5
        yesBtn.layer.shadowColor = UIColor.darkGray.cgColor
        yesBtn.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        cancelBtn.layer.cornerRadius = 5
        cancelBtn.layer.shadowRadius = 3
        cancelBtn.layer.shadowOpacity = 0.5
        cancelBtn.layer.shadowColor = UIColor.darkGray.cgColor
        cancelBtn.layer.shadowOffset = CGSize(width: 1, height: 1)
        
    }
    
    @IBAction func deviceButton(_ sender: UIButton) {
        animateIn(loginView: blurView)
        animateIn(loginView: popUpView)
    }
    
    
    @IBAction func cancelButton(_ sender: UIButton) {
        animateOut(loginView: popUpView)
        animateOut(loginView: blurView)
    }
    
    @IBAction func yesButton(_ sender: UIButton) {
        animateOut(loginView: popUpView)
        animateOut(loginView: blurView)
    }
    
    
    
    func animateIn(loginView: UIView) {
        let backgroundView = self.view!
        
        // fügt subview zum Screen hinzu
        backgroundView.addSubview(loginView)
        
        // setzt view Skalierung auf 120%
        loginView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        loginView.alpha = 0
        loginView.center = backgroundView.center
        
        // Animationseffekt
        UIView.animate(withDuration: 0.3, animations: {
            loginView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            loginView.alpha = 1
        })
    }
    
    func animateOut(loginView: UIView) {
        UIView.animate(withDuration: 0.3, animations: {
            loginView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            loginView.alpha = 0
        }, completion: { (success:Bool) in
            loginView.removeFromSuperview()
        })
    }



}
