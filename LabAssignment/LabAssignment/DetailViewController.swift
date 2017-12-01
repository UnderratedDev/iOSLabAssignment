//
//  DetailViewController.swift
//  LabAssignment
//
//  Created by Yudhvir Raj on 2017-12-01.
//  Copyright © 2017 Yudhvir Raj. All rights reserved.
//

import UIKit
import MarqueeLabel

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            // print (detail)
            if let label = detailDescriptionLabel {
                print (detail.description)
                label.text = String(detail.description.characters.filter { !"\t\r\n".characters.contains($0) })
                // label.sizeToFit()
                label.numberOfLines = 0
                label.lineBreakMode = NSLineBreakMode.byWordWrapping
                label.sizeToFit()
                
                // label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
        animation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animation () {
        print (self.detailDescriptionLabel.text)
        UIView.animate(withDuration: 12.0, delay: 1, options: ([.curveLinear, .curveEaseInOut]), animations: {() -> Void in
            self.detailDescriptionLabel.center = CGPoint(x : 0 - self.detailDescriptionLabel.bounds.size.width / 2, y : self.detailDescriptionLabel.center.y)
        }, completion:  { _ in })
    }

    var detailItem: String? {
        didSet {
            // Update the view.
            configureView()
        }
    }
    
}

