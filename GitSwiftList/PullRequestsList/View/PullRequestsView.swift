//
//  PullRequestsView.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 17/01/25.
//

import UIKit
import SnapKit

final class PullRequestsView: UIView {
    
    private var pullRequests: [PullRequest] = []
    public var pullRequestCellTap: ((PullRequest) -> Void)?
    public var reloadPullRequests: (() -> Void)?
    
    private lazy var emptyPullRequestsLabel: UILabel = {
        let label = UILabel()
        let fontSize: CGFloat = 24
        label.font = UIFont.systemFont(ofSize: fontSize, weight: .light)
        label.text = NSLocalizedString("emptyPullRequests", comment: "Localizable")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .lightBlue
        label.isHidden = true
        
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .lightGray
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PullRequestCell.self, forCellReuseIdentifier: NSStringFromClass(PullRequestCell.self))
        
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViewCode()
    }
    
   required init?(coder: NSCoder) {
        nil
    }
    
    public func bindView(pullRequests: [PullRequest]) {
        self.pullRequests = pullRequests
        tableView.reloadData()
    }
    
    public func showEmptyState() {
        emptyPullRequestsLabel.isHidden = false
    }
}

extension PullRequestsView: DSViewCodeProtocol {
    func setUpHierarchy() {
        addSubview(tableView)
        addSubview(emptyPullRequestsLabel)
    }
    
    func setUpConstrainsts() {
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        emptyPullRequestsLabel.snp.makeConstraints { (make) in
            make.centerY.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(CGFloat.largeMargin)
            make.trailing.equalToSuperview().inset(CGFloat.largeMargin)
        }
    }
}

extension PullRequestsView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pullRequests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier:NSStringFromClass(PullRequestCell.self), for: indexPath) as? PullRequestCell else { return UITableViewCell() }
        cell.bindCell(pullRequest: pullRequests[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pullRequestCellTap?(pullRequests[indexPath.row])
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentSizeHeight = scrollView.contentSize.height
        let contentOffset = scrollView.contentOffset.y
        let frameSizeHeight = scrollView.frame.size.height
        
        if contentSizeHeight - contentOffset <= frameSizeHeight {
            reloadPullRequests?()
        }
    }
}


