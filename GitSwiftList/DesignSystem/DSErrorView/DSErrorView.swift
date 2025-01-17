//
//  DSErrorView.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 17/01/25.
//

import UIKit

class DSErrorView: UIView {
    
    private enum Constants {
        static let iconSize = 70
        static let marginSize = 30
        static let tryAgainButtonWidth = 270
        static let tryAgainButtonHeight = 60
        
        static let errorTitle = "Ooops, algo deu errado"
        static let errorDescription = "Estamos passando por algumas instabilidades, tente novamente jajá"
        static let tryAgainButtonTitle = "Tentar novamente"
    }
    
    var tryAgainTap: (() -> Void)?
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        
        return stackView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        if let placeholderImage = UIImage(named: "WarningIcon") {
            imageView.image = placeholderImage
        }
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        let fontSize: CGFloat = 20
        label.font = UIFont.boldSystemFont(ofSize: fontSize)
        label.text = Constants.errorTitle
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        let fontSize: CGFloat = 16
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.textColor = .gray
        label.textAlignment = .center
        label.numberOfLines = 2
        label.text = Constants.errorDescription
        
        return label
    }()
    
    let tryAgainButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightBlue
        button.layer.cornerRadius = CGFloat(Constants.tryAgainButtonHeight/2)
        button.setTitleColor(.white, for: .normal)
        let fontSize: CGFloat = 16
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: fontSize)
        button.setTitle(Constants.tryAgainButtonTitle, for: .normal)
        
        button.addTarget(self, action: #selector(tryAgainTapped), for: .touchUpInside)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViewCode()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    @objc private func tryAgainTapped() {
        tryAgainTap?()
    }
}

extension DSErrorView: DSViewCodeProtocol {
    func setUpHierarchy() {
        addSubview(stackView)
        addSubview(tryAgainButton)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
    }
    
    func setUpConstrainsts() {
        stackView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(Constants.marginSize)
            make.trailing.equalToSuperview().offset(-Constants.marginSize)
            make.height.equalTo(Constants.iconSize * 2)
        }
        
        imageView.snp.makeConstraints { (make) in
            make.height.width.equalTo(Constants.iconSize)
        }
        
        tryAgainButton.snp.makeConstraints { (make) in
            make.height.equalTo(60)
            make.width.equalTo(278)
            make.bottom.equalToSuperview().offset(-80)
            make.centerX.equalToSuperview()
        }
    }
}

