//
//  WalkthroughPageViewController.swift
//  draftPrototype
//
//  Created by Andrei Kozyrev on 7/22/18.
//  Copyright © 2018 Andrei Kozyrev. All rights reserved.
//

import UIKit

protocol walkthroughPageViewControllerDelegate: class {
  
  func didUpdatePageIndex(currentIndex: Int)

}

class walkthroughPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    var index = (viewController as! WalkthroughContentViewController).index
    index -= 1
    
    return contentViewController(at: index)
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    var index = (viewController as! WalkthroughContentViewController).index
    index += 1
    
    return contentViewController(at: index)
  }
  
  var pageHeadings = ["First page! Cool cool cool", "Lots of features", "Premium content"]
  var pageImages = ["onboarding-1", "onboarding-2", "onboarding-3"]
  var pageSubheadings = ["Yea", "saving democracy one tap at a time", "you bet"]
  
  weak var walkthroughDelegate: walkthroughPageViewControllerDelegate?
  
  func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
    if completed {
      if let contentViewController = pageViewController.viewControllers?.first as? WalkthroughContentViewController {
        print("Content view controller index: \(contentViewController.index)")
        currentIndex = contentViewController.index
        walkthroughDelegate?.didUpdatePageIndex(currentIndex: contentViewController.index)
      }
    }
  }
  
  
  
  func contentViewController(at index: Int) -> WalkthroughContentViewController? {
    if index < 0 || index >= pageHeadings.count {
      return nil
    }
    let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
    if let pageContentViewController = storyboard.instantiateViewController(withIdentifier: "walkthroughContentViewController") as? WalkthroughContentViewController {
      pageContentViewController.imageFile = pageImages[index]
      pageContentViewController.heading = pageHeadings[index]
      pageContentViewController.subheading = pageSubheadings[index]
      pageContentViewController.index = index
      
      return pageContentViewController
    }
    return nil
  }
  
  public var currentIndex = 0
  // When this method is called it creates the next View Controller
  func forwardPage() {
    currentIndex += 1
    
    if let nextViewController = contentViewController(at: currentIndex) {
      setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
    }
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      dataSource = self
      if let startingViewController = contentViewController(at: 0) {
        setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
      }
      
      delegate = self
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
