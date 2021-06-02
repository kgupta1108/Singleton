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
protocol FeedLoader {
    func loadFeed(completion: @escaping (([FeedItem]) -> Void))
}
class FeedViewController: UIViewController {
    var loader: FeedLoader!
    
    convenience init(loader:  FeedLoader) {
        self.init()
        self.loader = loader
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loader.loadFeed { items in
            //Update UI
        }
    }
}

class RemoteFeedLoader: FeedLoader {
    func loadFeed(completion: @escaping (([FeedItem]) -> Void)) {
        //Talk to an API Layer and call completion once done
    }
}

class LocalFeedLoader: FeedLoader {
    func loadFeed(completion: @escaping (([FeedItem]) -> Void)) {
        // Does some offline capability to give better UX and then calls completion
    }
}

class RemoteFeedLoaderWithLocalFallback: FeedLoader {
    let remoteFeedLoader: FeedLoader
    let localFeedLoader: FeedLoader
    
    init(remote: FeedLoader, local: FeedLoader) {
        self.remoteFeedLoader = remote
        self.localFeedLoader = local
    }
    func loadFeed(completion: @escaping (([FeedItem]) -> Void)) {
        let isNetworkAvailable = true
        isNetworkAvailable ? remoteFeedLoader.loadFeed(completion: completion) : localFeedLoader.loadFeed(completion: completion) 
    }
}


//For UT Purpose
class MockAPIClient: ApiClient {
//    func login(completion: ((User) -> Void)) {
//        //Skip making API call if you want to use in Unit Tests
//    }
}




