//
//  ViewController.swift
//  rm_cpr
//
//  Created by Ricardo Aguilar on 07/12/23.
//

import UIKit
import AVFoundation

var volOn = true
var disclaimer = true
var player: AVAudioPlayer?
var player2: AVAudioPlayer?
var cyclecount = 1

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class ViewController0: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
    }
    @IBAction func clickback(_ sender: UIButton) {
        if (disclaimer == true){
            disclaimer = false
            //createPlayer(fname: "conc3")
            //player?.play()
            //dismiss(animated: true)
            self.text1.text=""
            self.text2.text="Turn up your phone volume!"
            self.text2.font = .systemFont(ofSize: 60)
            self.text2.textAlignment = .center
            self.text3.text=""
        }
        else {
            dismiss(animated: true)
        }
        
    }
    
    @IBOutlet weak var text1: UILabel!
    @IBOutlet weak var text2: UITextView!
    @IBOutlet weak var text3: UILabel!
    
}

class ViewController1: UIViewController { //completely done
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.disclaimerButton.sendActions(for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (disclaimer == false){
            //player?.stop()
            //createPlayer(fname: "conc3")
            //player?.play()
        }
        
    }

    @IBAction func volonoff(_ sender: UIBarButtonItem) { superOnOff(s:sender)}
    @IBOutlet weak var disclaimerButton: UIButton!
    
}

class ViewController2: UIViewController { //completely done
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPlayer(fname: "wakeup_audio")
        
        if (volOn){player?.play()}
        else{ navigationItem.rightBarButtonItem?.image = UIImage(systemName: "volume.slash")}
        
        gifview.image = UIImage.gifImageWithData(NSDataAsset(name: "wakupgif")!.data)
        //gifview.image = insertGif
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        player?.stop()
        createPlayer(fname: "wakeup_audio")
        if (volOn){player?.play()}
        else{ navigationItem.rightBarButtonItem?.image = UIImage(systemName: "volume.slash")}
        
    }

    @IBAction func volonoff(_ sender: UIBarButtonItem) { superOnOff(s:sender)}
    @IBOutlet weak var gifview: UIImageView!
    
}


class ViewController3: UIViewController { //completely done
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPlayer(fname: "breathingcheck_audio")
        
        if (volOn){player?.play()}
        else{ navigationItem.rightBarButtonItem?.image = UIImage(systemName: "volume.slash")}
        
        gifview.image = UIImage.gifImageWithData(NSDataAsset(name: "checkbreathing2")!.data)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        player?.stop()
        createPlayer(fname: "breathingcheck_audio")
        if (volOn){player?.play()}
        else{ navigationItem.rightBarButtonItem?.image = UIImage(systemName: "volume.slash")}
        
    }

    @IBAction func volonoff(_ sender: UIBarButtonItem) { superOnOff(s:sender)}
    @IBOutlet weak var gifview: UIImageView!
    
}

class ViewController4: UIViewController { //completely done
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPlayer(fname: "needcpr_audio")
        
        if (volOn){player?.play()}
        else{ navigationItem.rightBarButtonItem?.image = UIImage(systemName: "volume.slash")}
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        player?.stop()
        createPlayer(fname: "needcpr_audio")
        if (volOn){player?.play()}
        else{ navigationItem.rightBarButtonItem?.image = UIImage(systemName: "volume.slash")}
        
    }
    
    @IBAction func volonoff(_ sender: UIBarButtonItem) { superOnOff(s:sender)}
    @IBAction func call911(_ sender: UIButton) {
        dialNumber(number: "911")
    }
    
}

class ViewController5: UIViewController { //Completely done
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPlayer(fname: "compressinstruct_audio")
        
        if (volOn){player?.play()}
        else{ navigationItem.rightBarButtonItem?.image = UIImage(systemName: "volume.slash")}
        
        //gifview.image = UIImage.gifImageWithData(NSDataAsset(name: "moon")!.data)
        
        self.workItem = DispatchWorkItem{
           self.nextButton.sendActions(for: .touchUpInside)
       }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 8.3, execute:self.workItem!)
    }

    @IBAction func canceltimer(_ sender: Any) {
        self.workItem!.cancel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        player?.stop()
        createPlayer(fname: "compressinstruct_audio")
        if (volOn){player?.play()}
        else{ navigationItem.rightBarButtonItem?.image = UIImage(systemName: "volume.slash")}
        
    }
    
    @IBAction func volonoff(_ sender: UIBarButtonItem) { superOnOff(s:sender)}
    
    var workItem: DispatchWorkItem?

    @IBOutlet weak var gifview: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
}

class ViewController6: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPlayer(fname: "beep")
        createPlayer2(fname: "beep")
        switch cyclecount {
        case 1:
            createPlayer2(fname: "cycle1")
        case 2:
            createPlayer2(fname: "cycle2")
        case 3:
            createPlayer2(fname: "cycle3")
        case 4:
            createPlayer2(fname: "cycle4")
        default:
            ()
        }
        
        
        
        navigationItem.rightBarButtonItem = nil
        var runCount = 0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
                player2?.play()
                switch cyclecount {
                case 1:
                    self.tiredText.text = "You will be repeating this pattern until help arrives."
                case 2:
                    self.tiredText.text = "Good job. You are saving this person. Keep going."
                case 3:
                    self.tiredText.text = "You may be getting tired, but keep going. Call out for others to help."
                case 4:
                    self.tiredText.text = "If you are tired, have someone take over. They can use your app."
                default:
                    ()
                }
                
            }
            
            Timer.scheduledTimer(withTimeInterval: 0.6, repeats: true) { timer in
                runCount += 1
                self.timerText.text = "Compressions: "+String(runCount)+"/30"
                player?.pause()
                player?.currentTime = 0
                player?.play()
                
                if runCount == 31 {
                    timer.invalidate()
                    self.nextButton.sendActions(for: .touchUpInside)
                }
            }
            
        }
        gifview.image = UIImage.gifImageWithData(NSDataAsset(name: "compressions2b")!.data)
        
        self.navigationItem.hidesBackButton = true
        
    }
    
    @IBOutlet weak var gifview: UIImageView!
    @IBOutlet weak var timerText: UILabel!
    @IBOutlet weak var tiredText: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
}


class ViewController7: UIViewController { //completely done
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPlayer(fname: "breaths_audio")
        
        if (volOn){player?.play()}
        else{ navigationItem.rightBarButtonItem?.image = UIImage(systemName: "volume.slash")}
        
        gifview.image = UIImage.gifImageWithData(NSDataAsset(name: "cprbreathsgif2")!.data)
        
        self.navigationItem.hidesBackButton = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        player?.stop()
        createPlayer(fname: "breaths_audio")
        if (volOn){player?.play()}
        else{ navigationItem.rightBarButtonItem?.image = UIImage(systemName: "volume.slash")}
        
    }

    @IBAction func volonoff(_ sender: UIBarButtonItem) { superOnOff(s:sender)}
    @IBOutlet weak var gifview: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func backornext(_ sender: UIButton) {
        if cyclecount < 4 {
            cyclecount += 1
            self.backButton.sendActions(for: .touchUpInside)
        }
        else {
            cyclecount = 1
            self.nextButton.sendActions(for: .touchUpInside)
        }
    }
    
}

class ViewController8: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPlayer(fname: "postcycleinstructions_audio")
        
        if (volOn){player?.play()}
        else{ navigationItem.rightBarButtonItem?.image = UIImage(systemName: "volume.slash")}
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        player?.stop()
        createPlayer(fname: "postcycleinstructions_audio")
        if (volOn){player?.play()}
        else{ navigationItem.rightBarButtonItem?.image = UIImage(systemName: "volume.slash")}
        
    }

    @IBAction func volonoff(_ sender: UIBarButtonItem) { superOnOff(s:sender)}
    
}

class ViewController9: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPlayer(fname: "assessment_audio")
        
        if (volOn){player?.play()}
        else{ navigationItem.rightBarButtonItem?.image = UIImage(systemName: "volume.slash")}
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        player?.stop()
        createPlayer(fname: "assessment_audio")
        if (volOn){player?.play()}
        else{ navigationItem.rightBarButtonItem?.image = UIImage(systemName: "volume.slash")}
        
    }

    @IBAction func volonoff(_ sender: UIBarButtonItem) { superOnOff(s:sender)}
    
}

class ViewController10: UIViewController { //completely done
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPlayer(fname: "narcan_audio")
        
        if (volOn){player?.play()}
        else{ navigationItem.rightBarButtonItem?.image = UIImage(systemName: "volume.slash")}
        
        gifview.image = UIImage.gifImageWithData(NSDataAsset(name: "narcangif2")!.data)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        player?.stop()
        createPlayer(fname: "narcan_audio")
        if (volOn){player?.play()}
        else{ navigationItem.rightBarButtonItem?.image = UIImage(systemName: "volume.slash")}
        
    }

    @IBAction func volonoff(_ sender: UIBarButtonItem) { superOnOff(s:sender)}
    @IBOutlet weak var gifview: UIImageView!
    
}

class ViewController11: UIViewController { //completely done
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPlayer(fname: "aed_audio")
        
        if (volOn){player?.play()}
        else{ navigationItem.rightBarButtonItem?.image = UIImage(systemName: "volume.slash")}
        
        //gifview.image = UIImage.gifImageWithData(NSDataAsset(name: "moon")!.data)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        player?.stop()
        createPlayer(fname: "aed_audio")
        if (volOn){player?.play()}
        else{ navigationItem.rightBarButtonItem?.image = UIImage(systemName: "volume.slash")}
        
    }

    @IBAction func volonoff(_ sender: UIBarButtonItem) { superOnOff(s:sender)}
    @IBOutlet weak var gifview: UIImageView!
    
}

class ViewControllerB1: UIViewController { //completely done
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPlayer(fname: "choking3")
        
        if (volOn){player?.play()}
        else{ navigationItem.rightBarButtonItem?.image = UIImage(systemName: "volume.slash")}
        
        gifview.image = UIImage.gifImageWithData(NSDataAsset(name: "chokinggif2")!.data)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        player?.stop()
        createPlayer(fname: "choking3")
        if (volOn){player?.play()}
        else{ navigationItem.rightBarButtonItem?.image = UIImage(systemName: "volume.slash")}
        
    }

    @IBAction func volonoff(_ sender: UIBarButtonItem) { superOnOff(s:sender)}
    @IBOutlet weak var gifview: UIImageView!
    
}

class ViewControllerB2: UIViewController { //completely done
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPlayer(fname: "recoverypos_audio")
        
        if (volOn){player?.play()}
        else{ navigationItem.rightBarButtonItem?.image = UIImage(systemName: "volume.slash")}
        
        gifview.image = UIImage.gifImageWithData(NSDataAsset(name: "recoverygif")!.data)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        player?.stop()
        createPlayer(fname: "recoverypos_audio")
        if (volOn){player?.play()}
        else{ navigationItem.rightBarButtonItem?.image = UIImage(systemName: "volume.slash")}
        
    }

    @IBAction func volonoff(_ sender: UIBarButtonItem) { superOnOff(s:sender)}
    @IBAction func call911(_ sender: UIButton) {
        dialNumber(number: "+911")
    }
    @IBOutlet weak var gifview: UIImageView!
    
}


//========================================================

func createPlayer(fname:String) {
    if let av = NSDataAsset(name:fname) {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(data: av.data)
            player?.setVolume(1.0, fadeDuration: 0.0)
            
        }
        catch _ as NSError { print ("error") }
    }
    
    let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.overrideOutputAudioPort(AVAudioSession.PortOverride.speaker)
        }
        catch _ as NSError { print ("error") }
    
    
}

func createPlayer2(fname:String) {
    if let av = NSDataAsset(name:fname) {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player2 = try AVAudioPlayer(data: av.data)
            player2?.setVolume(1.0, fadeDuration: 0.0)
            
        }
        catch _ as NSError { print ("error") }
    }
    
    let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.overrideOutputAudioPort(AVAudioSession.PortOverride.speaker)
        }
        catch _ as NSError { print ("error") }
    
    
}

func superOnOff(s:UIBarButtonItem){
    if volOn {
        s.image = UIImage(systemName: "volume.slash")
        volOn = false
        player?.pause()
    }
    else {
        s.image = UIImage(systemName: "volume.3")
        volOn = true
        player?.currentTime = 0
        player?.play()
    }
}

func dialNumber(number : String) {

 if let url = URL(string: "tel://\(number)"),
   UIApplication.shared.canOpenURL(url) {
      if #available(iOS 10, *) {
        UIApplication.shared.open(url, options: [:], completionHandler:nil)
       } else {
           UIApplication.shared.openURL(url)
       }
   } else {}
}

