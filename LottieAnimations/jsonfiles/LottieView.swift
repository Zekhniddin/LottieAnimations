//
//  LottieView.swift
//  LottieAnimations
//
//  Created by Зехниддин on 13/01/21.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    var name: String!
    @Binding var play:Int
    
    var animationView = AnimationView()

    class Coordinator: NSObject {
        var parent: LottieView
    
        init(_ animationView: LottieView) {
            self.parent = animationView
            super.init()
        }
    }

    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView()

        animationView.animation = Animation.named(name)
        animationView.contentMode = .scaleAspectFit
//        animationView.loopMode = .repeat(Float(self.play))
        animationView.loopMode = .loop

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)

        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        animationView.play()
    }
}


struct LottieButton: UIViewRepresentable {

    typealias UIViewType = UIView
    let animationView = AnimatedButton()
    let filename: String
    let action: () -> Void

    func makeUIView(context: UIViewRepresentableContext<LottieButton>) -> UIView {
        let view = UIView()

        let animation = Animation.named(filename)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)

        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
        ])

        return view
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieButton>) {

    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }


    class Coordinator: NSObject {
        let parent: LottieButton

        init(_ parent: LottieButton) {
            self.parent = parent
            super.init()
            parent.animationView.addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
        }

        // this function can be called anything, but it is best to make the names clear
        @objc func touchUpInside() {
            parent.action()
        }
    }
}
