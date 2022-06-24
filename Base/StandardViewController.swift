//
//  StandardViewController.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 09/05/2022.
//

import Foundation
import UIKit

public enum ViewStates {
    case loading
    case error
    case empty
    case populated
}

class StandardViewController<VM: ViewModel>: MEBaseViewController, MVVM {
    typealias ViewModelType = VM
    
    
    var viewModel: VM?
    private var _loader: UIView?
    private var loader: UIView {
        guard let _loader = _loader else {
            _loader = CustomLoader(frame: view.bounds)
            return _loader!
        }
        
        return _loader
    }

    var showBackButton: Bool = true {
        didSet {
            if showBackButton {
                addLeftNavigationBarItem()
            }
            else {
                navigationItem.leftBarButtonItem = nil
                navigationItem.setHidesBackButton(true, animated: true)
            }
        }
    }
    
    override func viewDidLoad() {
        initView()
        super.viewDidLoad()
        self.view.backgroundColor = .appSand

        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func viewDidDisappear(_ animated: Bool) {

        super.viewDidDisappear(animated)

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UINavigationBar.appearance().backgroundColor = .clear // backgorund color with gradient
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    final func initView() {
        if showBackButton {
            addLeftNavigationBarItem()
        }
        else {
            navigationItem.leftBarButtonItem = nil
            self.navigationItem.setHidesBackButton(true, animated: true)
        }
    }
    func setupBinding() {}
    
    func addLeftNavigationBarItem() {
        let isArabic = LanguageHandler.sharedObject().selectedLanguage == ArabicLanguage
        let backImageName: String = isArabic ? Images.navigationBarImages.backButtonIconArabic : Images.navigationBarImages.backButtonIcon
        let backImage = UIImage(named: backImageName)?.withRenderingMode(.alwaysOriginal)
        let buttonItem = UIBarButtonItem(image: backImage, style: .plain, target: self, action: #selector(backButtonPressed(sender:)))
        self.navigationItem.leftBarButtonItem = buttonItem
    }
    func setupNavigationBackgroundColor(_ color: UIColor)  {
        let navigationTitleAttributes = [NSAttributedString.Key.font: UIFont.h2,
                                         NSAttributedString.Key.foregroundColor: UIColor.appDarkText]
        // UInavigationbar in expanded state
        let navigationLargeTitleAttributes = [NSAttributedString.Key.font: UIFont.h2,
                                              NSAttributedString.Key.foregroundColor: UIColor.appDarkText]
   
     
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()

            appearance.backgroundColor = color
            appearance.titleTextAttributes = navigationTitleAttributes
            appearance.largeTitleTextAttributes = navigationLargeTitleAttributes
            appearance.shadowColor = nil // to remove seperator
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        } else {
            UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
            UINavigationBar.appearance().shadowImage = UIImage()
            UINavigationBar.appearance().barTintColor = color // background color
            UINavigationBar.appearance().isTranslucent = false
        }
        UINavigationBar.appearance().tintColor = .white
    }
    
    class func setupNavigationBarTheme() {
        // UInavigationbar in contracted state
         // text/button color
    }
    
    @objc func backButtonPressed(sender:UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    deinit {
        print("deinit - \(String(describing: self))")
    }
}



extension StandardViewController {
    static func instanceFromStoryboard<T>(withViewModel viewModel: VM, fromStoryboard storyboard: String) -> T where T : StandardViewController<VM> {
        let storyboard = UIStoryboard(name: storyboard, bundle: .main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "\(Self.self)") as! T
        viewController.viewModel = viewModel
        viewController.setupBinding()
        
        return viewController
    }
    
    static func instanceFromNib<T: StandardViewController<VM>>(withViewModel viewModel: VM) -> T {
        let nibName = "\(Self.self)"
        let viewController = Bundle.main.loadNibNamed(nibName, owner: nil)!.first! as! T
        viewController.viewModel = viewModel
        viewController.setupBinding()
        
        return viewController
    }
}


// MARK: Loading Indicator
extension StandardViewController {
    func showLoadingIndicator() {
        DispatchQueue.main.async { [unowned self] in
            view.addSubview(self.loader)
        }
    }
    
    func hideLoadingIndicator() {
        DispatchQueue.main.async { [weak self] in
            self?.loader.removeFromSuperview()
            self?._loader = nil
        }
    }
}
