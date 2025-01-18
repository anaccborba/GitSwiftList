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
        stackView.axis = .horizontal
        stackView.backgroundColor = .white
        stackView.layoutMargins = UIEdgeInsets(top: CGFloat.mediumMargin, left: CGFloat.mediumMargin, bottom: CGFloat.mediumMargin, right: CGFloat.mediumMargin)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layer.cornerRadius = CGFloat.defaultStackViewCornerRadius
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var informationsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.spacing = CGFloat.smallMargin
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var authorView: DSProfileView = {
        let profileView = DSProfileView()
        profileView.translatesAutoresizingMaskIntoConstraints = false
        
        return profileView
    }()
    
    private lazy var informationsView: DSInformationsView = {
        let informationsView = DSInformationsView()
        informationsView.translatesAutoresizingMaskIntoConstraints = false
        
        return informationsView
    }()
    
    private lazy var interactionsView: RepositoryInteractionsView = {
        let interactionsView = RepositoryInteractionsView()
        interactionsView.translatesAutoresizingMaskIntoConstraints = false
        
        return interactionsView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViewCode()
        self.backgroundColor = .clear
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    public func bindCell(repository: Repository) {
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
            make.top.equalToSuperview().offset(CGFloat.smallMargin)
            make.leading.equalToSuperview().offset(CGFloat.mediumMargin)
            make.trailing.equalToSuperview().inset(CGFloat.mediumMargin)
            make.bottom.equalToSuperview().inset(CGFloat.smallMargin)
        }
    }
}
