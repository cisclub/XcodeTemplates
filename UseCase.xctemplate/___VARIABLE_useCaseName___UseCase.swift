//
//  ___FILEHEADER___
//


struct ___VARIABLE_useCaseName___UseCase: UseCase {
    typealias InputType = ___VARIABLE_useCaseName___InputType
    typealias ClosureType = <#closur type#>
    typealias ReturnType = <#return type#>
    typealias RepoType = ___VARIABLE_useCaseName___Repo
    
    
    let repo: RepoType

    
    func execute(input: InputType, finishHandler:ClosureType) -> ReturnType {
        
    }
}


struct ___VARIABLE_useCaseName___InputType {
}


struct ___VARIABLE_useCaseName___Repo: Repository {
    typealias Input = ___VARIABLE_useCaseName___RepoInput
    typealias Output = <#output type#>
    
    
    let network : NetworkManager.Type
    
    
    func execute(input: Input, finishHandler: (Output) -> ()) {
    }
}


struct ___VARIABLE_useCaseName___RepoInput {
}
