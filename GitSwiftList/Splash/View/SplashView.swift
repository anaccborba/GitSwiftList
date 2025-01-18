//
//  SplashView.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 17/01/25.
//

import Lottie
import SnapKit
import UIKit

final class SplashView: UIView {
    
    private enum Constants {
        static let screenWidth = UIScreen.main.bounds.size.width
        static let screenHeight = UIScreen.main.bounds.size.height

        static let animationFrameX = (screenWidth - CGFloat.defaultAnimationSize)/2
        static let animationFrameY = (screenHeight - CGFloat.defaultAnimationSize)/2
    }
    
    private lazy var animationView: LottieAnimationView = {
        let lottieAnimationView: LottieAnimationView
        lottieAnimationView = .init(name: "SplashAnimation")
        lottieAnimationView.frame = CGRect(x: Constants.animationFrameX, y: Constants.animationFrameY, width: CGFloat.defaultAnimationSize, height: CGFloat.defaultAnimationSize)
        lottieAnimationView.animationSpeed = 2.5
        lottieAnimationView.loopMode = .loop
        lottieAnimationView.translatesAutoresizingMaskIntoConstraints = false
        
        return lottieAnimationView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("splashTitle", comment: "Localizable")
        let fontSize: CGFloat = 20
        label.font = UIFont.systemFont(ofSize: fontSize, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("splashDescription", comment: "Localizable")
        let fontSize: CGFloat = 16
        label.font = UIFont.systemFont(ofSize: fontSize, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightYellow
        setUpViewCode()
        animationView.play()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
}

extension SplashView: DSViewCodeProtocol {
    func setUpHierarchy() {
        addSubview(animationView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
    }
    
    func setUpConstrainsts() {
        animationView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.width.equalTo(CGFloat.defaultAnimationSize)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(animationView.snp.bottom).offset(CGFloat.smallMargin)
            make.centerX.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(CGFloat.smallMargin)
            make.centerX.equalToSuperview()
        }
    }
}

