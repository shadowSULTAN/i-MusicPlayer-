//
//  Correspond.swift
//  MusicPlayer
//
//  Created by Akhil Surendran on 27/10/22.
//

import UIKit
import AVFoundation

class Correspond: UIViewController {

    var avPlayer = AVAudioPlayer()
    var bank = SongBank()
    
    
    public var s_img = "" ,s_tit = "" ,s_sub = "",song = "", count = 0

    @IBOutlet weak var slide: UISlider!
    @IBOutlet weak var change: UIButton!
    @IBOutlet weak var songimage: UIImageView!
    @IBOutlet weak var songtitle: UILabel!
    @IBOutlet weak var songsubs: UILabel!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        songimage.image = UIImage(named: s_img)
        songtitle.text = s_tit
        songsubs.text = s_sub
        
    }
    
    
    @IBAction func playpause(_ sender: UIButton) {
        print("clicked")
        
        change.setImage(UIImage(named: "pausefigma"), for: .normal)
       
        
        if avPlayer.isPlaying == true{
            avPlayer.pause()
            change.setImage(UIImage(named: "playfigma"), for: .normal)
        }
        else
        {
            guard let url = Bundle.main.url(forResource: song, withExtension: "mp3")
               else {
                  return
               }
               do {
                  avPlayer = try AVAudioPlayer(contentsOf: url)
                   slide.minimumValue = 0
                   slide.maximumValue = Float(avPlayer.duration)
                   avPlayer.play()
                   
               }
               catch {
               }
        }
        
    }
    
    @IBAction func prev(_ sender: Any) {
       
        change.setImage(UIImage(named: "playfigma"), for: .normal)
        slide.minimumValue = 0
        avPlayer.stop()
        if(count == 0)
        {
            count = bank.list.count-1
            print("\(count)")
            s_img = bank.list[count].s_image
            s_tit = bank.list[count].s_title
            s_sub = bank.list[count].s_sub
            song = bank.list[count].s_song
            viewDidLoad()
        }
        else
        {
       count = count - 1
        s_img = bank.list[count].s_image
        s_tit = bank.list[count].s_title
        s_sub = bank.list[count].s_sub
        song = bank.list[count].s_song
        viewDidLoad()
        }
    }
    
     @IBAction func next(_ sender: Any) {
          print("\(count)")
         change.setImage(UIImage(named: "playfigma"), for: .normal)
         slide.minimumValue = 0
         avPlayer.stop()
         if(count == bank.list.count-1){
             count = 0
             s_img = bank.list[count].s_image
             s_tit = bank.list[count].s_title
             s_sub = bank.list[count].s_sub
             song = bank.list[count].s_song
             viewDidLoad()
         }
         else{
          count = count + 1
          s_img = bank.list[count].s_image
          s_tit = bank.list[count].s_title
          s_sub = bank.list[count].s_sub
          song = bank.list[count].s_song
          viewDidLoad()
         }
         
     }
        
    @IBAction func sliding(_ sender: UISlider) {
        
        avPlayer.stop()
        avPlayer.currentTime = TimeInterval(slide.value)
       
        print("\((slide.maximumValue)/60)")
        avPlayer.prepareToPlay()
        avPlayer.play()
        
    }
    func playAtTime(value: Float){
        
        avPlayer.play(atTime: TimeInterval(value))
        
    }
    /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
