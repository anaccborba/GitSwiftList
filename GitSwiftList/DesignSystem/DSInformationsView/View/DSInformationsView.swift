//
//  DSInformationsView.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 17/01/25.
//

import UIKit

class DSInformationsView: UIView {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.spacing = CGFloat.smallMargin
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        let fontSize: CGFloat = 16
        label.font = UIFont.systemFont(ofSize: fontSize, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        let fontSize: CGFloat = 14
        label.font = UIFont.systemFont(ofSize: fontSize, weight: .light)
        label.textColor = .gray
        label.numberOfLines = 2
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
    
    public func bindView(information: DSInformation) {
        self.titleLabel.text = information.title
        self.descriptionLabel.text = information.description
    }
}

extension DSInformationsView: DSViewCodeProtocol {
    func setUpHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
    }
    
    func setUpConstrainsts() {
        stackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

