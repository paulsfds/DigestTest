//
//  ViewController.swift
//  DigestTest
//
//  Created by Paul Wong on 12/25/14.
//  Copyright (c) 2014 PP Productions LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    var scrollView1: UIScrollView = UIScrollView(frame: CGRectMake(0.0, 0.0, 400.0, 400.0))
    var scrollView2: UIScrollView = UIScrollView(frame: CGRectMake(0.0, 50.0, 400.0, 400.0))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView1.backgroundColor = UIColor.redColor()
        self.scrollView2.backgroundColor  = UIColor.blueColor()
        self.scrollView1.delegate = self
        
        self.view.addSubview(self.scrollView1)
        self.view.addSubview(self.scrollView2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var detailMaxOffset = self.scrollView1.contentSize.width - CGRectGetWidth(self.scrollView2.frame)
        
        var maxOffset = 40.0
        var percentage = Float(self.scrollView1.contentOffset.x) / Float(maxOffset);
        
        var parallaxMaxOffset = Float(self.scrollView2.contentSize.width) - Float(CGRectGetWidth(self.scrollView2.frame))
        var x = CGFloat(percentage * parallaxMaxOffset)
        
        var point: CGPoint = CGPointMake(x, CGFloat(0.0))
        self.scrollView2.setContentOffset(point, animated: false)
//        [self.parallaxScrollView setContentOffset:CGPointMake(percentage * parallaxMaxOffset, 0);
    }
}

