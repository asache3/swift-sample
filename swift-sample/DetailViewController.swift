//
//  DetailViewController.swift
//  swift-sample
//
//  Created by Asakura, Masayoshi | Asache | NEWSD on 7/23/14.
//  Copyright (c) 2014 asache3. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
                            
    //@IBOutlet weak var detailDescriptionLabel: UILabel!


    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        //if let detail: AnyObject = self.detailItem {
            //if let label = self.detailDescriptionLabel {
                //label.text = detail.description
            //}
        //}
        
        let label = UILabel(frame: CGRect(x: 0, y: 142, width: 320, height: 284))
        label.text = "Hello, Swift!"
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont.systemFontOfSize(24)
        label.textColor = UIColor.blueColor()
        label.backgroundColor = UIColor.yellowColor()
        
        self.view.addSubview(label)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

