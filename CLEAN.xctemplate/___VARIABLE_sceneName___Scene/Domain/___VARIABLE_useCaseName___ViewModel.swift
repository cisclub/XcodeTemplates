//
//  ___FILEHEADER___
//
import UIKit


class ___VARIABLE_useCaseName___ViewModel: ViewModel {
    typealias UseCasesType = ___VARIABLE_useCaseName___UseCases
    typealias ActionsType = ___VARIABLE_useCaseName___ViewModelActions
    
    
    let useCases: UseCasesType
    let actions: ActionsType
    
    
    init(useCases: UseCasesType, actions: ActionsType) {
        self.useCases = useCases
        self.actions = actions
    }
}


struct ___VARIABLE_useCaseName___ViewModelActions {
}
