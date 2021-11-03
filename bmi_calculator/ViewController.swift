import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var calculateButton: UIButton!
    
    private var weight:Int = 0;
    private var height:Int = 0;
    
    @IBAction func weightSlider(_ sender: UISlider) {
        weight = Int(sender.value)
        weightLabel.text = "Weight : \(weight)"
        if(height != 0){
            calculateButton.isEnabled = true
        }
    }
    
    @IBAction func heightSlider(_ sender: UISlider) {
        height = (Int(sender.value))
        heightLabel.text = "Height : \(height)"
        if(weight != 0){
            calculateButton.isEnabled = true
        }
    }
    
    @IBAction func calculateButton(_ sender: Any) {
        if(resultLabel.text?.isEmpty == true){
            calculate()
        }else{
            reset()
        }
    }
    
    private func calculate(){
        let res = Double(weight) / (pow( Double(height) / 100.0, 2.0))
        resultLabel.text = getResults(result: Double(res))
        calculateButton.setTitle("Reset", for: .normal)
        calculateButton.tintColor = UIColor.red
    }
    
    private func reset() {
        heightSlider.value = 0
        weightSlider.value = 0
        weightLabel.text = "Weight"
        heightLabel.text = "Height"
        calculateButton.setTitle("Calculate", for: .normal)
        calculateButton.tintColor = UIColor.systemBlue
        resultLabel.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heightSlider.minimumValue = 130.0
        heightSlider.maximumValue = 230.0
        
        weightSlider.minimumValue = 30.0
        weightSlider.maximumValue = 230.0
        
        calculateButton.isEnabled = false
    }
    
    private func getResults (result:Double) -> String {
        if(result < 16.0) {
            return "Underweight (Severe thinness)";
        }
        else if((result >= 16.0) && (result <= 16.9)){
            return "Underweight (Moderate thinness)"
        }
        else if((result >= 17.0) && (result <= 18.4)){
            return "Underweight (Mild thinness)"
        }
        else if((result >= 18.5) && (result <= 24.9)){
            return "Normal range"
        }
        else if((result >= 25.0) && (result <= 29.9)){
            return "Overweight (Pre-obese)"
        }
        else if((result >= 30.0) && (result <= 34.9)){
            return "Obese (Class I)"
        }
        else if((result >= 35.0) && (result <= 39.9)){
            return "Obese (Class II)"
        }
        else if(result >= 40.0){
            return "Obese (Class III)"
        }
        return ""
    }


}

