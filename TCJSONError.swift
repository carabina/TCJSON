//
//  TCJSONError.swift
//  TCJSON
//
//  Created by Tiziano Coroneo on 09/12/2017.
//

import Foundation

extension TCJSON {
    public struct BothFieldsNilError: Error {
        var localizedDescription: String {
            return "Both fields in this object are nil."
        }
    }
}
