//
//  StandardViewController.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 09/05/2022.
//

import Foundation
import UIKit


class StandardViewController<VM: ViewModel>: UIViewController, MVVM {
    typealias ViewModelType = VM
    
    
    var viewModel: ViewModelType?
    
    
    static func instanceFromStoryboard<T>(withViewModel viewModel: VM, fromStoryboard storyboard: String) -> T where T : StandardViewController<VM> {
        let storyboard = UIStoryboard(name: storyboard, bundle: .main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "\(Self.self)") as! T
        viewController.viewModel = viewModel
        
        return viewController
    }
    
    static func instanceFromNib<T: StandardViewController<VM>>(withViewModel viewModel: VM) -> T {
        let nibName = "\(Self.self)"
        let viewController = Bundle.main.loadNibNamed(nibName, owner: nil)!.first! as! T
        viewController.viewModel = viewModel
        
        return viewController
    }
}
