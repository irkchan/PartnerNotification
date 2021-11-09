import Foundation
import UIKit
import Macaw
import FanMenu

class ImageSelectViewController: UIViewController {
    @IBOutlet weak var fanMenu: FanMenu!
    @IBOutlet weak var colorLabel: UILabel!
    
    let colors = [0x231FE4, 0x00BFB6, 0xFFC43D, 0xFF5F3D, 0xF34766]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fanMenu.button = FanMenuButton(
            id: "main",
            image: "plus",
            color: Color(val: 0x7C93FE)
        )
        fanMenu.items = [
            FanMenuButton(
                id: "exchange_id",
                image: "exchange",
                color: Color(val: 0x9F85FF)
            ),
            FanMenuButton(
                id: "visa_id",
                image: "visa",
                color: Color(val: 0xF55B58)
            )
        ]
        
        fanMenu.menuRadius = 70.0
        fanMenu.duration = 0.2
        fanMenu.interval = (Double.pi, 2 * Double.pi)
        fanMenu.radius = 15.0
        
        // call before animation
        fanMenu.onItemDidClick = { button in
            print("ItemDidClick: \(button.id)")
        }
        // call after animation
        fanMenu.onItemWillClick = { button in
            print("ItemWillClick: \(button.id)")
        }
        
        fanMenu.transform = CGAffineTransform(rotationAngle: CGFloat(3 * Double.pi/2.0))
        
        fanMenu.backgroundColor = .clear
    }
    
    func hideTitle() {
        let newValue = !self.colorLabel.isHidden
        UIView.transition(
            with: colorLabel, duration: 0.5, options: .transitionCrossDissolve, animations: {
                self.colorLabel.isHidden = newValue
        }, completion: nil)
    }
    
    func mainButton(colorHex: Int) -> FanMenuButton {
        return FanMenuButton(
            id: "main",
            image: .none,
            color: Color(val: colorHex)
        )
    }
}
