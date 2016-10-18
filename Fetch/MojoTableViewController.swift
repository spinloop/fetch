import UIKit
import Alamofire

class MojoTableViewController: UITableViewController {
    var mojos: NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request("https://www.mojotech.com/people.json").responseJSON { response in
            if let json = response.result.value as! NSArray! {
                print("JSON: \(json[0])")

                self.mojos = json
                
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let mojos = self.mojos else {
            return 0
        }
        
        return mojos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mojo", for: indexPath)
        
        if let mojos = self.mojos {
            let mojo = mojos[indexPath.row] as! Dictionary<String, String>
            
            cell.textLabel?.text = mojo["name"]
        }

        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
