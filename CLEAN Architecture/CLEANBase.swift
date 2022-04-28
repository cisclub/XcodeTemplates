//
//  Base.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 26/04/2022.
//


import Foundation
import UIKit

// MARK: Coordinator
protocol Coordinator {
    associatedtype InputType
    associatedtype ActionsType

    
    var input: InputType { get }
    var actions: ActionsType { get }

    
    init(input: InputType, actions: ActionsType)
    
    func start()
}


// MARK: Use Case
protocol UseCase {
    associatedtype InputType
    associatedtype ClosureType
    associatedtype ReturnType
    associatedtype RepoType
    
    
    var repo: RepoType { get }

    
    func execute(input: InputType, finishHandler:ClosureType) -> ReturnType
}


// MARK: Repository
protocol Repository {
    associatedtype InputType
    associatedtype ClosureType
    associatedtype ReturnType
    
    
    var network : NetworkManager.Type { get }
    
    func execute(input: InputType, finishHandler: ClosureType) -> ReturnType
}


// MARK: View Model
protocol ViewModel {
    associatedtype UseCasesType
    associatedtype ActionsType
    
    var useCases: UseCasesType { get }
    var actions: ActionsType { get }
}


// MARK: View Controller
protocol BasicViewController {
    associatedtype ViewModelType: ViewModel
    
    
    var viewModel: ViewModelType { get }
}


class StandardViewController<VM: ViewModel>: UIViewController, BasicViewController {
    typealias ViewModelType = VM
    
    
    private var _viewModel: ViewModelType?
    var viewModel: ViewModelType {
        get {
            return _viewModel!
        }
    }
    
    
    static func instanceFromStoryboard<T>(withViewModel viewModel: VM) -> T where T : StandardViewController<VM>
    {
        let name = "\(Self.self)".replacingOccurrences(of: "ViewController", with: "Scene")
        let storyboard = UIStoryboard(name: name, bundle: .main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "\(Self.self)") as! T
        viewController._viewModel = viewModel
        
        return viewController
    }
}


// MARK: Binding
class Observable<T> {

    var value: T {
        didSet {
            listener?(value)
        }
    }

    private var listener: ((T) -> Void)?

    init(_ value: T) {
        self.value = value
    }

    func bind(_ closure: @escaping (T) -> Void) {
        closure(value)
        listener = closure
    }
}
