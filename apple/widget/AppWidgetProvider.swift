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
    var contentUrl: String? {
        return UserDefaults.appGroup?.string(forKey: SharedParams.contentUrl)
    }
    
    public init() {

    }
    
    public func placeholder(in context: Context) -> AppWidgetEntry {
        AppWidgetEntry(date: Date())
    }

    public func getSnapshot(in context: Context, completion: @escaping (AppWidgetEntry) -> Void) {
        let entry = AppWidgetEntry(date: Date())
        completion(entry)
    }

    public func getTimeline(in context: Context, completion: @escaping (Timeline<AppWidgetEntry>) -> Void) {
        if let contentUrl = contentUrl {
            //load content adn define timeline
            ContentLoader.load(with: contentUrl) { content in
                var entries:[AppWidgetEntry] = []
                if let contentEntries = content?["entries"] as? [[String: Any]] {
                    contentEntries.forEach { contentEntry in
                        if let timeInterval = contentEntry["date"] as? Double {
                            let date = Date(timeIntervalSince1970: timeInterval)
                            let entry = AppWidgetEntry(date: date)
                            entries.append(entry)
                        }
                    }
                }

                //add single item if empty (optional)
                if entries.isEmpty {
                    entries.append(AppWidgetEntry(date: Date()))
                }
                let timeline = Timeline(entries: entries, policy: .atEnd)
                completion(timeline)
            }
        }
        else {
            //add single item if no content provided (optional)
            let midnight = Calendar.current.startOfDay(for: Date())
            let nextMidnight = Calendar.current.date(byAdding: .day, value: 1, to: midnight)!
            let entries = [AppWidgetEntry(date: midnight)]
            let timeline = Timeline(entries: entries, policy: .after(nextMidnight))
            completion(timeline)
        }
    }
}


