//
//  ViewController.swift
//  ChartsDemo-Swift
//
//  Created by Rupam Mitra on 01/08/16.
//  Copyright © 2016 Rupam Mitra. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var graphContainerView: UIView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    var graphViewController: BaseGraphViewController!
    var responseArray: [[String: AnyObject]]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loadData(sender: UIButton) {
        
        loadJSON()
        actionSegmentControl(segmentControl)
    }
    
    @IBAction func actionSegmentControl(sender: UISegmentedControl) {
        
        graphContainerView.subviews.count > 0 ? graphContainerView.subviews[0].removeFromSuperview() : debugPrint("No Subviews")
        if responseArray == nil {
            return
        }
        switch sender.selectedSegmentIndex {
        case 0:
            graphViewController = BarGraphViewController()
        case 1:
            graphViewController = LineGraphViewController()
        case 2:
            graphViewController = LineGraphViewController()
            graphViewController.filledEnabled = true
        default:
            debugPrint("Do Nothing")
        }
        graphViewController.dataArray = responseArray
        addGraphAsSubview()
    }
    
    func loadJSON() {
        
        if let path = NSBundle.mainBundle().pathForResource("SampleData", ofType: "json")
        {
            if let jsonData = try? NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingMappedIfSafe)
            {
                if let jsonResult = try? NSJSONSerialization.JSONObjectWithData(jsonData, options: .AllowFragments)
                {
                    if let response = jsonResult["response"]
                    {
                        responseArray = response as! [[String: AnyObject]]
                    }
                }
            }
        }
    }
    
    func addGraphAsSubview() {
        graphViewController.view.frame = graphContainerView.bounds
        graphContainerView.addSubview(graphViewController.view)
    }
}

