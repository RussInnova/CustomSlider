import UIKit

class ViewController: UIViewController {
    let rangeSlider = RangeSlider(frame: CGRect.zero)
    
    @IBOutlet weak var lowerValueLbl: UILabel?
    @IBOutlet weak var upperValueLbl: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(rangeSlider)
        
        rangeSlider.addTarget(self, action: #selector(ViewController.rangeSliderValueChanged(_:)), for: .valueChanged)
        
        let time = DispatchTime.now() + Double(Int64(NSEC_PER_SEC)) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: time) {
            self.rangeSlider.trackHighlightTintColor = UIColor.red
            self.rangeSlider.curvaceousness = 0.0
        }
    }
    
    override func viewDidLayoutSubviews() {
        let margin: CGFloat = 20.0
        let width = view.bounds.width - 2.0 * margin
        rangeSlider.frame = CGRect(x: margin, y: margin + topLayoutGuide.length,
                                   width: width, height: 31.0)
    }
    
    func rangeSliderValueChanged(_ rangeSlider: RangeSlider) {
        print("Range slider value changed: (\(rangeSlider.lowerValue) \(rangeSlider.upperValue))")
        self.lowerValueLbl?.text = String(format: "%.2f", rangeSlider.lowerValue)
        self.upperValueLbl?.text = String(format: "%.2f", rangeSlider.upperValue)
    }
}
