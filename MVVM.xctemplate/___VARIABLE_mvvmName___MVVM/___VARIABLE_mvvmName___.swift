//
//  ___FILEHEADER___
//


import Foundation


class ___VARIABLE_mvvmName___: UIView, MVVM {
    typealias ViewModelType = ___VARIABLE_mvvmName___Model
    
    
    private var _viewModel: ViewModelType?
    var viewModel: ViewModelType {
        get {
            return _viewModel!
        }
        set {
            _viewModel = newValue
        }
    }
    
    
    class func instance(withModel viewModel: ViewModelType) -> ___VARIABLE_mvvmName___ {
        let nibName = "___VARIABLE_mvvmName___"
        let view = Bundle.main.loadNibNamed(nibName, owner: nil)!.first as! ___VARIABLE_mvvmName___
        view._viewModel = viewModel
        
        return view
    }
}


class ___VARIABLE_mvvmName___Model: ViewModel {
    typealias UseCasesType = ___VARIABLE_mvvmName___UseCases
    typealias ActionsType = ___VARIABLE_mvvmName___Actions
    typealias ViewType = ___VARIABLE_mvvmName___
    
    
    let view: ViewType?
    let useCases: UseCasesType
    let actions: ActionsType
    
    
    init(useCases: UseCasesType, actions: ActionsType) {
        self.useCases = useCases
        self.actions = actions
        self.view = nil
    }
}


struct ___VARIABLE_mvvmName___UseCases {
}


struct ___VARIABLE_mvvmName___Actions {
}

