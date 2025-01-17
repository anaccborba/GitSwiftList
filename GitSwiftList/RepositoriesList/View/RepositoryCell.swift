//
//  RepositoryCell.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 17/01/25.
//

import UIKit

class RepositoryCell: UITableViewCell {
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.axis = .horizontal
        stackView.backgroundColor = .white
        stackView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layer.cornerRadius = 20
        
        return stackView
    }()
    
    private lazy var informationsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.spacing = 8
        
        return stackView
    }()
    
    private lazy var authorView: DSProfileView = {
        let profileView = DSProfileView()
        
        return profileView
    }()
    
    private lazy var informationsView: DSInformationsView = {
        let informationsView = DSInformationsView()
        
        return informationsView
    }()
    
    private lazy var interactionsView: RepositoryInteractionsView = {
        let interactionsView = RepositoryInteractionsView()
        
        return interactionsView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViewCode()
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    public func setUpCell(repository: Repository) {
        let profile = DSProfile(avatarUrl: repository.owner.avatarUrl, username: repository.owner.login, axis: .vertical)
        authorView.bindView(profile)
        
        let information = DSInformation(title: repository.name, description: repository.description)
        informationsView.bindView(information: information)
        
        let forksItem = DSIconItem(icon: "ForkIcon", text: String(repository.forksCount))
        let starsItem = DSIconItem(icon: "StarIcon", text: String(repository.starsCount))
        interactionsView.bindView(forksItem: forksItem, starsItem: starsItem)
    }
}

extension RepositoryCell: DSViewCodeProtocol {
    func setUpHierarchy() {
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(informationsStackView)
        mainStackView.addArrangedSubview(authorView)
        informationsStackView.addArrangedSubview(informationsView)
        informationsStackView.addArrangedSubview(interactionsView)
    }
    
    func setUpConstrainsts() {
        mainStackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-8)
        }
    }
}
