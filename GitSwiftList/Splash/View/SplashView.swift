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
        static let screenHeight = UIScreen.main.bounds.size.width
        static let animationSize = 160
        static let animationFrameX = Int(screenWidth)/2 - animationSize/2
        static let animationFrameY = Int(screenHeight)/2 - animationSize/2
        
        static let spacing = 8
        
        static let splashTitle = "Git Swift List"
        static let splashDescription = "Seus repositórios Swift em um tap"
    }
    
    private lazy var animationView: LottieAnimationView = {
        let lottieAnimationView: LottieAnimationView
        lottieAnimationView = .init(name: "SplashAnimation")
        lottieAnimationView.frame = CGRect(x: Constants.animationFrameX  , y: Constants.animationFrameY , width: Constants.animationSize, height: Constants.animationSize)
        lottieAnimationView.animationSpeed = 2.5
        lottieAnimationView.loopMode = .loop
        lottieAnimationView.translatesAutoresizingMaskIntoConstraints = false
        
        return lottieAnimationView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.splashTitle
        let fontSize: CGFloat = 20
        label.font = UIFont.systemFont(ofSize: fontSize, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.splashDescription
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
            make.height.width.equalTo(Constants.animationSize)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(animationView.snp.bottom).offset(Constants.spacing)
            make.centerX.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(Constants.spacing)
            make.centerX.equalToSuperview()
        }
    }
}

