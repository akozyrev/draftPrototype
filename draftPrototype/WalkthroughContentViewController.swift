//
//  WalkthroughContentViewController.swift
//  draftPrototype
//
//  Created by Andrei Kozyrev on 7/22/18.
//  Copyright © 2018 Andrei Kozyrev. All rights reserved.
//

import UIKit

class WalkthroughContentViewController: UIViewController {
  
  @IBOutlet weak var headerLabel: UILabel! {
    didSet {
      headerLabel.numberOfLines = 0
    }
  }
  @IBOutlet weak var subheaderLabel: UILabel! {
    didSet {
      subheaderLabel.numberOfLines = 0
    }
  }
  @IBOutlet weak var contentImageView: UIImageView!
  
  var index = 0
  var heading = ""
  var subheading = ""
  var imageFile = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    headerLabel.text = heading
    subheaderLabel.text = subheading
    contentImageView.image = UIImage(named: imageFile)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
}
