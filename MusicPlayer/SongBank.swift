//
//  SongBank.swift
//  MusicPlayer
//
//  Created by Akhil Surendran on 27/10/22.
//

import Foundation

class SongBank{
    
    var list = [Initialize]()
    init(){
        
        list.append(Initialize(simage: "bheeshma", stitle: "Parudeesa", ssub: "Bheeshma parvam,Amal Neerad, Sushin Shyam", ssong: "bheeshmasong"))
        list.append(Initialize(simage: "HridayamPic", stitle: "Puthiyoru Lokham", ssub: "Hridayam, Vineeth Sreenivasan , Hesham Abdul ahad", ssong: "hridayamsong"))
        list.append(Initialize(simage: "Varathanpic", stitle: "Puthiyoru Paathayil", ssub: "Varathan, Amal Neerad, Sushin Shyam", ssong: "varathansong"))
    }
    
}


