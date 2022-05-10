//
//  ___FILEHEADER___
//


import Foundation


class ___VARIABLE_sceneName___: MVVM {
    typealias ViewModelType = TouchViewModel
    
    
    let viewModel: ViewModelType
    
    
    init(viewModel: ViewModelType) {
        self.viewModel = viewModel
    }
}


class ___VARIABLE_sceneName___ViewModel: ViewModel {
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


struct ___VARIABLE_sceneName___UseCases {
}


struct ___VARIABLE_sceneName___Actions {
}

