

public protocol URLPresentable {
    func toURL() throws -> URL
}

public protocol URLRoutable {

    static var routeURLs : [URLPresentable] {get}

}

extension URL : URLPresentable {
    public func toURL() throws -> URL {
        return self
    }
}

extension String : URLPresentable {
    public func toURL() throws -> URL {
        return URL.init(string: self)!
    }
}

extension NSString : URLPresentable {
    public func toURL() throws -> URL {
        return URL.init(string: self as String)!
    }
}


public typealias Routable = (IComponent & URLRoutable)

public extension IComponent where Self : URLRoutable, Self : Intentable {
    public static func tetrisStart() {
        self.routeURLs.forEach { (url) in
            try! TSTetris.shared().router.bindUrl(url.toURL().absoluteString, viewController: Self.self)
        }
    }
}


public extension IComponent where Self : IIntercepter {
    public static func tetrisStart() {
        TSTetris.shared().router.intercepterMgr.add(intercepter: self.ts_create())
    }
}


public extension IComponent where Self : RouteActionable, Self : URLRoutable {
    public static func tetrisStart() {
        TSTetris.shared().router.bindUrl(try! self.routeURLs.first!.toURL().absoluteString,
                                         toRouteAction: self.ts_create())
    }
}
