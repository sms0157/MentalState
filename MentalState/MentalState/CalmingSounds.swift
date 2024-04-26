//
//  CalmingSounds.swift
//  MentalState
//
//  Created by Sabrina Summerfield on 4/17/24.
//

import SwiftUI
import AVFAudio

struct CalmingSounds: View {
    @State private var player: AVAudioPlayer?
    @State private var selectedSound: String = "Soft Rain"
    
    let soundNames = ["Soft Rain", "Birds on a Windy Day", "Nighttime Crickets", "City Traffic", "Lo-Fi Beats"]
    
    var body: some View {
        
        ZStack {
            Image("calming_sounds_image")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack {
                Picker(selection: $selectedSound, label: Text("")) {
                    ForEach(soundNames, id: \.self) {
                        Text($0)
                    }
                }
                .padding()
                
                HStack {
                    
                    Button(action: {
                        self.playSound()
                    }) {
                        Text(Image(systemName: "play.fill"))
                    }
                    
                    
                    Button(action: {
                        self.pauseSound()
                    }) {
                        Text(Image(systemName: "pause.fill"))
                    }
                }
                Spacer()
                    .frame(height: 200)
            }
        }
    }
    
    
    func playSound() {
        guard let soundURL = Bundle.main.url(forResource: selectedSound, withExtension: "mp3") else {
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: soundURL)
        } catch {
            print("Failed to load the sound: \(error)")
        }
        player?.play()
    }
    
    func pauseSound() {
        player?.pause()
    }
    
}

    

#Preview {
    CalmingSounds()
}
