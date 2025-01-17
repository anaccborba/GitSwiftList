//
//  Coordinator.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 17/01/25.
//

import UIKit

public protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}
