//
//  ContentLoader.swift
//  SampleWidget
//
//  Created by Alex Zchut on 28/03/2022.
//  Copyright © 2022 Applicaster Ltd. All rights reserved.
//

import Foundation

public class ContentLoader {
    public static func load(with urlString: String, completion: ((_ content: [String: AnyObject]?) -> Void)?) {
        let session = URLSession(configuration: .default)

        guard let url = URL(string: urlString) else {
            completion?(nil)
            return
        }
        
        let request = URLRequest(url: url)

        let task = session.dataTask(with: request) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse,
               (200 ... 299).contains(httpResponse.statusCode),
                let data = data {
                let content = convertDataToDictionary(data: data)
                completion?(content)
            } else {
                completion?(nil)
            }
        }
        task.resume()
    }
    
    public class func convertDataToDictionary(data: Data) -> [String: AnyObject]? {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: AnyObject]
            return json
        } catch {
            print("Something went wrong")
            return nil
        }
    }
}
