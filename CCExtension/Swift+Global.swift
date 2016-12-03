//  Created by Songwen Ding on 12/3/16.
//  Copyright © 2016 Alex. All rights reserved.

import UIKit


// refer http://swifter.tips/regex/
struct RegexHelper {
    let regex: NSRegularExpression
    init(_ pattern: String) throws {
        try regex = NSRegularExpression(pattern: pattern,
                                        options: .caseInsensitive)
    }
    func match(input: String) -> Bool {
        let matches = regex.matches(in: input,
                                    options: [],
                                    range: NSMakeRange(0, input.utf16.count))
        return matches.count > 0
    }
}

infix operator =~ {
associativity none
precedence 130
}

func =~(lhs: String, rhs: String) -> Bool {
    do {
        return try RegexHelper(rhs).match(input: lhs)
    } catch _ {
        return false
    }
}

func print<T>(log: T, file: String = #file, method: String = #function, line: Int = #line) {
    #if DEBUG
        print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(log)")
    #endif
}
