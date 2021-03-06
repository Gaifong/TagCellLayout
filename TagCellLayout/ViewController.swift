//
//  ViewController.swift
//  TagCellLayout
//
//  Created by Ritesh-Gupta on 20/11/15.
//  Copyright © 2015 Ritesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, TagCellLayoutDelegate {

  @IBOutlet weak var collectionView: UICollectionView?

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    defaultSetup()

    // THIS IS ALL WHAT IS REQUIRED TO SETUP YOUR TAGS

    let tagCellLayout = TagCellLayout(tagAlignmentType: .Center, delegate: self)
    collectionView?.collectionViewLayout = tagCellLayout
  }
  
  //MARK: - TagCellLayout Delegate Methods
  
  func tagCellLayoutTagFixHeight(layout: TagCellLayout) -> CGFloat {
    return CGFloat(54.0)
  }
  
  func tagCellLayoutTagWidth(layout: TagCellLayout, atIndex index: Int) -> CGFloat {
    return CGFloat(index%2 == 0 ? 80:120)
  }
  
  //MARK: - Default Methods
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func defaultSetup() {
    let nib = UINib(nibName: "TagCollectionViewCell", bundle: nil)
    collectionView?.registerNib(nib, forCellWithReuseIdentifier: "TagCollectionViewCell")
  }
  
  //MARK: - UICollectionView Delegate/Datasource Methods
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let identifier = "TagCollectionViewCell"
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath)
    return cell
  }
  
  func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
}

