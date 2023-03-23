//
//  ___FILEHEADER___
//
import UIKit


extension ___VARIABLE_sceneName___Coordinator {
    class `ViewModel`: ViewModel {
        typealias UseCasesType = UseCases
        typealias ActionsType = Actions
        
        
        let useCases: UseCasesType
        let actions: ActionsType
        
        
        init(useCases: UseCasesType, actions: ActionsType) {
            self.useCases = useCases
            self.actions = actions
        }
    }
}


extension ___VARIABLE_sceneName___Coordinator.ViewModel {
    struct Actions {
    }
    
    struct UseCases {
        let <#useCase#>: ___VARIABLE_useCaseName___UseCase
    }
}
