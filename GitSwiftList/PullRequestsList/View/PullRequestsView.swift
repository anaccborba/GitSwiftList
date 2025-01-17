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
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .lightGray
        tableView.separatorStyle = .none
        
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
}

extension PullRequestsView: DSViewCodeProtocol {
    func setUpHierarchy() {
        addSubview(tableView)
    }
    
    func setUpConstrainsts() {
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

extension PullRequestsView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pullRequests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier:NSStringFromClass(PullRequestCell.self), for: indexPath) as? PullRequestCell else { return UITableViewCell() }
        cell.setUpCell(pullRequest: pullRequests[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pullRequestCellTap?(pullRequests[indexPath.row])
    }
}


