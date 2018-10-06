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

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let context = CoreDataModelService.mainContext
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
         self.present(GeneralweatherDefaultBuilder().main(), animated: true, completion: nil)
    }
}
