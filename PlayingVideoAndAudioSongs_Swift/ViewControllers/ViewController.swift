//
//  ViewController.swift
//  PlayingVideoAndAudioSongs_Swift
//
//  Created by Admin on 16/07/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import MediaPlayer

class ViewController: UIViewController {
    var songPlayer = AVAudioPlayer()
    var songName = String()
     var hasBeenPaused = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareSongAndSession()
    }
    
    func prepareSongAndSession() {
        do {
            //7 - Insert the song from our Bundle into our AVAudioPlayer
            songPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: songName, ofType: "aiff")!))
            //8 - Prepare the song to be played
            songPlayer.prepareToPlay()
            
            //9 - Create an audio session
            let audioSession = AVAudioSession.sharedInstance()
            do {
                //10 - Set our session category to playback music
                try audioSession.setCategory(AVAudioSessionCategoryPlayback)
                //11 -
            } catch let sessionError {
                
                print(sessionError)
            }
            //12 -
        } catch let songPlayerError {
            print(songPlayerError)
        }
    }
    @IBAction func play(_ sender: Any) {
        //14
        songPlayer.play()
        songPlayer.numberOfLoops = 1
    
       
        
    }
    @IBAction func pause(_ sender: Any) {
        //16
        if songPlayer.isPlaying {
            songPlayer.pause()
            hasBeenPaused = true
        } else {
            hasBeenPaused = false
        }
        
    }
    
    @IBAction func nextButtonAction(_ sender: UIButton) {
        
    }
    
    @IBAction func previousbtnAction(_ sender: UIButton) {
    }
}

