//
//  QueryViewController.swift
//  GraphQLPlay
//
//  Created by Christopher Devito on 8/7/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import UIKit

class QueryViewController: UIViewController {
    // MARK: - Properties
    let graphQL = QueryGraphQLController()

    // MARK: - Outlets
    @IBOutlet weak var launchIDLabel: UILabel!
    @IBOutlet weak var launchIsBookedLabel: UILabel!
    @IBOutlet weak var missionNameLabel: UILabel!
    @IBOutlet weak var missionPatchLabel: UILabel!
    @IBOutlet weak var rocketNameLabel: UILabel!
    @IBOutlet weak var rocketIDLabel: UILabel!
    @IBOutlet weak var rocketTypeLabel: UILabel!
    @IBOutlet weak var launchSiteLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        graphQL.fetchLaunch { (result) in
            let launch = try! result.get()
            print("Result: \(launch)")
            DispatchQueue.main.async {
                self.launchIDLabel.text = launch.id
                self.launchIsBookedLabel.text = launch.isBooked ? "True" : "False"
                self.missionNameLabel.text = launch.mission.name
                self.missionPatchLabel.text = launch.mission.missionPatch
                self.rocketNameLabel.text = launch.rocket.name
                self.rocketIDLabel.text = launch.rocket.id
                self.rocketTypeLabel.text = launch.rocket.type
                self.launchSiteLabel.text = launch.site
            }
        }

    }
}

