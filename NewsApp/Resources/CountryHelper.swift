//
//  CountryHelper.swift
//  Ally-Energy-Audit
//
//  Created by Robert Shrestha on 4/16/20.
//  Copyright © 2020 esrtech. All rights reserved.
//

import Foundation
import RxSwift

struct CountryModel: Codable {
    let name: String
    let code: String
    let dialCode: String
    enum CodingKeys: String, CodingKey {
        case name
        case code
        case dialCode = "dial_code"
    }
}
class CountryHelper {
    static let shared = CountryHelper()
    func getCountries() -> Single<[CountryModel]> {
        return Single.create(subscribe: { emitter in
            if let path = Bundle.main.path(forResource: "countries", ofType: "json") {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    let jsonResult = try JSONDecoder().decode([CountryModel].self, from: data)
                    emitter(.success(jsonResult))
                } catch let error {
                    emitter(.error(error))
                    print(error.localizedDescription )
                    // handle error
                }
            }
            return Disposables.create()
        })
    }
}
