//
//  ___FILEHEADER___
//
import UIKit


extension ___VARIABLE_sceneName___Coordinator {
    class VModel: ViewModel {
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


extension ___VARIABLE_sceneName___Coordinator.VModel {
    struct Actions {
    }
    
    struct UseCases {
        let useCase: UseCases.___VARIABLE_useCaseName___
    }
}
