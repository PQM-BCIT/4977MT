//
//  ContentViewController.swift
//  PVC
//
//  Created by Ctrl Alt Believe on 2015-02-24.
//  Copyright (c) 2015 Paolo Montano. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    var dataObject: AnyObject?
    @IBOutlet weak var webView: UIWebView!

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        webView.loadHTMLString(dataObject as String, baseURL: NSURL(string: ""))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnBack(sender: UIButton) {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
     /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
