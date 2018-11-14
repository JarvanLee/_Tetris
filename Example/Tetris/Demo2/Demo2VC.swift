//
//  Demo2VC.swift
//  Tetris_Example
//
//  Created by 王俊仁 on 2018/10/1.
//  Copyright © 2018 wangjunren. All rights reserved.
//

import UIKit

class Demo2VC: BaseVC, Routable {

    static var routeURLs: [URLPresentable] {
        return ["/swift/demo2/demo2"]
    }

    var name: String?
    var number: NSNumber?
    
    convenience required init(intent: Intent) {
        self.init()
        name = intent.getString("name")
        number = intent.getNumber("number")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        alert(msg: """
            fragment: \(String(describing: ts_sourceIntent?.urlComponent?.fragment))
            params: \(String(describing: ts_sourceIntent?.urlComponent?.params))
            name: \(String(describing: name))
            number: \(String(describing: number))
            """)
    }

}
