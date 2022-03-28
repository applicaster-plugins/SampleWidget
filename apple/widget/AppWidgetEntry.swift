//
//  AppWidgetEntry.swift
//  SampleWidget
//
//  Created by Alex Zchut on 23/03/2022.
//  Copyright © 2022 Applicaster Ltd. All rights reserved.
//

import Foundation
import WidgetKit

public struct AppWidgetEntry: TimelineEntry {
    public var date: Date

    public init(date: Date) {
        self.date = date
    }
}
