//
//  ViewController.swift
//  PVC
//
//  Created by Ctrl Alt Believe on 2015-02-24.
//  Copyright (c) 2015 Paolo Montano. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    var pageController: UIPageViewController?
    var pageContent = NSArray()
    
    @IBOutlet weak var transitionType: UISegmentedControl!
    @IBOutlet weak var navOrientation: UISegmentedControl!
    @IBAction func startDemo(sender: UIButton) {
        createContent()
        var isCurl = (transitionType.selectedSegmentIndex == 0)
        var isHorizontal = (navOrientation.selectedSegmentIndex == 0)
        pageController = UIPageViewController(
            transitionStyle: (isCurl ? .PageCurl : .Scroll),
            navigationOrientation: (isHorizontal ? .Horizontal : .Vertical),
            options: nil
        )

        pageController?.delegate = self
        pageController?.dataSource = self

        let startingViewController: ContentViewController = viewControllerAtIndex(0)
        let viewControllers: NSArray = [startingViewController]
        pageController!.setViewControllers(
            viewControllers,
            direction: .Forward,
            animated: false,
            completion: nil
        )
        self.addChildViewController(pageController!)
        self.view.addSubview(self.pageController!.view)
        var pageViewRect = self.view.bounds
        pageController!.view.frame = pageViewRect
        pageController!.didMoveToParentViewController(self)
    }

    func createContent() {
        var pageStrings = [String]()
        for i in 1...5 {
            let contentString = "<html><head></head><body><h1>Page \(i)</h1><br><p>This is the content of page \(i)</p></body></html>"
            pageStrings.append(contentString)
        }
        pageContent = pageStrings
    }

    func viewControllerAtIndex(idx: Int) -> ContentViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let dataViewController = storyBoard.instantiateViewControllerWithIdentifier("contentView") as ContentViewController
        
        dataViewController.dataObject = pageContent[idx]
        return dataViewController
    }
    
    func indexOfViewController(viewController: ContentViewController) -> Int {
        if let dataObject: AnyObject = viewController.dataObject {
            return pageContent.indexOfObject(dataObject)
        }
        else {
            return NSNotFound
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var idx = indexOfViewController(viewController as ContentViewController)
        
        if (idx == 0) || (idx == NSNotFound) {
            return nil
        }
        idx--
        return viewControllerAtIndex(idx)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var idx = indexOfViewController(viewController as ContentViewController)
        
        if (idx == NSNotFound) {
            return nil
        }
        idx++
        if (idx == pageContent.count) {
            return nil
        }
        return viewControllerAtIndex(idx)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

