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
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .lightGray
        tableView.separatorStyle = .none
        
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier:NSStringFromClass(RepositoryCell.self), for: indexPath) as! RepositoryCell
        cell.setUpCell(repository: repositories[indexPath.row])
        return cell
    }
}

