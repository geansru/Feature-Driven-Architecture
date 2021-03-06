//
//  ScreenLaunchers.swift
//  BlogApp
//
//  Created by Bohdan Orlov on 31/03/2018.
//  Copyright © 2018 Bohdan Orlov. All rights reserved.
//

import Foundation
import UIKit
import Domain
import UI
import Features

extension LoginScreenFeature {
    static func launch(rootViewController: UIViewController,
                                sessionService: SessionServiceProtocol,
                                didLogin: @escaping (Session) -> Void) {
        LoginScreenFeature(loginViewController: LoginViewController(),
                           viewControllerPresenter: ViewControllerPresenter(rootViewController: rootViewController, application: .shared),
                           sessionService: sessionService,
                           didLogin: didLogin)
    }
}

extension PostsScreenFeature {
    static func launch(viewController: UIViewController, userId: Int, networkService: NetworkRequestSending, didPrepareButtonContainer: @escaping (UIView) -> Void) {
        PostsScreenFeature(postsViewController: PostsViewController(),
                           viewControllerPresenting: ViewControllerPresenter(rootViewController: viewController, application: .shared),
                           userId: userId,
                           postsRepository: PostsRepository(networkService: networkService),
                           didPrepareButtonContainer: didPrepareButtonContainer)
    }
}

extension CommentsScreenFeature {
    static func launch(viewController: UIViewController, userId: Int, networkService: NetworkRequestSending) {
        let postsRepository = PostsRepository(networkService: networkService)
        let commentsRepository = CommentsRepository(networkService: networkService)
        let userCommentsRepository = UserCommentsRepository(postsRepository: postsRepository,
                                                            commentsRepository: commentsRepository)
        CommentsScreenFeature(commentsViewController: StringsTableViewController(),
                              viewControllerPresenting: ViewControllerPresenter(rootViewController: viewController, application: .shared),
                              userId: userId,
                              commentsRepository: userCommentsRepository)
    }
}
