//
//  MenuController.swift
//  appokanenogakko
//
//  Created by mac user on 2019/05/19.
//  Copyright © 2019 mycompany. All rights reserved.
//

import UIKit

private let reuseIdentifer = "MenuOptionCell"

class MenuController: UIViewController {
    
    // MARK: - プロパティ
    
    var tableView: UITableView!
    var delegate: AbstractViewController?
    
    // MARK: - 初期表示
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    // MARK: - ハンドラー
    func configureTableView(){
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MenuOptionCell.self, forCellReuseIdentifier:reuseIdentifer)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .singleLine
        tableView.rowHeight = 60
        tableView.allowsSelection = true
        tableView.isScrollEnabled = false
        tableView.contentSize.height = 260
        tableView.bounds.size.height = 260
        view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 260)
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
}

extension MenuController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifer, for: indexPath) as! MenuOptionCell
        
        let menuOption = MenuOption(rawValue: indexPath.row)
        cell.descriptionLabel.text = menuOption?.description
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuOption = MenuOption(rawValue: indexPath.row)
        delegate?.handleMenuToggleImple(forMenuOption: menuOption)
    }
}
