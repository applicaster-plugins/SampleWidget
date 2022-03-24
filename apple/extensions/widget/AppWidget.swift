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
        StaticConfiguration(kind: kind, provider: RanProvider()) { entry in
            RanWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Some display name")
        .description("Some descriptions")
    }
}

struct AppWidget_Previews: PreviewProvider {
    static var previews: some View {
        RanWidgetEntryView(entry: RanEntry(date: Date(), latestNewsModel: sampleNewsModel))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
