//
//  GeneralClass.swift
//  
//
//  Created by Kodika.io on 1/10/21.
//

import Foundation

public class GeneralClass {
    public let name: String
    public let nickname: String
    public let imageName: String
    public let uiViewControllerClass: UIViewControllerRequiredInitProtocol.Type
    
    public init(name: String, nickname: String, imageName: String, uiViewControllerClass: UIViewControllerRequiredInitProtocol.Type) {
        self.name = name
        self.nickname = nickname
        self.imageName = imageName
        self.uiViewControllerClass = uiViewControllerClass
    }
}
