//
//  CLEANBase.swift
//
//  Created by Ali Amin on 26/04/2022.
//
//  CLEANBase is a set of protocols that helps creating an architecture Based on the Clean Architecture
/// In this architecture all logic is put into ViewModel. that in turn will split different types of logic into other components.
/// Presentation is the responsibility of ViewController and all other UI elements. But it should always remain dumb. That it doean't perm any logic. Not even presentation logic
/// Logic can be split into three different types. Presentation logic, Domain/Business logic and Data retrieval logic.
/// Networking logic is in a separate layer



import Foundation
import UIKit



// MARK: Coordinator
/// Coordinator: is responsible of the coordination of flow between different scenes, including all navigation/routing logic.
/// It contains the presentation and logic layers (ViewController and ViewModel respectively).
/// Interaction between coordinaores should happen to perfoem the navigation/flow from scene to another
/// - InoutType: Is the dependencies of the coordinator. For example MyCoordinator needs the current NavigationController and the value of language app set to. So the InputType typealias will be a struct that contains both UINavigationController and String peroperties.
/// ```
/// struct MyCoordinatorInput {
///     let navigationController: UINavigationController
///     let language: String
/// }
/// ```
/// - ActionsType: Actions are the channel via which coordinator can communicate with caller objet (mainly another coordinator). It can be a closure
protocol Coordinator {
    associatedtype InputType // Dependencies type
    associatedtype ActionsType // Feedback closure type

    
    var input: InputType { get }
    var actions: ActionsType { get }

    
    init(input: InputType, actions: ActionsType)
    
    func start()
}


// MARK: Use Case
protocol UseCase {
    associatedtype InputType
    associatedtype ClosureType  // AsyncReturnType
    associatedtype ReturnType   // ReturnType
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
