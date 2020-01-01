//
//  ConnectionManager.swift
//  ShopPhone
//
//  Created by GABLET04690 on 24/12/2562 BE.
//  Copyright © 2562 Orathai Udomluk. All rights reserved.
//

import Foundation
import Reachability

class ConnectionManager: NSObject {

    static let sharedInstance: ConnectionManager = { return ConnectionManager() }()
    var reachability: Reachability?

    override init() {
        super.init()

        self.reachability = try? Reachability.init()

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(connectionStatusChanged(_:)),
            name: .reachabilityChanged,
            object: reachability
        )
        
        do {
            try reachability?.startNotifier()
        } catch(let error) {
            print("Error start reachability notification : \(error.localizedDescription)")
        }
    }
    
    @objc func connectionStatusChanged(_ notification: Notification) {
        switch reachability?.connection {
        case .cellular:
            print("Network available via Cellular Data.")
        case .wifi:
            print("Network available via WiFi.")
        case .none:
            print("Network is not available.")
        case .some(.none):
            print("Network is not available.")
        case .some(.unavailable):
            print("Network is not available.")
        }
    }
    
    static func stopNotifier() -> Void {
        do {
            try (ConnectionManager.sharedInstance.reachability)?.startNotifier()
        } catch(let error) {
            print("Error stop reachability notification : \(error.localizedDescription)")
        }
    }

    static func isReachable(completed: @escaping (ConnectionManager) -> Void) {
        if (ConnectionManager.sharedInstance.reachability)?.connection != Reachability.Connection.unavailable {
            completed(ConnectionManager.sharedInstance)
        }
    }
    
    static func isUnreachable(completed: @escaping (ConnectionManager) -> Void) {
        if (ConnectionManager.sharedInstance.reachability)?.connection == Reachability.Connection.unavailable {
            completed(ConnectionManager.sharedInstance)
        }
    }
    
    static func isReachableViaWWAN(completed: @escaping (ConnectionManager) -> Void) {
        if (ConnectionManager.sharedInstance.reachability)?.connection == .cellular {
            completed(ConnectionManager.sharedInstance)
        }
    }

    static func isReachableViaWiFi(completed: @escaping (ConnectionManager) -> Void) {
        if (ConnectionManager.sharedInstance.reachability)?.connection == .wifi {
            completed(ConnectionManager.sharedInstance)
        }
    }
}
