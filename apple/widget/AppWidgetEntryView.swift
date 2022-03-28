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

public struct AppWidgetEntryView: View {
    var entry: AppWidgetProvider.Entry
    public init(entry: AppWidgetProvider.Entry) {
        self.entry = entry
    }

    public var body: some View {
        let path = "https://raw.githubusercontent.com/applicaster-plugins/SampleWidget/main/images/phones.png"
        URLImageView(url: URL(string: path))
            .aspectRatio(contentMode: .fill)
    }
}

struct URLImageView: View {
    let url: URL?

    @ViewBuilder
    var body: some View {
        if let url = url,
           let data = try? Data(contentsOf: url),
           let uiImage = UIImage(data: data) {
            Image(uiImage: uiImage)
                .resizable()
        } else {
            Image(systemName: "photo")
        }
    }
}
