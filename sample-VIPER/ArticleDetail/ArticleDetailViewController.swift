//
//  ArticleDetailViewController.swift
//  sample-VIPER
//
//  Created by Yudai Fujioka on 2021/07/23.
//

import UIKit

final class ArticleDetailViewController: UIViewController {
    
    enum Row: String {
        case title
        case body
        
        static var rows: [Row] {
            return [.title, .body]
        }
    }
    
    var articleEntity: ArticleEntity!

    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension ArticleDetailViewController: UITableViewDelegate {
    
}

extension ArticleDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Row.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = Row.rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: row.rawValue, for: indexPath)
        
        if row == .title {
            cell.textLabel?.text = "タイトル"
            cell.detailTextLabel?.text = articleEntity.title
        }
        
        if row == .body {
            cell.textLabel?.text = articleEntity.body
            cell.detailTextLabel?.text = nil
        }
        return cell
    }
}
