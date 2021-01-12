//
//  HomeScreen.swift
//  LottieAnimations
//
//  Created by Зехниддин on 13/01/21.
//

import SwiftUI

struct HomeScreen: View {
    @State private var play = 0
    @State private var presentScreen = false
    
    var body: some View {
        
        LottieButton(filename: "start-button") {
            self.play += 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.9) {
                self.presentScreen = true
            }
        }
        .frame(width: 360, height: 240, alignment: .center)
        .padding(.horizontal, -70)
        .padding(.vertical, -80)
        .clipped()
        .sheet(isPresented: $presentScreen) {
            DetailScreen()
        }
    }
}

#if DEBUG
struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
#endif
