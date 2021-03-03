//
//  BaseViewController.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 17/01/2021.
//

import UIKit

// MARK: - Base View Controller
//
class BaseViewController: UIViewController {
    
    // MARK: - Properties
    //
    let activityView = UIActivityIndicatorView(style: .large)
    
    // MARK: - ViewModel + State Binding Helpers

    @discardableResult
    func bindLoadingState(to viewModel: BaseViewModel) -> ObservationToken {
        return viewModel.state.subscribe { [weak self] state in
            self?.shouldShowProgressView(state == .loading)
        }
    }
    
    @discardableResult
    func bindErrorState(to viewModel: BaseViewModel) -> ObservationToken {
        return viewModel.state.subscribe { [weak self] state in
            if case .failure(let error) = state {
                self?.showErrorAlert(error: error)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }
    /// Dismiss Keyboard
    ///
    func endEditting() {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
}

private extension BaseViewController {
    /// hide navigation bar
    ///
    func configureAppearance() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
}
