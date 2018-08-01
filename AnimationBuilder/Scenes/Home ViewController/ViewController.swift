//
//  ViewController.swift
//  AnimationBuilder
//
//  Created by Soufian Hossam on 8/1/18.
//  Copyright © 2018 Soufian Hossam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    var examples: [String] = [ "Basic Animations",
                               "Combined Animations",
                               "Chained Animations" ]
    
    enum Keys: String {
        case cellID = "cell"
    }
    
    enum Segues: String {
        case basicAnimationSegue
        case combineAnimationsSegue
        case chainedAnimationSegue
    }
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return examples.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Keys.cellID.rawValue)!
        cell.textLabel?.text = examples[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: Segues.basicAnimationSegue.rawValue, sender: self)
        case 1:
            performSegue(withIdentifier: Segues.combineAnimationsSegue.rawValue, sender: self)
        case 2:
            performSegue(withIdentifier: Segues.chainedAnimationSegue.rawValue, sender: self)
        default:
            break
        }
    }
}






