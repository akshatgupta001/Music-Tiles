//
//  GameVC.swift
//  Music Tiles
//
//  Created by Akshat Gupta on 18/07/18.
//  Copyright © 2018 Akshat Gupta. All rights reserved.
//

import UIKit
import  AVFoundation
class GameVC: UIViewController {
    //song
    var fileName : String = "Still D.R.E. - Dr. Dre featuring Snoop Dogg"
    
    var audioPlayer : AVAudioPlayer!
    
     var timer = Timer()
    
    @IBAction func white(_ sender: Any) {
        audioPlayer.pause()
        let alert = UIAlertController(title: "Alert", message: "Your score : \(score) \n highscore : \(highScore)", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Play Again", style: .default, handler: { action in
            switch action.style{
            case .default:
                self.viewDidLoad()
                print("default")
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
                
                
            }}))
        
        self.present(alert, animated: true, completion: nil)

        
    }
    @IBOutlet weak var white1: UIButton!
    @IBOutlet weak var white2: UIButton!
    @IBOutlet weak var white3: UIButton!
    @IBOutlet weak var white4: UIButton!
    @IBOutlet weak var white5: UIButton!
    @IBOutlet weak var white6: UIButton!
    @IBOutlet weak var white7: UIButton!
    @IBOutlet weak var white8: UIButton!
    @IBOutlet weak var white9: UIButton!
    @IBOutlet weak var white10: UIButton!
    @IBOutlet weak var white11: UIButton!
    @IBOutlet weak var white12: UIButton!
    @IBOutlet weak var white13: UIButton!
    @IBOutlet weak var white14: UIButton!
    @IBOutlet weak var white15: UIButton!
    
    @IBOutlet weak var black1: UIButton!
    @IBOutlet weak var black2: UIButton!
    @IBOutlet weak var black3: UIButton!
    @IBOutlet weak var black4: UIButton!
    @IBOutlet weak var black5: UIButton!
    
    
    
    var score = Int()
    var highScore = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        score = 0 
        let highScoreDefault = UserDefaults.standard
        if highScoreDefault.value(forKey: "highScore") != nil {
            highScore = highScoreDefault.value(forKey: "highScore") as! NSInteger
        }else {
            highScore = 0
        }
        
        playSoundWith(fileName: fileName, fileExtension: "mp3")
        
        randomPlacement1()
        randomPlacement2()
        randomPlacement3()
        randomPlacement4()
        randomPlacement5()
        
        print(white1.center.x)
        print(black1.center.x)
        print(white2.center.x)
        print(white3.center.x)
        
        
        print("****")
        
        
    }
    func playSoundWith(fileName : String, fileExtension : String){
        let audioSourceURL : URL!
        audioSourceURL  = Bundle.main.url(forResource: fileName, withExtension: fileExtension)
        if(audioSourceURL == nil ){
            
        }else {
            do{
                
                audioPlayer = try AVAudioPlayer.init(contentsOf: audioSourceURL)
                audioPlayer.prepareToPlay()
                
            }catch{
                print(error)
            }
        }
    }
    @IBAction func FirstDown(_ sender: Any) {
        
       moveDown()
        
    }
    @IBAction func SecondDown(_ sender: Any) {
        moveDown()
    }
    @IBAction func ThirdDown(_ sender: Any) {
        moveDown()
    }
    
    @IBAction func FourthDown(_ sender: Any) {
        moveDown()
    }
    
    @IBAction func FifthDown(_ sender: Any) {
        moveDown()
    }
    

    func moveDown(){
        let highScoreDefault = UserDefaults.standard
        score = score + 1
        NSLog("\(score)")
        
        if score > highScore {
            highScore = score
            highScoreDefault.set(highScore, forKey: "highScore")
        }
        audioPlayer.play()
//        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(pauseMusic), userInfo: nil, repeats: false)
        white1.center.y = white1.center.y + 167
        white2.center.y = white2.center.y + 167
        white3.center.y = white3.center.y + 167
        white4.center.y = white4.center.y + 167
        white5.center.y = white5.center.y + 167
        white6.center.y = white6.center.y + 167
        white7.center.y = white7.center.y + 167
        white8.center.y = white8.center.y + 167
        white9.center.y = white9.center.y + 167
        white10.center.y = white10.center.y + 167
        white11.center.y = white11.center.y + 167
        white12.center.y = white12.center.y + 167
        white13.center.y = white13.center.y + 167
        white14.center.y = white14.center.y + 167
        white15.center.y = white15.center.y + 167
        
        
        
        black5.center.y = black5.center.y + 167
         black4.center.y = black4.center.y + 167
         black3.center.y = black3.center.y + 167
        black2.center.y = black2.center.y + 167
        black1.center.y = black1.center.y + 167
        
        if black5.center.y >= 751 {
            black5.center.y = -84
             white13.center.y = -84
             white14.center.y = -84
             white15.center.y = -84
            randomPlacement5()
        }
        if black4.center.y >= 751 {
            black4.center.y = -84
             white10.center.y = -84
             white11.center.y = -84
             white12.center.y = -84
            randomPlacement4()
            
        }
        if black3.center.y >= 751 {
            black3.center.y = -84
             white7.center.y = -84
             white8.center.y = -84
             white9.center.y = -84
            randomPlacement3()
        }
        if black2.center.y >= 751 {
            black2.center.y = -84
             white4.center.y = -84
             white5.center.y = -84
             white6.center.y = -84
            randomPlacement2()
        }
        if black1.center.y >= 751 {
            black1.center.y = -84
            white1.center.y = -84
             white2.center.y = -84
             white3.center.y = -84
             randomPlacement1()
        }
        
        print(black1.center.y)
        
        print(black2.center.y)
        print(black3.center.y)
        print(black4.center.y)
        print(black5.center.y)
        print("****")
       
        
    }
    @objc func pauseMusic(){
        print("1")
        audioPlayer.pause()
    }

    func randomPlacement1(){
        let randomNumber = arc4random() % 4
        switch randomNumber {
        case 0:
            black1.center.x = 46.5
            white1.center.x = 140.5
            white2.center.x = 234.5
            white3.center.x = 328.5
            break
        case 1 :
            white1.center.x = 46.5
            black1.center.x = 140.5
            white2.center.x = 234.5
            white3.center.x = 328.5
            break
        case 2 :
            white1.center.x = 46.5
            white2.center.x = 140.5
            black1.center.x = 234.5
            white3.center.x = 328.5
            break
            
        case 3 :
            white1.center.x = 46.5
            white2.center.x = 140.5
            white3.center.x = 234.5
            black1.center.x = 328.5
            break
        default:
            break
        }
    }
    func randomPlacement2(){
        let randomNumber = arc4random() % 4
        switch randomNumber {
        case 0:
            black2.center.x = 46.5
            white4.center.x = 140.5
            white5.center.x = 234.5
            white6.center.x = 328.5
            break
        case 1 :
            white4.center.x = 46.5
            black2.center.x = 140.5
            white5.center.x = 234.5
            white6.center.x = 328.5
            break
        case 2 :
            white4.center.x = 46.5
            white5.center.x = 140.5
            black2.center.x = 234.5
            white6.center.x = 328.5
            break
            
        case 3 :
            white4.center.x = 46.5
            white5.center.x = 140.5
            white6.center.x = 234.5
            black2.center.x = 328.5
            break
        default:
            break
        }
    }
    func randomPlacement3(){
        let randomNumber = arc4random() % 4
        switch randomNumber {
        case 0:
            black3.center.x = 46.5
            white7.center.x = 140.5
            white8.center.x = 234.5
            white9.center.x = 328.5
            break
        case 1 :
            white7.center.x = 46.5
            black3.center.x = 140.5
            white8.center.x = 234.5
            white9.center.x = 328.5
            break
        case 2 :
            white7.center.x = 46.5
            white8.center.x = 140.5
            black3.center.x = 234.5
            white9.center.x = 328.5
            break
            
        case 3 :
            white7.center.x = 46.5
            white8.center.x = 140.5
            white9.center.x = 234.5
            black3.center.x = 328.5
            break
        default:
            break
        }
    }
    func randomPlacement4(){
        let randomNumber = arc4random() % 4
        switch randomNumber {
        case 0:
            black4.center.x = 46.5
            white10.center.x = 140.5
            white11.center.x = 234.5
            white12.center.x = 328.5
            break
        case 1 :
            white10.center.x = 46.5
            black4.center.x = 140.5
            white11.center.x = 234.5
            white12.center.x = 328.5
            break
        case 2 :
            white10.center.x = 46.5
            white11.center.x = 140.5
            black4.center.x = 234.5
            white12.center.x = 328.5
            break
            
        case 3 :
            white10.center.x = 46.5
            white11.center.x = 140.5
            white12.center.x = 234.5
            black4.center.x = 328.5
            break
        default:
            break
        }
    }
    func randomPlacement5(){
        let randomNumber = arc4random() % 4
        switch randomNumber {
        case 0:
            black5.center.x = 46.5
            white13.center.x = 140.5
            white14.center.x = 234.5
            white15.center.x = 328.5
            break
        case 1 :
            white13.center.x = 46.5
            black5.center.x = 140.5
            white14.center.x = 234.5
            white15.center.x = 328.5
            break
        case 2 :
            white13.center.x = 46.5
            white14.center.x = 140.5
            black5.center.x = 234.5
            white15.center.x = 328.5
            break
            
        case 3 :
            white13.center.x = 46.5
            white14.center.x = 140.5
            white15.center.x = 234.5
            black5.center.x = 328.5
            break
        default:
            break
        }
    }

  

}
