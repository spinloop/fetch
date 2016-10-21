import UIKit
import Alamofire

class SubmitViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onSubmit(_ sender: AnyObject) {
        let params  = [
            "firstName": self.firstName.text!,
            "lastName": self.lastName.text!,
            "email": self.email.text!
        ]
        
        print(params)
                
        Alamofire.request("http://localhost:3000/goats/new", parameters: params).responseJSON { response in
            if let json = response.result.value {
                print("JSON: \(json)")
            }
        }
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
