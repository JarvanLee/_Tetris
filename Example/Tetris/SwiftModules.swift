//
//  SwiftModules.swift
//  Tetris_Example
//
//  Created by 王俊仁 on 2018/10/1.
//  Copyright © 2018 wangjunren. All rights reserved.
//

import UIKit

class SwiftModules: AbstractModule, IComponent {
    
    override class func ts_create() -> Self? {
        return self.init()
    }

    open override func ts_didCreate() {
        priority = TSModulePriorityNormal
    }
    
    func tetrisModuleInit(_ context: TSModuleContext) {
        print("\(type(of: self)) \(#function)")
    }

    func tetrisModuleSetup(_ context: TSModuleContext) {
        print("\(type(of: self)) \(#function)")
    }

    func tetrisModuleSplash(_ context: TSModuleContext) {
        print("\(#function)")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print("\(#function)")

        TSTetris.shared().moduler.trigger.tetrisModuleDidTrigger!(event: 100, userInfo: nil)
    }

    func tetrisModuleDidTrigger(event: Int, userInfo: [AnyHashable : Any]? = nil) {
        print("\(#function)  event: \(event)")
    }


}

@objc
public protocol TestProtocolA {
    func methodA()
}




class Services : NSObject, IServiceable, IComponent, TestProtocolA {
    
    static var interface: Protocol? = TestProtocolA.self
    
    static var name: String?
    
    static var singleton: Bool = false
    
    
    func methodA() {
        print("--swift servcie---")
    }
    
    
}


class MyAction: NSObject, RouteActionable, URLRoutable, IComponent {
    
    class var routeURLs: [URLPresentable] {
        return ["/swift/actionDemo?"]
    }
    
    func getStreamBy(_ component: TreeUrlComponent) -> TSStream<AnyObject> {
        return TSStream<AnyObject>.create({ (r) -> TSCanceller? in
            r.post(100)
            r.close()
            return nil
        })
    }
    
    
}
