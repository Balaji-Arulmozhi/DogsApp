//
//  AppStrings.swift
//  Dogs
//
//  Created by Kumararaja Krishnan on 7/23/24.
//

import Foundation

enum NetworkErrorStrings:String{
    case InvalidURL
    case RequestFailed
    case InvalidResponse
    case DecodingFailedWithError
    case UnAuthorizedError
    
    var localized: String{
        NSLocalizedString("\(rawValue)", comment: "Network Error Strings")
    }
}


enum ModuleStrings : String{
    case NoImagefound
    case SelectSubBreed
    case DogsList
    case Search
    
    var localized: String{
        NSLocalizedString("\(rawValue)", comment: "Module Strings")
    }
    
}

enum NoNetworkStrings:String{
    case NoInternetConnection
    case NoNetworkContent
    case Refresh
    
    var localized: String{
        NSLocalizedString("\(rawValue)", comment: "NoNetwork Error Strings")
    }
    
}


enum NoDataStrings: String{
    case NoData
    
    var localized: String{
        NSLocalizedString("\(rawValue)", comment: "NoData Strings")
    }
}
