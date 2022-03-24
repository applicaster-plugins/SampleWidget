//
//  AppWidgetEntryView.swift
//  SampleWidget
//
//  Created by Alex Zchut on 23/03/2022.
//  Copyright © 2022 Applicaster Ltd. All rights reserved.
//

import Foundation
import SwiftUI
import WidgetKit

public struct AppWidgetEntryView : View {
    var entry: AppWidgetProvider.Entry

    var body: some View {
        let path = "https://raw.githubusercontent.com/pawello2222/country-flags/main/png1000px/pl.png"
        URLImageView(url: URL(string: path)!)
            .aspectRatio(contentMode: .fill)
    }
}
