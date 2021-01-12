//
//  DetailScreen.swift
//  LottieAnimations
//
//  Created by Зехниддин on 13/01/21.
//

import SwiftUI

struct DetailScreen: View {
    @State private var play = 0
    
    var body: some View {
        LottieView(name: "facebook-logo-effect", play: $play)
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen()
    }
}
