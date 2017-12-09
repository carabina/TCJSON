//
//  TCJSON.swift
//  TCJSON
//
//  Created by Tiziano Coroneo on 09/12/2017.
//

import Foundation


struct TCJSON<Content: Codable> {
    private let _content: Content?
    private let _json: Data?
    
    public func content() throws -> Content {
        if let content = _content { return content }
        guard let json = _json
            else { throw BothFieldsNilError() }
        return try JSONDecoder().decode(Content.self, from: json)
    }
    
    public func data() throws -> Data {
        if let json = _json { return json }
        guard let content = _content
            else { throw BothFieldsNilError() }
        return try JSONEncoder().encode(content)
    }
    
    public init(_ content: Content) {
        self._content = content
        self._json = nil
    }
    
    public init(_ json: Data) {
        self._json = json
        self._content = nil
    }
    
    public init(jsonString: String) throws {
        let data = jsonString.data(using: .utf8)!
        self.init(data)
    }
    
    func map<X>(
        data f: (Data) throws -> X)
        throws -> TCJSON<X> {
            
        return TCJSON<X>(try f(try data()))
    }
    
    func map<X>(
        content f: (Content) throws -> X)
        throws -> TCJSON<X> {
            
        return TCJSON<X>(try f(try content()))
    }
    
    func bind<X>(
        data f: (Data) throws -> TCJSON<X>)
        throws -> TCJSON<X> {
            
        return try f(try data())
    }
    
    func bind<X>(
        content f: (Content) throws -> TCJSON<X>)
        throws -> TCJSON<X> {
            
        return try f(try content())
    }
    
    func apply(
        data f: (Data) throws -> ())
        throws {
            
        try f(try data())
    }
    
    func apply(
        content f: (Content) throws -> ())
        throws {
            
        try f(try content())
    }
    
    static func zip<X, Y, Z: Codable>(
        x: TCJSON<X>,
        y: TCJSON<Y>,
        closure: (X, Y) throws -> Z)
        throws -> TCJSON<Z> {
            
        return try TCJSON<Z>(closure(try x.content(), try y.content()))
    }
}
