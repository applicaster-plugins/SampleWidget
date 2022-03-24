//
//  AppWidget.swift
//  Widget
//
//  Created by Alex Zchut on 23/03/2022.
//  Copyright © 2022 Applicaster Ltd. All rights reserved.
//

import WidgetKit
import SwiftUI
import SampleWidget

@main
struct AppWidget: Widget {
    let kind: String = "AppWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: AppWidgetProvider()) { entry in
            AppWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Sample widget")
        .description("Sample widget")
    }
}

struct AppWidget_Previews: PreviewProvider {
    static var previews: some View {
        AppWidgetEntryView(entry: AppWidgetEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
