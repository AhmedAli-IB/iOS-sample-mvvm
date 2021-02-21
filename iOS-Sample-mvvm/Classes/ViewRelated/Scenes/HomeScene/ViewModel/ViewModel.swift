//
//  Placeholder.swift
//  iOS-Sample-mvvm
//
//  Created by Ahmed Ali on 17/01/2021.
//

import Foundation

class HomeViewModel: BaseViewModel {
    
//    var onReload: (() -> Void)?
//    var onNetworkFailure: (() -> Void)?

    private let photoServiceLocator: HomeServiceLocatorProtocol
    private var sessions: [SessionsData] = []
    private var staticSessions: [StaticSessionData] = []
    
    // MARK: - CallBacks
    
    /// Called when data is updated and reload is needed.
    ///
    private var onReloadNeededItems = PublishSubject<Void>()
    
    init(photoServiceLocator: HomeServiceLocatorProtocol = HomeServiceLocator()) {
        self.photoServiceLocator = photoServiceLocator
    }
    
    var numberOfRows: Int {
        sessions.count
    }
    
    var staticDataNumberOfRows: Int {
        staticSessions.count
    }
    
    func getCurrentObject(for indexPath: IndexPath) -> SessionsData {
        return sessions[indexPath.row]
    }
    
    func getCurrentObject(for indexPath: IndexPath) -> StaticSessionData {
        return staticSessions[indexPath.row]
    }
    
}

extension HomeViewModel {
    
    func getSessions() {
        
        self.state.send(.loading)
        
        if !InternetChecker.isConnectedToNetwork() {
            self.state.send(.failure(""))
        }
        
        photoServiceLocator.getSessions { [weak self](result) in
            
            guard let self = self else { return }
            switch result {
            case .success(let sessions):
               
                self.sessions = sessions
                self.onReloadNeededItems.send(())
                self.state.send(.success)
                
            case .failure(let error):
                self.state.send(.failure(error.localizedDescription))
            }
        }
    }
    
    func getStaticSessionsData() {
        
        let session1 = StaticSessionData(title: "نافذة الاستشارات",
                                         description: "مهمااختلف مجال تساؤلك تعرف على الاستشارة الأمثل مباشرة "
                                        + "من نخبة المستشارين المختصين.",
                                         icon: "main1",
                                         color: "Steel blue")
        
        let session2 = StaticSessionData(title: "نافذة الإرشاد",
                                         description: "أحصل على المشورة والتوجيه في جميع نواحي" +
                                        " مشروعك وابدأ قصة نجاحك مع أحد مرشدينا ذوي الاختصاص والخبرة.",
                                         icon: "main2",
                                         color: "Mantis")
        let session3 = StaticSessionData(title: "نافذة الاستفسارات العامة",
                                         description: "هناك حقيقة مثبتة منذ زمن طويل وهي "
                                        + "أن المحتوى المقروء لصفحة",
                                         icon: "main3",
                                         color: "Persian orange")
        
        self.staticSessions.append(session1)
        self.staticSessions.append(session2)
        self.staticSessions.append(session3)

        self.onReloadNeededItems.send(())
        self.state.send(.success)
    }
}
// MARK: - Helpers
//
extension HomeViewModel {
    
    /// Provide access to `onReloadNeededSubject`
    ///
    var onReloadNeeded: Observable<Void> {
        return onReloadNeededItems
    }
}
