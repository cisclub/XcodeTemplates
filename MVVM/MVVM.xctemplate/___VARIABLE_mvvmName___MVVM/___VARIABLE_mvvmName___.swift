//
//  ___FILEHEADER___
//


import Foundation


class ___VARIABLE_mvvmName___: MVVM {
    typealias ViewModelType = TouchViewModel
    
    
    let viewModel: ViewModelType
    
    
    init(viewModel: ViewModelType) {
        self.viewModel = viewModel
    }
}


class ___VARIABLE_mvvmName___ViewModel: ViewModel {
    typealias UseCasesType = TouchUseCases
    typealias ActionsType = TouchActions
    
    
    let viewController: UIViewController?
    let useCases: TouchUseCases
    let actions: TouchActions
    
    
    init(useCases: UseCasesType, actions: ActionsType) {
        self.useCases = useCases
        self.actions = actions
        self.viewController = nil
    }
}


struct ___VARIABLE_mvvmName___UseCases {
}


struct ___VARIABLE_mvvmName___Actions {
}

