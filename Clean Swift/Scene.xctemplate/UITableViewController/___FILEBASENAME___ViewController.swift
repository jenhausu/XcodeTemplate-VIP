//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ___VARIABLE_sceneName___DisplayLogic: class {
    func displaySuccessAlert(message: String)
    func displayErrorAlert(message: String)
}

class ___VARIABLE_sceneName___ViewController: UIViewController {
    
    var interactor: ___VARIABLE_sceneName___BusinessLogic?
    var router: (NSObjectProtocol & ___VARIABLE_sceneName___RoutingLogic & ___VARIABLE_sceneName___DataPassing)?

    // MARK: - UI Element
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.register(___VARIABLE_sceneName___TableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        
        return tableView
    }()
    
    // MARK: - Object Lifecycle
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setup() {
        let viewController = self
        let interactor = ___VARIABLE_sceneName___Interactor()
        let presenter = ___VARIABLE_sceneName___Presenter()
        let router = ___VARIABLE_sceneName___Router()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        
    }
    
}


extension ___VARIABLE_sceneName___ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ___VARIABLE_sceneName___TableViewCell
        cell.data = interactor?.tableData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        interactor?.tableData.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
    }
    
}

extension ___VARIABLE_sceneName___ViewController: ___VARIABLE_sceneName___DisplayLogic {
    
    func displaySuccessAlert(message: String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "確定", style: .default)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func displayErrorAlert(message: String) {
        let alert = UIAlertController(title: "錯誤", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "確定", style: .default)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}
