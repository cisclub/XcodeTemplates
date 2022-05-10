//
//  ___FILEHEADER___
//
import UIKit


struct ___VARIABLE_useCaseName___ViewModel: ViewModel {
    typealias UseCasesType = ___VARIABLE_useCaseName___UseCases
    typealias ActionsType = ___VARIABLE_useCaseName___ViewModelActions
    typealias ViewType = ___VARIABLE_useCaseName___ViewController
    
    
    let view: ViewType?
    let useCases: UseCasesType
    let actions: ActionsType
    
    
    init(useCases: UseCasesType, actions: ActionsType) {
        self.useCases = useCases
        self.actions = actions
        self.view = nil
    }
}


struct ___VARIABLE_useCaseName___ViewModelActions {
}
