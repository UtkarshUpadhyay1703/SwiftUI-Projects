//
//  SoundView.swift
//  StarWithMask
//
//  Created by admin on 8/30/23.
//

import SwiftUI
import AVKit

class SoundManager {
    static let instance = SoundManager()
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case birds
        case elevator
    }
    
    func playSound(sound: SoundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        do{
        player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        }
        catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
        
    }
}

struct SoundView: View {
    
    var body: some View {
        VStack(spacing: 40){
            Button("Play Birds Sound"){
                SoundManager.instance.playSound(sound: .birds)
            }
            Button("Play Elevator Sound"){
                SoundManager.instance.playSound(sound: .elevator)
            }
        }
    }
}

struct SoundView_Previews: PreviewProvider {
    static var previews: some View {
        SoundView()
    }
}
