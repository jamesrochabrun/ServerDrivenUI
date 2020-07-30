//
//  JSONMock.swift
//  ServerSideDrivenSwiftUI
//
//  Created by James Rochabrun on 7/29/20.
//

import Foundation


let BlogPayload = """
{
    "blogInfo": {
        "title": "Optionals in Swift explained: 5 things you should know",
        "subTitle": "https://www.avanderlee.com/swift/optionals-in-swift-explained-5-things-you-should-know/",
        "type": "text"
    },
    "blogCover" : {
        "url": "",
        "type": "image"
    }
}
"""

let blogListPayload = """
{
    "navigation": true,
    "type": "list",
    "posts": [{
            "type": "listItem",
            "blogInfo": {
                "title": "Optionals 1",
                "subTitle": "https://www.avanderlee.com/swift/optionals-in-swift-explained-5-things-you-should-know/",
                "type": "text"
            },
            "blogCover": {
                "url": "",
                "type": "image"
            }
        },
        {
            "type": "listItem",
            "blogInfo": {
                "title": "Optionals 2",
                "subTitle": "https://www.avanderlee.com/swift/optionals-in-swift-explained-5-things-you-should-know/",
                "type": "text"
            },
            "blogCover": {
                "url": "",
                "type": "image"
            }
        },
        {
            "type": "listItem",
            "blogInfo": {
                "title": "Optionals 3",
                "subTitle": "https://www.avanderlee.com/swift/optionals-in-swift-explained-5-things-you-should-know/",
                "type": "text"
            },
            "blogCover": {
                "url": "",
                "type": "image"
            }
        },
        {
            "type": "listItem",
            "blogInfo": {
                "title": "Optionals 4",
                "subTitle": "https://www.avanderlee.com/swift/optionals-in-swift-explained-5-things-you-should-know/",
                "type": "text"
            },
            "blogCover": {
                "url": "",
                "type": "image"
            }
        },
        {
            "type": "listItem",
            "blogInfo": {
                "title": "Optionals 5",
                "subTitle": "https://www.avanderlee.com/swift/optionals-in-swift-explained-5-things-you-should-know/",
                "type": "text"
            },
            "blogCover": {
                "url": "",
                "type": "image"
            }
        },
        {
            "type": "listItem",
            "blogInfo": {
                "title": "Optionals 6",
                "subTitle": "https://www.avanderlee.com/swift/optionals-in-swift-explained-5-things-you-should-know/",
                "type": "text"
            },
            "blogCover": {
                "url": "",
                "type": "image"
            }
        }
    ]
}
"""
