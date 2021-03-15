//
//  MutationViewController.swift
//  GraphQLPlay
//
//  Created by Christopher Devito on 8/7/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import UIKit

class MutationViewController: UIViewController {

    // MARK: - Properties
    let mutateGraphQLController = MutateGraphQLController()

    // MARK: - Outlets
    @IBOutlet weak var tokenLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        mutateGraphQLController.login { (result) in
            let login = try! result.get()
            print("Result: \(login)")
            DispatchQueue.main.async {
                self.tokenLabel.text = login.login

            }
        }
    }
}
