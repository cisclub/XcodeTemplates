//
//  ___FILEHEADER___
//


class ___VARIABLE_sceneName___Coordinator: Coordinator {
    typealias InputType = Input
    typealias ActionsType = Actions

    
    let input: InputType
    let actions: ActionsType

    
    required init(input: InputType, actions: ActionsType) {
        self.input = input
        self.actions = actions
    }
    
    func start() {
    }
}


extension ___VARIABLE_sceneName___Coordinator {
    struct Input {
    }
    
    
    struct Actions {
    }
}
