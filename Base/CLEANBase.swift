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
/// Is responsible of the coordination of flow between different scenes, including all navigation/routing logic.
/// It contains the presentation and logic layers (ViewController and ViewModel respectively).
/// Interaction between coordinaores should happen to perfoem the navigation/flow from scene to another
protocol Coordinator {
    /// Is the dependencies of the coordinator. For example MyCoordinator needs the current NavigationController and the value of language app set to. So the InputType typealias will be a struct that contains both UINavigationController and String peroperties.
    /// ```
    /// struct MyCoordinatorInput {
    ///     let navigationController: UINavigationController
    ///     let language: String
    /// }
    /// ```
    associatedtype InputType
    
    /// Actions are the channel via which coordinator can communicate with caller objet (mainly another coordinator). It can be a closure
    associatedtype ActionsType // Feedback closure type

    
    var input: InputType { get }
    var actions: ActionsType { get }

    
    init(input: InputType, actions: ActionsType)
    
    /// Starts te flow of the coordinator
    func start()
    
    /// Implement this method if you want to provide a way to dismiss the coordinator by calling this method. for example if you are listining to an event and should dismiss the corrdinator when
    /// this event is fired
    func dismiss()
}

extension Coordinator {
    func dismiss() {
        fatalError("\(Self.self).dismiss is not implemented") // Means you are trying to call dismiss in a class/struct that doesnt implement it
    }
}


// MARK: Use Case
/// Represents a business logic unit. Should be implemented in a way that maximizes reusabulity. So adding multiple logic units into one use case should be avoided
protocol UseCase {
    /// Dependencies of the use case
    associatedtype InputType
    
    /// In case use case will return in an async fasion, this shoulld define the type of the closure.
    associatedtype ClosureType
    
    /// Return of the use case
    associatedtype ReturnType
    
    /// The type of Repo use case takes as an input
    associatedtype RepoType
    
    
    var repo: RepoType { get }

    
    /// Executes the use case and returns ReturnType syncronously and/or ClosureType asynchronously
    func execute(input: InputType, finishHandler:ClosureType) -> ReturnType
}


// MARK: Repository
/// The data retrieval logic unit. Responsible of retrieving data from an API or from local data base
protocol Repository {
    /// Dependencies of the repo
    associatedtype InputType
    
    /// In case use case will return in an async fasion, this shoulld define the type of the closure.
    associatedtype ClosureType
    
    /// Return of the use case
    associatedtype ReturnType
    
    
    var network : NetworkManager.Type { get }
    
    /// Executes the repo and returns ReturnType syncronously and/or ClosureType asynchronously
    func execute(input: InputType, finishHandler: ClosureType) -> ReturnType
}


// MARK: View Model
/// Represents the logic layer. It contains business logic (use cases), view rendering logic (itself) and data retrieval logic (Repo)
protocol ViewModel {
    /// Use cases in this logic unit
    associatedtype UseCasesType
    /// Actions are closures that will be called to handle events happenning in View Model. For example when it should move to another scene
    associatedtype ActionsType
    

    var useCases: UseCasesType { get }
    var actions: ActionsType { get }
}


// MARK: MVVM
/// Represents a Model, View and ViewModel unit. whenever a view is needed to be created, use this MVVM to guarantee confoming to MVVM. All it does is the it makes sure that for the
/// view being created there is a ViewModel and this is to avoid adding any logic in the view.
protocol MVVM {
    /// Type of view model and it conforms to ``ViewModel``
    associatedtype ViewModelType: ViewModel
    
    
    var viewModel: ViewModelType? { get set }
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
