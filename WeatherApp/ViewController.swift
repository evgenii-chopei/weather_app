//
//  ViewController.swift
//  WeatherApp
//
//  Created by Evgenii Chopei on 9/27/18.
//  Copyright © 2018 Evgenii Chopei. All rights reserved.
//

import UIKit
import Photos
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let context = CoreDataModelService.mainContext
    let fontsNames = UIFont.familyNames
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//    let tableView = UITableView()
//        view.addSubview(tableView)
//        tableView.enableConstraits()
//        tableView.constraitFullStretch(to: view)
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//        tableView.dataSource = self
//        tableView.delegate = self
        
        self.present(GeneralweatherDefaultBuilder().main(), animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fontsNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let font = UIFont.init(name: fontsNames[indexPath.row], size: 25.0)
        cell.textLabel?.font = font
        cell.textLabel?.text  = "MONDAY"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(fontsNames[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
}
