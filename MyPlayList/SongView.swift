//
//  SongView.swift
//  MyPlayList
//
//  Created by attaporn on 2/18/24.
//

import SwiftUI
import AVFoundation

struct SongView: View {
    //ตัวแปรที่จะรับมาจากหนา้ MainListView
    var mySong : SongInformation
    
    // play music agent
    @State var audioPlayer : AVAudioPlayer? //??
    
    @State var isStart = false //??
    @State var isPause = false //??
    @State var pauseTime = 0.0 //??
    
    var body: some View { // open-view
        VStack{ //open-vstack
            
            //represent-img
            Image(uiImage: UIImage(named:"\(self.mySong.artistImage)")!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(5)
            
            // represent-artisName
            Text("\(self.mySong.artistName)")
            
            HStack { // open-hstack
                
                // represent-play-button
                Button(action: {
                    let songPath = Bundle.main.path(forResource: self.mySong.songFileName, ofType: "mp3")
                    let songURL = URL(fileURLWithPath: songPath!)
                    
                    if(!isStart){
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: songURL)
                        self.audioPlayer?.prepareToPlay()
                        self.audioPlayer?.numberOfLoops = -1
                        self.audioPlayer?.play()
                        
                        self.isStart.toggle()
                    } else {
                        
                        if(isPause){
                            self.audioPlayer?.play()
                            self.isPause.toggle()
                        } else{
                            self.audioPlayer?.pause()
                            self.isPause.toggle()
                        }
                        
                    }
                 }) {
                     Image(systemName: (!isStart || isPause) ?   "play.circle" : "pause.circle" )
                         .font(.system(size: 75))
                         .foregroundColor(.blue)
                 }
                
                
                // represent-stop-button
                Button(action: {
                    self.audioPlayer?.stop()
                    self.isStart.toggle()
                }) {
                    Image(systemName: "stop.circle")
                        .font(.system(size: 75))
                        .foregroundColor(.red)
                }
                
            } // close-HStack
            .padding(.top, 10)
            
        } // close-vstack
        .navigationTitle("\(self.mySong.songName)")
    } // close-view
}

struct SongView_Previews: PreviewProvider {

    static var previews: some View {
        SongView(mySong: SongInformation(songName: "เพลงทดสอบ", songFileName: "1", artistName: "test artise", artistImage: "1.png"))
    }
}
