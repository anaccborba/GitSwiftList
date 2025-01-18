//
//  DSIconItemView.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 17/01/25.
//

import UIKit

class DSIconItemView: UIView {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()
    
    private lazy var itemLabel: UILabel = {
        let label = UILabel()
        let fontSize: CGFloat = 14
        label.font = UIFont.boldSystemFont(ofSize: fontSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViewCode()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    public func bindView(_ iconItem: DSIconItem) {
        itemLabel.text = iconItem.text
        if let icon = UIImage(named: iconItem.icon) {
            iconImageView.image = icon
        }
    }
}

extension DSIconItemView: DSViewCodeProtocol {
    func setUpHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(itemLabel)
    }
    
    func setUpConstrainsts() {
        stackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints { (make) in
            make.height.width.equalTo(CGFloat.mediumMargin)
        }
    }
}

