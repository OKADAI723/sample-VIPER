//
//  ArticleListViewController.swift
//  sample-VIPER
//
//  Created by Yudai Fujioka on 2021/07/23.
//

import UIKit

final class ArticleListViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private var articleEntities = [ArticleEntity]()
    
    private let CELL_ID = "CELL_ID"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
       
    }
}

extension ArticleListViewController : UITableViewDelegate {
    
}

extension ArticleListViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleEntities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath)
        cell.textLabel?.text = articleEntities[indexPath.row].title
        return cell
        
        
        
    }
}

extension ArticleListViewController: ArticleListViewProtocol {
    func ahowArticles(_ articleEntities: [ArticleEntity]) {
        <#code#>
    }
    
    func showEmpty() {
        <#code#>
    }
    
    func showError() {
        <#code#>
    }
}
