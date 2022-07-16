//
//  Extensions.swift
//  TesteIOSV2-1
//
//  Created by Paulo Danilo Conceição Lima on 07/06/22.
//

import UIKit

public protocol Reusable: class {
    static var reuseID: String { get }
}

extension UITableViewCell: Reusable {}

extension UITableViewHeaderFooterView: Reusable {}

class CustomHeader: UITableViewHeaderFooterView {}

extension UITableView {
  
    func registerCell<T:Reusable>(reusable: T.Type) {
        register(reusable, forCellReuseIdentifier: reusable.reuseID)
    }
    
    func registerFooterHeader(reusable:  Reusable.Type) {
        register(reusable, forHeaderFooterViewReuseIdentifier: reusable.reuseID)
    }
}

public extension Reusable {
    static var reuseID: String { return "\(self)"}
}

class CustomCell: UITableViewCell {
    func configure(with model: String) {
        textLabel?.text = model
    }
}

class TableViewController: UITableViewController {
    let cells: [Reusable.Type] = [CustomCell.self]
    let headerFooters: [Reusable.Type] = [CustomHeader.self]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerCell(reusable: CustomCell.self)
        headerFooters.forEach(tableView.registerFooterHeader)
    }
}

extension UITableView {
    func dequeueCell<T>(at indexPath: IndexPath)  -> T where  T: UITableViewCell {
        
            guard let cell = dequeueReusableCell(withIdentifier: T.reuseID, for: indexPath) as? T else {
              fatalError("Unexpected ReusableCell Type for reuseID \(T.reuseID)")
            }
            return cell
      }

    func dequeueView<T>() -> T where  T: UITableViewHeaderFooterView {
        
            guard let cell = dequeueReusableHeaderFooterView(withIdentifier: T.reuseID) as? T else {
                fatalError("Unexpected ReusableView Type for reuseID \(T.reuseID)")
            }
            return cell
    }
}

extension UITableView {
 
    private func dequeueCell<T>(at indexPath: IndexPath)  -> T? where T: UITableViewCell {
        dequeueReusableCell(withIdentifier: T.reuseID, for: indexPath) as? T
    }
}

extension UITableViewCell {
    static func errorValue(with message: String) -> Self {
        assert(false, message)
        let cell = Self()
        cell.textLabel?.text = message
        return cell
    }
}
