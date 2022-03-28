//
//  AppWidgetExtensionSample.swift
//  SampleWidget
//
//  Created by Alex Zchut on 23/03/2022.
//  Copyright © 2022 Applicaster Ltd. All rights reserved.
//

import ZappCore

@objc public class AppWidgetExtensionSample: NSObject, GeneralProviderProtocol {
    public var model: ZPPluginModel?
    public var configurationJSON: NSDictionary?

    struct Params {
        struct Plugin {
            static let contentUrl = "content_url"
        }
    }

    var contentUrl: String? {
        return configurationJSON?.object(forKey: Params.Plugin.contentUrl) as? String
    }

    public required init(pluginModel: ZPPluginModel) {
        model = pluginModel
        configurationJSON = model?.configurationJSON
    }

    public var providerName: String {
        return String(describing: Self.self)
    }

    public func prepareProvider(_ defaultParams: [String: Any],
                                completion: ((_ isReady: Bool) -> Void)?) {
        saveAppGroupParams()
        completion?(true)
    }

    public func disable(completion: ((Bool) -> Void)?) {
        completion?(true)
    }

    func saveAppGroupParams() {
        guard let contentUrl = contentUrl else {
            return
        }

        UserDefaults.appGroup?.set(contentUrl, forKey: SharedParams.contentUrl)
    }
}
