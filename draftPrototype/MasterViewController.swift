//
//  ViewController.swift
//  draftPrototype
//
//  Created by Andrei Kozyrev on 7/15/18.
//  Copyright © 2018 Andrei Kozyrev. All rights reserved.
//

import UIKit
//import PaperOnboarding

class MasterViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    if UserDefaults.standard.bool(forKey: "hasChecked") == true {
      return
    }
    
    let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
    if let walkthroughViewController = storyboard.instantiateViewController(withIdentifier: "walkthroughViewController") as? walkthroughViewController {
          present(walkthroughViewController, animated: true, completion: nil)
    }

  }
  
}

