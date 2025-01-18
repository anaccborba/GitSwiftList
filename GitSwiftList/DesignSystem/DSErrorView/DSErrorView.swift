//
//  DSErrorView.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 17/01/25.
//

import UIKit

class DSErrorView: UIView {
    
    var tryAgainTap: (() -> Void)?
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        if let placeholderImage = UIImage(named: "WarningIcon") {
            imageView.image = placeholderImage
        }
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        let fontSize: CGFloat = 20
        label.font = UIFont.boldSystemFont(ofSize: fontSize)
        label.text = NSLocalizedString("errorTitle", comment: "Localizable")
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        let fontSize: CGFloat = 16
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.textColor = .gray
        label.textAlignment = .center
        label.numberOfLines = 2
        label.text = NSLocalizedString("errorDescription", comment: "Localizable")
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var tryAgainButton: DSPrimaryButtonView = {
        let button = DSPrimaryButtonView()
        button.bindView(title: NSLocalizedString("tryAgainButtonTitle", comment: "Localizable"))
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViewCode()
        configurePrymaryButtonAction()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    private func configurePrymaryButtonAction() {
        tryAgainButton.buttonTap = { [weak self] in
            self?.tryAgainTap?()
        }
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
            make.leading.equalToSuperview().offset(CGFloat.largeMargin)
            make.trailing.equalToSuperview().inset(CGFloat.largeMargin)
            make.height.equalTo(70 * 2)
        }
        
        imageView.snp.makeConstraints { (make) in
            make.height.width.equalTo(70)
        }
        
        tryAgainButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().inset(80)
            make.centerX.equalToSuperview()
        }
    }
}

