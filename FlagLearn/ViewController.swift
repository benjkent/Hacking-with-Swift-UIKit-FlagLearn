//
//  ViewController.swift
//  FlagLearn
//
//  Created by benjamin kent on 3/30/21.
//

import UIKit

class ViewController: UITableViewController {

    var flags = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        flags += ["estonia","france","germany","ireland","italy","monaco","poland","russia","spain","uk","us"]
        if let countryFileURL = Bundle.main.url(forResource: "Countries", withExtension: "txt") {
            if let countryContents = try? String(contentsOf: countryFileURL) {
                let country = countryContents.components(separatedBy: "\n")
                print(country)
                for name in country where name != "" {
                    flags.append(name)
                    

                }
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = flags[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController{
            vc.selectedImage = flags[indexPath.row].lowercased()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    

}

