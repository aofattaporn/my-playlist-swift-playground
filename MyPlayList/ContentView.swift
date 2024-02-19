//
//  ContentView.swift
//  MyPlayList
//
//  Created by attaporn on 2/18/24.
//

import SwiftUI

struct MainListView: View {
    
    //ตัวแปร State เพื่อทํางานรวมกับ List
    @State var mySongList : [SongInformation] = []
    
    func CreateSongList() -> Void {
        let mySong1 : SongInformation = SongInformation(songName: "ผิดที่สําคัญตัว", songFileName: "1", artistName: "พีทพล", artistImage: "1.png")
        
        let mySong2 : SongInformation = SongInformation(songName: "หน้าหนาวที่แล้ว", songFileName: "2", artistName: "ทอม Room39", artistImage: "2.png")
        
        let mySong3 : SongInformation = SongInformation(songName: "คนละชั้น", songFileName: "3", artistName: "เจา้ นาย", artistImage: "3.png")
        
        let mySong4 : SongInformation = SongInformation(songName: "อย่าให้ฉันฝันเก้อ", songFileName: "4", artistName: "ต๊อง วัตดิวัต", artistImage: "4.png")
        
        //ใสข่ อ้ มูลเพลงลงไปในอารเ์ รย์ mySongList
        mySongList.append(mySong1)
        mySongList.append(mySong2)
        mySongList.append(mySong3)
        mySongList.append(mySong4)
        
    }
    
    var body: some View {
        NavigationView{//เปิด NavigateView
            List{ // เปิด List
                ForEach(self.mySongList, id:\.self){ // เปิด for each
                    
                    // loop-on-NavigationLink
                    theSong in NavigationLink(destination: SongView(mySong: theSong)) { // open-NavLink
                        
                        // song-images
                        HStack(alignment: .center){ // opne-HStack
                            Image(uiImage: UIImage(named: "\(theSong.artistImage)")!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150, height: 75)
                                .cornerRadius(20)
                        } // close-HStack
                        
                        // song-informations
                        VStack(alignment: .leading) { //open-vstack
                            Text("\(theSong.songName)")
                            Text("\(theSong.artistName)")
                        } // close-vstack
                        
                    }// close-Navilink
                } // close-for-each
            }// close-List
            .listStyle(.plain)
            .navigationTitle("MyPlayList")
        } // ปิด NavigateView
        
        .onAppear { // open-onApear ???
            self.CreateSongList()
            
            // change-color-navbar and text navigation bar
            let navbar = UINavigationBarAppearance()
            navbar.configureWithOpaqueBackground()
            navbar.backgroundColor = .brown
            navbar.titleTextAttributes = [.foregroundColor: UIColor.white]
            navbar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            
            // defind apear navigation bar
            UINavigationBar.appearance().standardAppearance = navbar
            UINavigationBar.appearance().scrollEdgeAppearance = navbar
            UINavigationBar.appearance().barTintColor = .white
            UINavigationBar.appearance().tintColor = .white
            
            
        } // close-onApear
    }
}
    
    struct MainListView_Previews: PreviewProvider {
        static var previews: some View {
            MainListView()
        }
    }

