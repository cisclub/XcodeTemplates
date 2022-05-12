//
//  ___FILEHEADER___
//


class ___VARIABLE_sceneName___Coordinator: Coordinator {
    typealias InputType = ___VARIABLE_sceneName___CoordinatorInput
    typealias ActionsType = ___VARIABLE_sceneName___CoordinatorActions

    
    let input: InputType
    let actions: ActionsType

    
    required init(input: InputType, actions: ActionsType) {
        self.input = input
        self.actions = actions
    }
    
    func start() {
    }
}


struct ___VARIABLE_sceneName___CoordinatorInput {
}


struct ___VARIABLE_sceneName___CoordinatorActions {
}
