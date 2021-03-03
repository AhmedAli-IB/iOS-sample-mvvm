//
//  SearchPepoleViewModel.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 24/01/2021.
//

import Foundation

// MARK: - Search Pepole ViewModel
//
class SearchPepoleViewModel: BaseViewModel {
    
    // MARK: - Properties
    //
    private var filtrationItems: [FiltrationModel] = []
    private var contributors: [Contributor] = []
    
    private var filtredCenters: [CenterModel] = []
    private var filtredSubjects: [SubjectModel] = []
    private var filtredDates: [Date] = []
    
    private var request: ContributorRequest = ContributorRequest()
    
    private let serviceLocator: SearchServiceLocatorProtocol
    
    /// SearchPeopleDataSource
    ///
    var dataSource: SearchPeopleDataSource = {
        return SearchPeopleDataSource()
    }()
    
    var filterOnlineContributors: Bool = false
    
    // MARK: - CallBacks
    
    /// Called when data is updated and reload is needed.
    ///
    private var onReloadNeededItems = PublishSubject<Void>()
    
    // MARK: - Init
    //
    init(serviceLocator: SearchServiceLocatorProtocol = SearchServiceLocator()) {
        self.serviceLocator = serviceLocator
    }
    
    var numberOfItms: Int {
        return filtrationItems.count
    }
    
    // MARK: - Handlers
    //
    func viewDidLoad() {
        filtrationItems = FiltrationModel.createFiltrationModels()
        getContributors(request: request)
    }
    
    /// Get Filtration Item for specific
    ///
    func getFiltrationItem(indexPath: IndexPath) -> FiltrationModel {
        return filtrationItems[indexPath.row]
    }
    
    /// get current selected centers
    ///
    func getSelectedCenters() -> [CenterModel] {
        filtredCenters
    }
    
    /// get current selected subjects
    ///
    func getSelectedSubjects() -> [SubjectModel] {
        filtredSubjects
    }
    /// get current selected dates
    ///
    func getSelectedDates() -> [Date] {
        filtredDates
    }
    
    func selectItem(at index: IndexPath) {
        filtrationItems[index.item].isSelected = !filtrationItems[index.item].isSelected
        self.onReloadNeededItems.send(())

    }
    
    /// Change select state of item
    ///
    func selectOnlineFiltration(at index: IndexPath) {
        request.availability == nil ? (request.availability = Constants.availability) : (request.availability = nil)
        getContributors(request: request)
    }
    /// Set filtred centers
    ///
    func setfiltredCenter(centers: [CenterModel]) {
        
        self.filtredCenters = centers
        // to change state of uicollection view to green
        let index = filtrationItems.firstIndex(where: { $0.filtrationType == .location })
        guard let locationIndex = index else { return }
        filtrationItems[locationIndex].isSelected = !centers.isEmpty
        self.onReloadNeededItems.send(())
        request.centers = filtredCenters.map({ $0.id }).joined(separator: ",")
        getContributors(request: request)
        
    }
    
    /// Set filtred centers
    ///
    func setfiltredSubject(subjects: [SubjectModel]) {
        
        self.filtredSubjects = subjects
        // to change state of uicollection view to green
        let index = filtrationItems.firstIndex(where: { $0.filtrationType == .fields })
        guard let subjectIndex = index else { return }
        filtrationItems[subjectIndex].isSelected = !subjects.isEmpty
        self.onReloadNeededItems.send(())
        
        request.subjects = filtredSubjects.map({ $0.id }).joined(separator: ",")
        getContributors(request: request)
    }
    
   func setFiltredDates(dates: [Date]) {
    self.filtredDates = dates
    // to change state of uicollection view to green
    let index = filtrationItems.firstIndex(where: { $0.filtrationType == .calendar })
    guard let calendarIndex = index else { return }
    filtrationItems[calendarIndex].isSelected = !dates.isEmpty
    self.onReloadNeededItems.send(())
    
    request.dates = filtredDates.map({ "\($0.timeIntervalSince1970)" }).joined(separator: ",")
    getContributors(request: request)
    
 }
    
    /// Search with text
    ///
    func search(with text: String) {
        request.searchText = text
        getContributors(request: request)
    }
}

// MARK: - handlers
//
private extension SearchPepoleViewModel {
    
    /// Get contributors from service locator
    ///
    func getContributors(request: ContributorRequest) {
        
        print("rquest == \(request)")
        state.send(.loading)
        serviceLocator.getContributors(contributorRequest: request) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let contributors):
                self.contributors = contributors
                self.dataSource.setContributors(contributors)
                self.state.send(.success)
                self.onReloadNeededItems.send(())
            case .failure(let error):
                self.state.send(.failure(error.localizedDescription))
                self.onReloadNeededItems.send(())
            }
        }
    }
    
    /// Show only online contibutors
    ///
    func filterOnline(isOnline: Bool = true) {
        if isOnline {
            let onlineContributors =  contributors.filter({ $0.online })
            dataSource.setContributors(onlineContributors)
        } else {
            dataSource.setContributors(contributors)
        }
        self.onReloadNeededItems.send(())
    }
}
// MARK: - Helpers
//
extension SearchPepoleViewModel {
    
    /// Provide access to `onReloadNeededSubject`
    ///
    var onReloadNeeded: Observable<Void> {
        return onReloadNeededItems
    }
}

// MARK: - Constants
//
private extension SearchPepoleViewModel {
    enum Constants {
        // Online case in business
        static let availability = 2
    }
}
