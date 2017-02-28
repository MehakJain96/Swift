
import UIKit

class ViewController: UIViewController {
    var numberOnScreen : Double = 0
    var previousNumber : Double = 0
    var performingMath : Bool = false
    var operation : Int = 0
    var calculationDone : Bool = false
    
    
    @IBOutlet weak var Label: UILabel!
    
    
    @IBAction func number(_ sender: UIButton) {
        if calculationDone{
            Label.text = ""
            previousNumber = 0
            performingMath = false
            operation = 0
            calculationDone = false
        }
        if performingMath {
            
            Label.text = String((sender.tag) - 1)
            numberOnScreen = Double(Label.text!)!
            performingMath = false
        }
        else {
            Label.text = Label.text! + String((sender.tag) - 1)
            numberOnScreen = Double(Label.text!)!
            
        }
    }
    
    
    @IBAction func button(_ sender: UIButton) {
        if calculationDone{
            calculationDone = false
        }
        
        if Label.text != "" && sender.tag > 11 && sender.tag < 16 {
            if previousNumber == 0 {
                previousNumber = Double(Label.text!)!
            }
            else {
                let z : Double = Double(Label.text!)!
                print(previousNumber,operation,z)
                previousNumber = DoOperation(x: previousNumber, oper: operation, y: z)
                print(previousNumber)
                operation = 0
            }
         
            if sender.tag == 12{ //divide
                Label.text = "/"
            }
            else if sender.tag == 13 {  //multiply
                Label.text = "x"
            }
            else if sender.tag == 14 {  //minus
                Label.text = "-"
            }
            else if sender.tag == 15 {  //add
                Label.text = "+"
            }
            performingMath = true
            operation = sender.tag
        }
        else if sender.tag == 16{
            Label.text = String(DoOperation(x: previousNumber, oper: operation, y: numberOnScreen))
            previousNumber = 0
            calculationDone = true
            
        }
        else if sender.tag == 11{
            Label.text = ""
            numberOnScreen = 0
            previousNumber = 0
            operation = 0
            performingMath = false
        }
    }
    
    func DoOperation(x:Double, oper:Int, y:Double ) -> Double{
        var result : Double = 0
        if oper == 12
        {
            result = x / y
        }
        else if oper == 13{
            result = x * y
        }
        else if oper == 14{
            result = x - y
        }
        else if oper == 15{
            result = x + y
        }
        return result
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

