//
//  UserDefaults+additions.swift
//  SampleWidget
//
//  Created by Alex Zchut on 28/03/2022.
//  Copyright © 2022 Applicaster Ltd. All rights reserved.
//

import Foundation

extension UserDefaults {
    static var appGroup: UserDefaults? {
        guard let supportedAppGroups = Bundle.main.object(forInfoDictionaryKey: SharedParams.supportedAppGroups) as? [String],
              let firstAppGroup = supportedAppGroups.first else {
                  return UserDefaults.standard
        }
                
        return UserDefaults(suiteName: firstAppGroup)
    }
}
