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
    var button = UIButton(frame: CGRectMake(110, 259, 100, 50))
    var uiswitch = UISwitch(frame: CGRectMake(140, 259, 100, 50))
    var slider = UISlider(frame: CGRectMake(60, 259, 200, 50))
    var textfield = UITextField(frame: CGRectMake(85, 259, 150, 50))
    var textview = UITextView(frame: CGRectMake(85, 209, 150, 150))
    var datepicker = UIDatePicker(frame: CGRectMake(0, 184, 320, 200))
    var picker = UIPickerView(frame: CGRectMake(0, 184, 320, 200))
    var alertButton = UIButton(frame: CGRectMake(110, 209, 100, 50))
    var actionSheetButton = UIButton(frame: CGRectMake(85, 309, 150, 50))
    
    var tea_list: [String] = ["ダージリン", "アールグレイ", "アッサム", "オレンジペコ"]

    var detailItem: Int? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: Int = self.detailItem {
            if detail == 0 {
                labelView()
            } else if detail == 1 {
                buttonView()
            } else if detail == 2 {
                switchView()
            } else if detail == 3 {
                sliderView()
            } else if detail == 4 {
                textFieldView()
            } else if detail == 5 {
                textViewView()
            } else if detail == 6 {
                datePickerView()
            } else if detail == 7 {
                pickerView()
            } else if detail == 8 {
                alertViewView()
            } else if detail == 9 {
                tapGestureView()
            } else if detail == 10 {
                longPressGestureView()
            } else {
                defaultView()
            }
        }
    }
    
    // UILabel
    func labelView() {
        self.navigationItem.title = "Label"
        
        let label = UILabel(frame: CGRect(x: 0, y: 204, width: 320, height: 160))
        
        label.text = "Hello, Swift!"
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont.systemFontOfSize(24)
        label.textColor = UIColor.blueColor()
        label.backgroundColor = UIColor.yellowColor()
        
        self.view.addSubview(label)

    }
    
    // UIButton
    func buttonView() {
        self.navigationItem.title = "Button"
        
        self.button.setTitle("Button", forState: .Normal)
        self.button.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
        self.button.layer.cornerRadius = 10
        self.button.layer.borderWidth = 1
        self.button.addTarget(self, action: "tapBtn:", forControlEvents:.TouchUpInside)
        
        self.view.addSubview(button)
    }
    
    func tapBtn(sender: UIButton) {
        NSLog("Button was pushed.")
    }

    // UISwitch
    func switchView() {
        self.navigationItem.title = "Switch"
        
        self.uiswitch.on = true
        //self.switch1.onTintColor = UIColor.greenColor()
        //self.switch1.thumbTintColor = UIColor.cyanColor()
        self.uiswitch.addTarget(self, action: "changeSwitch:", forControlEvents: UIControlEvents.ValueChanged)
        
        self.view.addSubview(uiswitch)
    }
    
    func changeSwitch(sender: UISwitch) {
        if(self.uiswitch.on == true) {
            NSLog("Switch becomes ON.")
        } else {
            NSLog("Switch becomes OFF.")
        }
        
    }

    // UISlider
    func sliderView() {
        self.navigationItem.title = "Slider"
        
        self.slider.minimumValue = 0
        self.slider.maximumValue = 100
        self.slider.minimumTrackTintColor = UIColor.redColor()
        self.slider.maximumTrackTintColor = UIColor.greenColor()
        self.slider.continuous = true
        self.slider.addTarget(self, action: "changeSlider:", forControlEvents: UIControlEvents.ValueChanged)
        
        self.view.addSubview(slider)
    }
    
    func changeSlider(sender: UISlider) {
        NSLog("Slider value is \(self.slider.value).")
    }
    
    // TextField
    func textFieldView() {
        self.navigationItem.title = "TextField"
        
        //self.textfield.text = "TextField"
        self.textfield.placeholder = "Placeholder"
        self.textfield.textAlignment = NSTextAlignment.Center
        self.textfield.textColor = UIColor.blueColor()
        self.textfield.backgroundColor = UIColor.lightGrayColor()
        self.textfield.font = UIFont.systemFontOfSize(20)
        self.textfield.keyboardType = UIKeyboardType.ASCIICapable
        self.textfield.layer.borderWidth = 1
        //self.textfield.borderStyle = UITextBorderStyle.Line
        
        self.view.addSubview(textfield)
    }
    
    // TextView
    func textViewView() {
        self.navigationItem.title = "TextView"
        
        self.textview.text = "TextView"
        self.textview.textColor = UIColor.greenColor()
        //self.textview.backgroundColor = UIColor.cyanColor()
        self.textview.font = UIFont.systemFontOfSize(14)
        self.textview.textAlignment = NSTextAlignment.Right
        self.textview.keyboardType = UIKeyboardType.URL
        self.textview.layer.borderWidth = 1
        
        self.view.addSubview(textview)
    }
    
    // DatePicker
    func datePickerView() {
        self.navigationItem.title = "DatePicker"
        
        self.datepicker.datePickerMode = UIDatePickerMode.DateAndTime
        self.datepicker.minuteInterval = 5
        self.datepicker.addTarget(self, action: "changeDatePicker:", forControlEvents: UIControlEvents.ValueChanged)
        
        self.view.addSubview(datepicker)
    }
    
    func changeDatePicker(sender: UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP")
        dateFormatter.timeStyle = .MediumStyle
        dateFormatter.dateStyle = .MediumStyle
        
        NSLog("\(dateFormatter.stringFromDate(self.datepicker.date))")
    }
    
    // Picker
    func pickerView() {
        self.navigationItem.title = "Picker"
        
        self.picker.dataSource = self
        self.picker.delegate = self
        
        self.view.addSubview(picker)
    }
    
    // AlertView
    func alertViewView() {
        self.navigationItem.title = "AlertView"
        
        self.alertButton.setTitle("Alert", forState: .Normal)
        self.alertButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.alertButton.layer.cornerRadius = 10
        self.alertButton.layer.borderWidth = 1
        self.alertButton.addTarget(self, action: "tapAlertBtn:", forControlEvents:.TouchUpInside)
        
        self.actionSheetButton.setTitle("Action Sheet", forState: .Normal)
        self.actionSheetButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.actionSheetButton.layer.cornerRadius = 10
        self.actionSheetButton.layer.borderWidth = 1
        self.actionSheetButton.addTarget(self, action: "tapActionSheetBtn:", forControlEvents:.TouchUpInside)
        
        self.view.addSubview(alertButton)
        self.view.addSubview(actionSheetButton)
    }
    
    func tapAlertBtn(sender: UIButton) {
        let title: String = "Title"
        let message: String = "Message"
        let cancelTitle: String = "Cancel"
        let okTitle: String = "OK"
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: cancelTitle, style: .Cancel) { action in
            NSLog("Cancel was selected on Alert")
        }
        
        let okAction = UIAlertAction(title: okTitle, style: .Default) { action in
            NSLog("OK was selected on Alert")
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func tapActionSheetBtn(sender: UIButton) {
        let destructiveTitle: String = "Delete"
        let otherTitle: String = "Cancel"
        
        let actionSheetController = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        
        let destructiveAction = UIAlertAction(title: destructiveTitle, style: .Destructive) { action in
            NSLog("Delete was selected on ActionSheet")
        }
        
        let otherAction = UIAlertAction(title: otherTitle, style: .Default) { action in
            NSLog("Cancel was selected on ActionSheet")
        }
        
        actionSheetController.addAction(destructiveAction)
        actionSheetController.addAction(otherAction)
        
        presentViewController(actionSheetController, animated: true, completion: nil)
    }
    
    // TapGesture
    func tapGestureView() {
        self.navigationItem.title = "TapGesture"
        
        let label = UILabel(frame: CGRect(x: 0, y: 142, width: 320, height: 284))
        
        label.text = "Tap Here"
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont.systemFontOfSize(20)
        
        self.view.addSubview(label)
        
        var tapGesture = UITapGestureRecognizer(target: self, action: "tapTapGesture:")
        
        self.view.addGestureRecognizer(tapGesture)
    }
    
    func tapTapGesture(recognizer: UITapGestureRecognizer) {
        NSLog("Tapped")
    }
    
    // LongPressGesture
    func longPressGestureView() {
        self.navigationItem.title = "LongPressGesture"
        
        let label = UILabel(frame: CGRect(x: 0, y: 142, width: 320, height: 284))
        
        label.text = "LongPress Here"
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont.systemFontOfSize(20)
        
        self.view.addSubview(label)
        
        var longPressGesture = UILongPressGestureRecognizer(target: self, action: "longPressGesture:")
        
        self.view.addGestureRecognizer(longPressGesture)
    }
    
    func longPressGesture(recognizer: UILongPressGestureRecognizer) {
        if(recognizer.state == UIGestureRecognizerState.Began) {
            NSLog("LongPressed began")
        } else if (recognizer.state == UIGestureRecognizerState.Ended) {
            NSLog("LongPressed ended")
        }
    }
    
    // Other(Under Construction)
    func defaultView() {
        self.navigationItem.title = "Sorry"
        
        let label = UILabel(frame: CGRect(x: 0, y: 142, width: 320, height: 284))
        
        label.text = "Under Construction"
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont.systemFontOfSize(24)
        
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

// UIPickerViewDataSource
extension DetailViewController: UIPickerViewDataSource {
    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int {
        return 1
    }

    func pickerView(pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int {
        return self.tea_list.count
    }
}

// UIPickerViewDelegate
extension DetailViewController: UIPickerViewDelegate {
    func pickerView(pickerVvew: UIPickerView!, titleForRow row: Int, forComponent component: Int) -> String! {
        return self.tea_list[row]
    }
    
    func pickerView(pickerView: UIPickerView!, didSelectRow row: Int, inComponent component: Int) {
        NSLog("%@ was selected", self.tea_list[row])
    }
}



