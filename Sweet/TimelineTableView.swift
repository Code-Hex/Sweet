//
//  TimelineTableView.swift
//  Sweet
//
//  Created by Kei Kamikawa on 2016/04/10.
//  Copyright © 2016年 Kei Kamikawa. All rights reserved.
//

import Cocoa
import Accounts
import SwifterMac

struct Tweets {
    var username: String!
    var name: String!
    var tweet: String!
    var id: Int!
    var profile_img: String!
    var timestamp: String!
}

class TimelineTableView: NSScrollView, NSTableViewDelegate, NSTableViewDataSource {
    
    let cnt = 200
    let key = "RErEmzj7ijDkJr60ayE2gjSHT"
    let secret = "SbS0CHk11oJdALARa7NDik0nty4pXvAxdt7aj0R5y1gNzWaNEx"
    let failureHandler: NSError -> Void = { print($0.localizedDescription) }
    
    var tweets: [Tweets] = []
    
    override func viewDidUnhide() {
        let accountStore = ACAccountStore()
        let accountType = accountStore.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierTwitter)
        
        accountStore.requestAccessToAccountsWithType(accountType, options: nil) { granted, error in
            guard granted else {
                print("There are no Twitter accounts configured. You can add or create a Twitter account in Settings.")
                self.oauthTwitter()
                return
            }
            
            guard let twitterAccounts = accountStore.accountsWithAccountType(accountType) where !twitterAccounts.isEmpty else {
                print("There are no Twitter accounts configured. You can add or create a Twitter account in Settings.")
                self.oauthTwitter()
                return
            }
            
            let twitterAccount = twitterAccounts[0] as! ACAccount
            let swifter = Swifter(account: twitterAccount)
            
            swifter.getStatusesHomeTimelineWithCount(cnt, success: { statuses in
                guard let tweets = statuses else { return }
                self.tweets = tweets.map {
                    let tweet = Tweets()
                    tweet.tweet = $0["text"].string!
                    tweet.name = $0["user"]["name"].string!
                    tweet.username = $0["user"]["screen_name"].string!
                    tweet.profile_img = $0["user"]["profile_image_url"].string!
                    tweet.timestamp = $0["created_at"].string!
                    tweet.id = $0["id"].integer!
                    return tweet
                }
            }, failure: failureHandler)
        }
    }
    
    func oauth() {
        NSAppleEventManager.sharedAppleEventManager().setEventHandler(self, andSelector: Selector("handleEvent:withReplyEvent:"), forEventClass: AEEventClass(kInternetEventClass), andEventID: AEEventID(kAEGetURL))
        LSSetDefaultHandlerForURLScheme("sweet", NSBundle.mainBundle().bundleIdentifier! as NSString as CFString)
    }
    
    func handleEvent(event: NSAppleEventDescriptor!, withReplyEvent: NSAppleEventDescriptor!) {
        self.becomeFirstResponder()
        Swifter.handleOpenURL(NSURL(string: event.paramDescriptorForKeyword(AEKeyword(keyDirectObject))!.stringValue!)!)
    }
    
    func oauthTwitter() {
        let swifter = Swifter(consumerKey: key, consumerSecret: secret)
        swifter.authorizeWithCallbackURL(NSURL(string: "sweet://success")!, success: { _ in
            swifter.getStatusesHomeTimelineWithCount(cnt, success: { statuses in
                guard let tweets = statuses else { return }
                self.tweets = tweets.map {
                    let tweet = Tweets()
                    tweet.tweet = $0["text"].string!
                    tweet.name = $0["user"]["name"].string!
                    tweet.username = $0["user"]["screen_name"].string!
                    tweet.profile_img = $0["user"]["profile_image_url"].string!
                    tweet.timestamp = $0["created_at"].string!
                    tweet.id = $0["id"].integer!
                    return tweet
                }
            }, failure: failureHandler)
        }, failure: failureHandler)
    }
    
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return tweets.count
    }
}
