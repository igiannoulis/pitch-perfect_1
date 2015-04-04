//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Hlias Giannoulis on 3/18/15.
//  Copyright (c) 2015 Hlias Giannoulis. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    var audioPlayer : AVAudioPlayer!
    var receivedAudio : RecordedAudio!
    var audioEngine:AVAudioEngine!
    var audioFile:AVAudioFile!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        audioPlayer = AVAudioPlayer(contentsOfURL:receivedAudio.filePathURL, error: nil)
        audioPlayer.enableRate = true
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: receivedAudio.filePathURL, error: nil)
        
    }
    
    func audiofunctions()
    {
        audioPlayer.stop()
        audioEngine.reset()
        audioPlayer.currentTime=0.0
        audioPlayer.play()
        
    }
    
    
    // Function in order to decrease the speed rate of recorded audio
    
    @IBAction func playSlowAudio(sender: UIButton) {
        
        audiofunctions()
        audioPlayer.rate=0.5
       
    }
    
    // Function in order to increase the speed rate of recorded audio

    @IBAction func playFastAudio(sender: UIButton) {
        
        audiofunctions()
        audioPlayer.rate=1.5
       
    }
    
    
    // Chipmunk effect is applied to the recorded voice  according to function below
    @IBAction func playChipmunkAudio(sender: UIButton) {
        playAudioWithVariablePitch(1000)
    }
    
    
    // Darth Vader effect is applied to the recorded voice  according to function below
    @IBAction func playDarthvaderAudio(sender: UIButton) {
        playAudioWithVariablePitch(-1000)
        
    }
    
    // Function is order to add pitch in recorded sounds
    func playAudioWithVariablePitch(pitch: Float){
    audioPlayer.stop()
    audioEngine.stop()
    audioEngine.reset()
    
    var audioPlayerNode = AVAudioPlayerNode()
    audioEngine.attachNode(audioPlayerNode)
    
    var changePitchEffect = AVAudioUnitTimePitch()
    changePitchEffect.pitch = pitch
    audioEngine.attachNode(changePitchEffect)
    
    audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
    audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
    
    audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
    audioEngine.startAndReturnError(nil)
    
    audioPlayerNode.play()
        
    }
    
    
    
    @IBAction func stopButton(sender: UIButton) {
        audioPlayer.stop()
        audioEngine.stop()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
