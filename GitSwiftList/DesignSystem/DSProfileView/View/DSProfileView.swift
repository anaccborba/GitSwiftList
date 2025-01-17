//
//  DSProfileView.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 17/01/25.
//

import UIKit

class DSProfileView: UIView {
    
    private enum Constants {
        static let avatarSize = 50
    }
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        
        return stackView
    }()
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = CGFloat(Constants.avatarSize/2)
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleToFill
        if let placeholderImage = UIImage(named: "ProfileIcon") {
            imageView.image = placeholderImage
        }
        
        return imageView
    }()
    
    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        let fontSize: CGFloat = 14
        label.font = UIFont.boldSystemFont(ofSize: fontSize)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViewCode()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    public func bindView(_ profile: DSProfile) {
        usernameLabel.text = profile.username
        if let url = URL(string: profile.avatarUrl) {
            avatarImageView.load(url: url)
        }
        configureViewAxis(profile.axis)
    }
    
    private func configureViewAxis(_ axis: DSProfileViewAxis) {
        if axis == .horizontal {
            stackView.axis = .horizontal
        } else {
            stackView.axis = .vertical
        }
    }
}

extension DSProfileView: DSViewCodeProtocol {
    func setUpHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubview(avatarImageView)
        stackView.addArrangedSubview(usernameLabel)
    }
    
    func setUpConstrainsts() {
        stackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        avatarImageView.snp.makeConstraints { (make) in
            make.height.width.equalTo(Constants.avatarSize)
        }
    }
}

