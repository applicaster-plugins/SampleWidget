//
//  AppWidgetProvider.swift
//  SampleWidget
//
//  Created by Alex Zchut on 23/03/2022.
//  Copyright © 2022 Applicaster Ltd. All rights reserved.
//

import Foundation
import WidgetKit

public struct AppWidgetProvider: TimelineProvider {
    func placeholder(in context: Context) -> AppWidgetEntry {
        AppWidgetEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (AppWidgetEntry) -> Void) {
        let entry = AppWidgetEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<AppWidgetEntry>) -> Void) {
        let midnight = Calendar.current.startOfDay(for: Date())
        let nextMidnight = Calendar.current.date(byAdding: .day, value: 1, to: midnight)!
        let entries = [AppWidgetEntry(date: midnight)]
        let timeline = Timeline(entries: entries, policy: .after(nextMidnight))
        completion(timeline)
    }
}
}
