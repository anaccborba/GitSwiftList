//
//  DSPrimaryButtonView.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 17/01/25.
//

import UIKit

class DSPrimaryButtonView: UIView {
    
    var buttonTap: (() -> Void)?
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightBlue
        button.layer.cornerRadius = CGFloat.defaultButtonHeight/2
        button.setTitleColor(.white, for: .normal)
        let fontSize: CGFloat = 16
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: fontSize)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViewCode()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    public func bindView(title: String) {
        button.setTitle(title, for: .normal)
    }
    
    @objc private func buttonTapped() {
        buttonTap?()
    }
}

extension DSPrimaryButtonView: DSViewCodeProtocol {
    func setUpHierarchy() {
        addSubview(button)
    }
    
    func setUpConstrainsts() {
        button.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(CGFloat.defaultButtonHeight)
            make.width.equalTo(CGFloat.defaultButtonWidth)
        }
    }
}
