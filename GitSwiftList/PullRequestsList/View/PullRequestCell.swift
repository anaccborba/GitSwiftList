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
        stackView.spacing = CGFloat.smallMargin
        stackView.backgroundColor = .white
        stackView.layoutMargins = UIEdgeInsets(top: CGFloat.mediumMargin, left: CGFloat.mediumMargin, bottom: CGFloat.mediumMargin, right: CGFloat.mediumMargin)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layer.cornerRadius = CGFloat.defaultStackViewCornerRadius
        
        return stackView
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let fontSize: CGFloat = 14
        label.font = UIFont.boldSystemFont(ofSize: fontSize)
        
        return label
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViewCode()
        self.backgroundColor = .clear
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    public func bindCell(pullRequest: PullRequest) {
        let profile = DSProfile(avatarUrl: pullRequest.user.avatarUrl, username: pullRequest.user.login, axis: .horizontal)
        authorView.bindView(profile)
        
        let information = DSInformation(title: pullRequest.title, description: pullRequest.body)
        informationsView.bindView(information: information)
        
        if let date = Date.convertTimestampString(pullRequest.date) {
            dateLabel.text = date.dateFormattedBR()
        }
    }
}

extension PullRequestCell: DSViewCodeProtocol {
    func setUpHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(informationsView)
        stackView.addArrangedSubview(authorView)
    }
    
    func setUpConstrainsts() {
        stackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(CGFloat.smallMargin)
            make.leading.equalToSuperview().offset(CGFloat.mediumMargin)
            make.trailing.equalToSuperview().inset(CGFloat.mediumMargin)
            make.bottom.equalToSuperview().inset(CGFloat.smallMargin)
        }
    }
}

