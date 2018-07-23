//
//  walkthroughViewController.swift
//  draftPrototype
//
//  Created by Andrei Kozyrev on 7/22/18.
//  Copyright © 2018 Andrei Kozyrev. All rights reserved.
//

import UIKit

class walkthroughViewController: UIViewController, walkthroughPageViewControllerDelegate {
  
  // Function required by the custom-made
  // walkthroughPageViewControllerDelegate protocol
  func didUpdatePageIndex(currentIndex: Int) {
    updateUI()
  }

  @IBOutlet weak var pageControl: UIPageControl!
  
  @IBOutlet weak var nextButton: UIButton! {
    didSet {
      nextButton.layer.cornerRadius = 25.0
      nextButton.layer.masksToBounds = true
    }
  }
  
  @IBOutlet weak var skipButton: UIButton!
  
  @IBAction func skipButtonTapped(_ sender: UIButton) {
    dismiss(animated: true, completion: nil)
    UserDefaults.standard.set(true, forKey: "hasChecked") //"hasChecked" will be added as a key to UserDefaults with a value of true
  }
  
  @IBAction func nextButton(_ sender: UIButton) {
    if let index = walkthroughPageViewController?.currentIndex {
      switch index {
      case 0...1:
        walkthroughPageViewController?.forwardPage()
      case 2:
        UserDefaults.standard.set(true, forKey: "hasChecked") //"hasChecked" will be added as a key to UserDefaults with a value of true
        dismiss(animated: true, completion: nil)
      default:
        break
      }
    }
    updateUI()
  }
  
  var walkthroughPageViewController: walkthroughPageViewController?
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let destination = segue.destination
    if let pageViewController = destination as? walkthroughPageViewController {
      walkthroughPageViewController = pageViewController
      walkthroughPageViewController?.walkthroughDelegate = self
    }
  }
  
  // updateUI method
  func updateUI() {
    if let index = walkthroughPageViewController?.currentIndex {
      switch index {
        
      case 0...1:
        nextButton.setTitle("Next", for: .normal)
        skipButton.isHidden = false
        
      case 2:
        nextButton.setTitle("Get Started", for: .normal)
        skipButton.isHidden = true
        
      default:
        break
      }
      pageControl.currentPage = index
    }
  }
  
  
  
  
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
