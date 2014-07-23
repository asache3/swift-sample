//
//  LabelViewController.swift
//  swift-sample
//
//  Created by Asakura, Masayoshi | Asache | NEWSD on 7/23/14.
//  Copyright (c) 2014 asache3. All rights reserved.
//

import UIKit

class LabelViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel(frame: CGRect(x: 0, y: 142, width: 320, height: 284))
        label.text = "Hello, Swift!"
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont.systemFontOfSize(24)
        label.textColor = UIColor.blueColor()
        label.backgroundColor = UIColor.yellowColor()
        self.view.addSubview(label)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
