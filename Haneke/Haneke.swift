//
//  Haneke.swift
//  Haneke
//
//  Created by Hermes Pique on 9/9/14.
//  Copyright (c) 2014 Haneke. All rights reserved.
//

import UIKit

public struct HanekeGlobals {
    
    public static let Domain = "io.haneke"
    
}

public struct Shared {
    
    public static var imageCache : Cache<UIImage> {
        struct Static {
            static let name = "shared-images"
            static let cache = Cache<UIImage>(name: name)
        }
        return Static.cache
    }
    
    public static var dataCache : Cache<NSData> {
        struct Static {
            static let name = "shared-data"
            static let cache = Cache<NSData>(name: name)
        }
        return Static.cache
    }
    
    public static var stringCache : Cache<String> {
        struct Static {
            static let name = "shared-strings"
            static let cache = Cache<String>(name: name)
        }
        return Static.cache
    }
    
    public static var JSONCache : Cache<JSON> {
        struct Static {
            static let name = "shared-json"
            static let cache = Cache<JSON>(name: name)
        }
        return Static.cache
    }
}

func errorWithCode(code : Int, #description : String) -> NSError {
    let userInfo = [NSLocalizedDescriptionKey: description]
    return NSError(domain: HanekeGlobals.Domain, code: code, userInfo: userInfo)
}

struct Log {
    
    private static let Tag = "[HANEKE]"
    private static let Debug = "[DEBUG]"
    private static let Error = "[ERROR]"
    
    static func debug(@autoclosure message: () -> String, _ error : NSError? = nil) {
        #if DEBUG
            if let error = error {
            NSLog("%@%@ %@ with error %@", Tag, Debug, message(), error);
            } else {
            NSLog("%@%@ %@", Tag, Debug, message)
            }
        #endif
    }
    
    static func error(@autoclosure message: () -> String, _ error : NSError? = nil) {
        if let error = error {
            NSLog("%@%@ %@ with error %@", Tag, Error, message(), error);
        } else {
            NSLog("%@%@ %@", Tag, Error, message())
        }
    }
    
}
