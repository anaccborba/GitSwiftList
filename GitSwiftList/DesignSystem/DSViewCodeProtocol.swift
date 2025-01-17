//
//  DSViewCodeProtocol.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 17/01/25.
//

public protocol DSViewCodeProtocol {
    func setUpViewCode()
    func setUpHierarchy()
    func setUpConstrainsts()
}

public extension DSViewCodeProtocol {
    func setUpViewCode() {
        setUpHierarchy()
        setUpConstrainsts()
    }
}
