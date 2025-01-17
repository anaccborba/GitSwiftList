//
//  PullRequestCell.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 17/01/25.
//

import UIKit

class PullRequestCell: UITableViewCell {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.backgroundColor = .white
        stackView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layer.cornerRadius = 20
        
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViewCode()
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    public func setUpCell(pullRequest: PullRequest) {
        let profile = DSProfile(avatarUrl: pullRequest.user.avatarUrl, username: pullRequest.user.login, axis: .horizontal)
        authorView.bindView(profile)
        
        let information = DSInformation(title: pullRequest.title, description: pullRequest.body)
        informationsView.bindView(information: information)
    }
}

extension PullRequestCell: DSViewCodeProtocol {
    func setUpHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubview(informationsView)
        stackView.addArrangedSubview(authorView)
    }
    
    func setUpConstrainsts() {
        stackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-8)
        }
    }
}

