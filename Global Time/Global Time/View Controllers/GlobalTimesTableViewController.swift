//
//  GlobalTimesTableViewController.swift
//  Global Time
//
//  Created by Sean Acres on 7/18/19.
//  Copyright © 2019 Sean Acres. All rights reserved.
//

import UIKit

protocol TimeZoneDelegate {
    func didChooseTimeZone(_ timezone: String)
}

class GlobalTimesTableViewController: UITableViewController {

    var selectedTimeZones: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Global Time Zones"
        
        selectedTimeZones.append(TimeZone.current.identifier)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return selectedTimeZones.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ClockCell", for: indexPath) as? ClockTableViewCell else  {
            return UITableViewCell()
        }

        let timeZoneID = selectedTimeZones[indexPath.row]
        cell.clockView.timezone = TimeZone(identifier: timeZoneID)
        cell.timeZoneName.text = timeZoneID.components(separatedBy: "/").last?.capitalized

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            selectedTimeZones.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let timezoneTableVC = segue.destination.children.first as? TimeZonesTableViewController else { return }
        timezoneTableVC.delegate = self
    }
}

extension GlobalTimesTableViewController: TimeZoneDelegate {
    func didChooseTimeZone(_ timezone: String) {
        dismiss(animated: true, completion: nil)
        selectedTimeZones.append(timezone)
        tableView.reloadData()
    }
}
