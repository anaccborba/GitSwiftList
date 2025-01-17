//
//  RepositoryInteractionsView.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 17/01/25.
//

import UIKit

class RepositoryInteractionsView: UIView {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var forkIconItemView: DSIconItemView = {
        let iconItemView = DSIconItemView()
        
        return iconItemView
    }()
    
    private lazy var starsIconItemView: DSIconItemView = {
        let iconItemView = DSIconItemView()
        
        return iconItemView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViewCode()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    public func bindView(forksItem: DSIconItem, starsItem: DSIconItem) {
        let forksIconItem = DSIconItem(icon: starsItem.icon, text: starsItem.text)
        forkIconItemView.bindView(forksIconItem)
        
        let starsIconItem = DSIconItem(icon: forksItem.icon, text: forksItem.text)
        starsIconItemView.bindView(starsIconItem)
    }
    
}

extension RepositoryInteractionsView: DSViewCodeProtocol {
    func setUpHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubview(forkIconItemView)
        stackView.addArrangedSubview(starsIconItemView)
    }
    
    func setUpConstrainsts() {
        stackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

