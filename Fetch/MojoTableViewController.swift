import UIKit
import Alamofire


class MojoTableViewController: UITableViewController {
    var mojos: Array<Mojo>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request("https://www.mojotech.com/people.json").responseJSON { response in
            if let json = response.result.value as! NSArray! {
                self.mojos = json.map({ (element) -> Mojo in
                    let mojoDictionary = element as! Dictionary<String, String>

                    return Mojo(name: mojoDictionary["name"]!, json: mojoDictionary)!
                })
                
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
            let mojo = mojos[indexPath.row]
            
            cell.textLabel?.text = mojo.name
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
