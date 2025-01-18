//
//  RepositoriesView.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 17/01/25.
//

import UIKit
import SnapKit

final class RepositoriesView: UIView {
    
    private var repositories: [Repository] = []
    public var repositoryCellTap: ((Repository) -> Void)?
    public var reloadRepositories: (() -> Void)?
    
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .lightGray
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(RepositoryCell.self, forCellReuseIdentifier: NSStringFromClass(RepositoryCell.self))
        
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViewCode()
    }
    
   required init?(coder: NSCoder) {
        nil
    }
    
    public func bindView(repositories: [Repository]) {
        self.repositories = repositories
        tableView.reloadData()
    }
}

extension RepositoriesView: DSViewCodeProtocol {
    func setUpHierarchy() {
        addSubview(tableView)
    }
    
    func setUpConstrainsts() {
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

extension RepositoriesView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier:NSStringFromClass(RepositoryCell.self), for: indexPath) as? RepositoryCell else { return UITableViewCell() }
        cell.bindCell(repository: repositories[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        repositoryCellTap?(repositories[indexPath.row])
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentSizeHeight = scrollView.contentSize.height
        let contentOffset = scrollView.contentOffset.y
        let frameSizeHeight = scrollView.frame.size.height
        
        if contentSizeHeight - contentOffset <= frameSizeHeight {
            reloadRepositories?()
        }
    }
}

