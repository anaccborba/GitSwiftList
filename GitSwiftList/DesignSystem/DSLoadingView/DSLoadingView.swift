//
//  DSLoadingView.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 17/01/25.
//

import Lottie
import SnapKit
import UIKit

class DSLoadingView: UIView {
    
    private enum Constants {
        static let screenWidth = UIScreen.main.bounds.size.width
        static let screenHeight = UIScreen.main.bounds.size.height
    
        static let animationFrameX = (screenWidth - CGFloat.defaultAnimationSize)/2
        static let animationFrameY = (screenHeight - CGFloat.defaultAnimationSize)/2

    }
    
    private lazy var animationView: LottieAnimationView = {
        let lottieAnimationView: LottieAnimationView
        lottieAnimationView = .init(name: "LoadingAnimation")
        lottieAnimationView.frame = CGRect(x: Constants.animationFrameX, y: Constants.animationFrameY, width: CGFloat.defaultAnimationSize, height: CGFloat.defaultAnimationSize)
        lottieAnimationView.animationSpeed = 1
        lottieAnimationView.loopMode = .loop
        lottieAnimationView.translatesAutoresizingMaskIntoConstraints = false
        
        return lottieAnimationView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setUpViewCode()
        animationView.play()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
}

extension DSLoadingView: DSViewCodeProtocol {
    func setUpHierarchy() {
        addSubview(animationView)
    }
    
    func setUpConstrainsts() {
        animationView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.width.equalTo(CGFloat.defaultAnimationSize)
        }
    }
}



