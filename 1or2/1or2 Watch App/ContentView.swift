//
//  ContentView.swift
//  1or2 Watch App
//
//  Created by Micael Raste on 2.5.2023.
//

import SwiftUI
import CoreMotion

var resultText = ("")

struct ContentView: View {
    
    @State private var coinImage: Image = Image(systemName: "questionmark.circle")
    @State private var isCooldownActive = false
    
    let motionManager = CMMotionManager()
    
    var body: some View {
        VStack {
            coinImage
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text(resultText)
                .font(.caption)
                .frame(alignment: .center)
                .foregroundColor(.secondary)
                .padding()
            
            Text("Flick, or tap your watch, \nto flip the coin!")
                .scaledToFit()
                .font(.system(size:10))
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity,
                       minHeight: 25,
                       maxHeight: .infinity,
                       alignment: .center)
                .foregroundColor(.secondary)
        }
        .background(Color.gray.opacity(0.01))
        
        .onTapGesture {
            flipCoin()
        }
        
        .onAppear {
            // Check if accelerometer is available
            if motionManager.isAccelerometerAvailable {
                // Set the update interval to 60 Hz
                motionManager.accelerometerUpdateInterval = 1/60
                // Start updating accelerometer data
                motionManager.startAccelerometerUpdates(to: .main) { (data, error) in
                    if let acceleration = data?.acceleration {
                        // Calculate the magnitude of the acceleration vector
                        let magnitude = sqrt(pow(acceleration.x, 2) + pow(acceleration.y, 2) + pow(acceleration.z, 2))
                        // If the magnitude is greater than 1.5 and the cooldown is not active, simulate a coin flip
                        if magnitude > 2 && !self.isCooldownActive {
                            self.flipCoin()
                        }
                    }
                }
            }
        }
    }
    
    func flipCoin() {
        
        // Set the cooldown flag
        self.isCooldownActive = true
        
        // Set a brief delay to prevent spam
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
        
        // Randomly select heads or tails
        let coinSide = Bool.random() ? Image("heads") : Image("tails")
        // Update the coin image
        coinImage = coinSide
        
            if coinSide == Image("heads") {
                resultText = ("heads")
            }
            if coinSide == Image("tails") {
                resultText = ("tails")
            }
            self.isCooldownActive = false
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
