//
//  Singleton.swift
//  Singleton
//
//  Created by kshitij gupta on 01/06/21.
//

import Foundation
import UIKit

//Main Module
extension ApiClient {
    func login(completion: ((LoggedInUser) -> Void)) {}
}

extension ApiClient {
    func loadFeed(completion: (([FeedItem]) -> Void)) {}
}

//API Module
class ApiClient {
    private init(){}
    static let instance = ApiClient()
    
    func execute(_: URLRequest, completion: (Data) -> Void){}
}

//Login Module
struct LoggedInUser {}
class LoginViewController: UIViewController {
    var login: (((LoggedInUser) -> Void) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        login? { user in
            //
        }
    }
}

//Feed Module
struct FeedItem {}
class FeedViewController: UIViewController {
    var loadFeed: ((([FeedItem]) -> Void) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadFeed? { loadedItems in
            //Update UI
        }
    }
}


//For UT Purpose
class MockAPIClient: ApiClient {
//    func login(completion: ((User) -> Void)) {
//        //Skip making API call if you want to use in Unit Tests
//    }
}




