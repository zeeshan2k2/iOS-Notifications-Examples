//
//  ViewController.swift
//  iOS-Notifications-Examples
//
//  Created by Zeeshan Waheed on 09/03/2026.
//

import UIKit

class MainMenuViewController: UITableViewController {

    let sections = [
        ("Local Notifications", [
            "Time Trigger",
            "Interval Trigger",
            "Location Trigger",
            "Event Trigger"
        ]),
        ("Remote Notifications", [
            "APNs",
            "Firebase (FCM)"
        ])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Notifications Examples"

        tableView = UITableView(frame: .zero, style: .insetGrouped)

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return sections[section].1.count
    }

    override func tableView(
        _ tableView: UITableView,
        titleForHeaderInSection section: Int
    ) -> String? {
        return sections[section].0
    }

    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = sections[indexPath.section].1[indexPath.row]
        cell.accessoryType = .disclosureIndicator

        return cell
    }

    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {

        tableView.deselectRow(at: indexPath, animated: true)

        if indexPath.section == 0 && indexPath.row == 0 {

            let storyboard = UIStoryboard(name: "Main", bundle: nil)

            let vc = storyboard.instantiateViewController(
                withIdentifier: "TimeTriggerViewController"
            ) as! TimeTriggerViewController

            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
