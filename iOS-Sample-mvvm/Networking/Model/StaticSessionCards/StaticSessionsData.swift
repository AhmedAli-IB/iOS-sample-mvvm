//
//  File.swift
//  iOS-Sample-mvvm
//
//  Created by Aya Essam on 27/01/2021.
//

import Foundation

struct StaticSession: Codable {
    var title: String
    var description: String
    var icon: String
    var color: String
}
        
class StaticSessions {
    
    let session1: StaticSession
    let session2: StaticSession
    let session3: StaticSession
    
    let staticSessionsArr: [StaticSession]
    
    init() {
        self.session1 = StaticSession(title: "نافذة الاستشارات",
                                      description: "مهمااختلف مجال تساؤلك تعرف على الاستشارة الأمثل مباشرة "
                                        + "من نخبة المستشارين المختصين.",
                                      icon: "main1", color: "Steel blue")
        
        self.session2 = StaticSession(title: "نافذة الإرشاد",
                                      description: "أحصل على المشورة والتوجيه في جميع نواحي" +
                                        " مشروعك وابدأ قصة نجاحك مع أحد مرشدينا ذوي الاختصاص والخبرة.",
                                      icon: "main2",
                                      color: "Mantis")
        self.session3 = StaticSession(title: "نافذة الاستفسارات العامة",
                                      description: "هناك حقيقة مثبتة منذ زمن طويل وهي "
                                        + "أن المحتوى المقروء لصفحة",
                                      icon: "main3",
                                      color: "Persian orange")
        self.staticSessionsArr = [session1, session2, session3]
    }
}
