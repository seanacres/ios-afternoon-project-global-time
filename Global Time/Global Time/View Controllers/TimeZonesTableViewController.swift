//
//  TimeZonesTableViewController.swift
//  Global Time
//
//  Created by Sean Acres on 7/18/19.
//  Copyright © 2019 Sean Acres. All rights reserved.
//

import UIKit

class TimeZonesTableViewController: UITableViewController {
    
    var timezones: [(id: String, name: String)] {
        let knownTimeZoneIdentifiers: [String] = TimeZone.knownTimeZoneIdentifiers
        var sortedTimezones: [(id: String, name: String)] = []
        
        for timeZoneID in knownTimeZoneIdentifiers {
            let timeZoneString = timeZoneID.components(separatedBy: "/").last?.capitalized.replacingOccurrences(of: "_", with: " ")
            sortedTimezones.append((timeZoneID, timeZoneString!))
        }
        
        sortedTimezones.sort(by: {$0.name < $1.name})
        return sortedTimezones
    }
    
    var delegate: TimeZoneDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timezones.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimeZoneCell", for: indexPath)

        let timezone = timezones[indexPath.row]
        cell.textLabel?.text = timezone.name

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let delegate = delegate else { return }
        
        tableView.deselectRow(at: indexPath, animated: false)
        delegate.didChooseTimeZone(timezones[indexPath.row].id)
    }

    @IBAction func cancelButtonTapped(_ sender: Any) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
