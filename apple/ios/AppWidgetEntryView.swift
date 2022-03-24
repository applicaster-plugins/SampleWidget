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
        let path = "https://github.com/applicaster-plugins/SampleWidget/blob/48582db871648bb63efc63c026929a5ee40ae760/images/phones.png"
        URLImageView(url: URL(string: path))
            .aspectRatio(contentMode: .fill)
    }
}

struct URLImageView: View {
    let url: URL?

    @ViewBuilder
    var body: some View {
        if let data = try? Data(contentsOf: url), let uiImage = UIImage(data: data) {
            Image(uiImage: uiImage)
                .resizable()
        } else {
            Image(systemName: "photo")
        }
    }
}