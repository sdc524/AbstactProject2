//
//  AbstractionViewController.swift
//  Abstact Project
//
//  Created by Cassat, Stephen on 12/6/18.
//  Copyright © 2018 Cassat Stephen. All rights reserved.
//

import UIKit

public class AbstractionViewController: UIPageViewController, UIPageViewControllerDataSource
{

    //MARK:- Data members
private lazy var orderedAbstractionViews : [UIViewController] =
{
    return[
        self.newAbstractionViewController(abstractionLevel: "Swift"),
        self.newAbstractionViewController(abstractionLevel: "Block"),
        self.newAbstractionViewController(abstractionLevel: "ByteCode"),
        self.newAbstractionViewController(abstractionLevel: "Binary"),
        self.newAbstractionViewController(abstractionLevel: "LogicalGate"),
        
    
    
    
    ]
}()

//MARK: Helper method to retrieve the correct ViewController based on the data member
private func newAbstractionViewController(abstractionLevel : String) -> UIViewController
{
    return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(abstractionLevel)ViewController")
}

//MARK:- Lifecycle methods
public override func viewDidLoad()
{
    super.viewDidLoad()
    dataSource = self
    
    if let firstViewController = orderedAbstractionViews.first
    {
        setViewControllers([firstViewController],
                           direction: .forward,
                           animated: true,
                           completion: nil)
    }
}

//MARK:- Datasouurce required methods
/// Swipe Left
public func pageViewCobntroller(_pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
{
    guard let viewControllerIndex = orderedAbstractionViews.index(of: viewController)
        else
    {
        return nil
    }
    
    let previousIndex = viewControllerIndex - 1
    
    guard previousIndex >= 0
        else
    {
        return orderedAbstractionViews.last
    }
    
    guard orderedAbstractionViews.count > previousIndex
        else
    {
        return nil
    }
    
    return orderedAbstractionViews(previousIndex)
}

}
