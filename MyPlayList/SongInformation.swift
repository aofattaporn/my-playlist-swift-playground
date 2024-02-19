//
//  SongInformation.swift
//  MyPlayList
//
//  Created by attaporn on 2/18/24.
//

import UIKit

class SongInformation: NSObject {
    //ตัวแปรที่จะเก็บคา่ ขอ้ มูล SongInformation แตล่ ะ่ ชุด
    var songName : String
    var songFileName : String
    var artistName : String
    var artistImage : String
    
    //Initializer แบบที่มีการสง่ ผา่ น Parameter
    init(songName : String, songFileName : String, artistName : String,
         artistImage : String){
        self.songName = songName
        self.songFileName = songFileName
        self.artistName = artistName
        self.artistImage = artistImage
    }
    
    //Initializer แบบไมม่ ีการสง่ ผา่ น Parameter
    override init() {
        self.songName = ""
        self.songFileName = ""
        self.artistName = ""
        self.artistImage = ""
    }

}
