//
//  ViewController.swift
//  DEV103 Assesment_Traffic Lights_Felix Sheahan_2
//
//  Created by Felix Sheahan on 16/6/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nextButton: UIButton!
    @IBOutlet var resetButton: UIButton!
    @IBOutlet var colourDescription: UILabel!
    @IBOutlet var lightColourCircle: UIImageView!
    @IBOutlet var appTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lightColour()
    }
    // Initial setting for Home Screen
    var lightStatus: Int = 0
    
    //Each press on the next button adds an Int to progress through the cases in the switch statement.
    @IBAction func nextPress(_ sender: Any) {
        lightStatus += 1
        lightColour()
    }
    
    
   
    
    func lightColour(){
        switch lightStatus {
        case 0://Home Screen
            view.backgroundColor = .white
            colourDescription.text = "Traffic lights play an important role in managing traffic flow and road safety. It is important to understand the three light colours and how they cycle between Green, Amber and Red.\n\nClick next to see how traffic lights flow."
            
            //Hides the Home button on the "home screen".
            resetButton.layer.opacity = 0
            lightColourCircle.layer.opacity = 0
            
            //Shows the title.
            appTitle.layer.opacity = 1
            
        case 1://Green Light
            view.backgroundColor = .white
            lightColourCircle.tintColor = .systemGreen
            
            //Shows the elements hidden on the "home screen".
            resetButton.layer.opacity = 1
            lightColourCircle.layer.opacity = 0.4
            
            //Hides the title.
            appTitle.layer.opacity = 0
            
            colourDescription.text = "Green means go! \n\n The green light indicates you can move through the light. Even though you have the right of way, it important to be wary of any potential hazards when moving through a green light.\n \n Click next for amber."
            
            
        case 2://Amber Light
            view.backgroundColor = .white
            lightColourCircle.tintColor = .systemOrange
            colourDescription.text = "Prepare to stop.\n\n The amber light is is the transition colour from green to red. It gives drivers a chance to slow down and stop in anticipation for the red light. A driver can move through an amber light but needs to do so safely. \n \n Click next for red."
            
        case 3://Red Light.
            view.backgroundColor = .white
            lightColourCircle.tintColor = .systemRed
            colourDescription.text = "STOP!\n\n You must stop at a red light and wait for it to turn green. Driving through a red light is dangerous and could jeopardise the safety of you and those around you.  \n\n Click next to go back to green."
            
            //This resets to the 1 case state.
            lightStatus -= 3
            
        default: //Doesn't get used but its a placeholder view for the Home screen.
            lightStatus = 0
        }
    }
    
    
    //Pressing the Home button will show view case 0.
    @IBAction func resetPress(_ sender: Any) {
        lightStatus = 0
        lightColour()
        
    }
    
    //Testing out a button animation.
    @IBAction func animateButton(sender: UIButton) {

        sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)

        UIView.animate(withDuration: 1.0,
                                   delay: 0,
                                   usingSpringWithDamping: CGFloat(0.20),
                                   initialSpringVelocity: CGFloat(3.0),
                                   options: UIView.AnimationOptions.allowUserInteraction,
                                   animations: {
                                    sender.transform = CGAffineTransform.identity
            },
                                   completion: { Void in()  }
        )
    }
}

