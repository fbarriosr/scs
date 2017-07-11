//
//  SplashViewController.swift
//  Suggested Cannula Size
//
//  Created by Francisco Barrios Romo on 12-06-17.
//  Copyright © 2017 RentalApps. All rights reserved.
//

import UIKit
import Spring
import AVFoundation

class SplashViewController: UIViewController {
    
    @IBOutlet var heart: SpringImageView!
    @IBOutlet var SplashTitulo: SpringLabel!
    
    @IBOutlet var btn: UIButton!
    var timerCorazon1: Timer!
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        splash()
    }
    
    func splash(){
        btn.isHidden = true
        delay(delay:0.2){
            self.timerCorazon1 = Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(self.runTimedSlide01Item3), userInfo: nil, repeats: true)
          // self.playSound()
            
        }
        
        delay(delay:4.0){
            self.timerCorazon1.invalidate()
            self.btn.sendActions(for: .touchUpInside)
            /*self.heart.animation    = "fadeOut"
            self.heart.curve        = "easeIn"
            self.heart.delay        = 0.1
            self.heart.duration     = 0.3
            self.heart.animate()
            
            self.SplashTitulo.animation    = "fadeOut"
            self.SplashTitulo.curve        = "easeIn"
            self.SplashTitulo.delay        = 0.1
            self.SplashTitulo.duration     = 0.3
            self.SplashTitulo.animate()
            */
        }
    }
    
    
    
    func runTimedSlide01Item3() {
        UIView.animate(withDuration: 0.15, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1, options:[] , animations: ({
            self.heart.transform=CGAffineTransform(scaleX: 1.1, y: 1.1)
        }), completion: nil)
        UIView.animate(withDuration: 0.05, delay: 0.15, usingSpringWithDamping: 1.0, initialSpringVelocity: 1, options:[] , animations: ({
            self.heart.transform=CGAffineTransform(scaleX: 1.0, y: 1.0)
        }), completion: nil)
        UIView.animate(withDuration: 0.15, delay: 0.20, usingSpringWithDamping: 1.0, initialSpringVelocity: 1, options:[] , animations: ({
            self.heart.transform=CGAffineTransform(scaleX: 1.07, y: 1.07)
        }), completion: nil)
        UIView.animate(withDuration: 0.05, delay: 0.35, usingSpringWithDamping: 1.0, initialSpringVelocity: 1, options:[] , animations: ({
            self.heart.transform=CGAffineTransform(scaleX: 1.0, y: 1.0)
        }), completion: nil)
        
    }
    
    
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "heart", withExtension: "mp3") else {
            print("url not found")
            return
        }
        
        do {
            /// this codes for making this app ready to takeover the device audio
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /// change fileTypeHint according to the type of your audio file (you can omit this)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3)
            
            // no need for prepareToPlay because prepareToPlay is happen automatically when calling play()
            player!.play()
            player!.numberOfLoops = -1
        } catch let error as NSError {
            print("error: \(error.localizedDescription)")
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

public extension UIView {
    
    /**
     Fade in a view with a duration
     
     - parameter duration: custom animation duration
     */
    func fadeIn(withduration duration:TimeInterval = 1.0) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1.0
        })
    }
    
    
    /**
     Fade out a view with a duration
     
     - parameter duration: custom animation duration
     */
    func fadeOut(withduration duration:TimeInterval = 1.0) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0.0
        })
    }
    
    func animationScaleEffect(view:UIView,animationTime:Float){
        
        UIView.animate(withDuration: TimeInterval(animationTime),animations: {
            
            view.transform=CGAffineTransform(scaleX: 0.1, y: 0.1)},completion:{completion in UIView.animate(withDuration: TimeInterval(animationTime), animations: { () -> Void in
                
                view.transform=CGAffineTransform(scaleX: 1.0, y: 1.0)
                
            })
                
        })
        
    }
}

func delay(delay:Double, closure:@escaping ()->()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
        closure()
    }
}

extension AVAudioPlayer {
    func fadeOut() {
        if volume > 0.1 {
            // Fade
            volume -= 0.1
            perform(#selector(fadeOut), with: nil, afterDelay: 0.1)
        } else {
            // Stop and get the sound ready for playing again
            stop()
            prepareToPlay()
            volume = 1
        }
    }
}


