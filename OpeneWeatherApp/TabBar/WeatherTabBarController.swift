
import UIKit

class WeatherTabBarController: UITabBarController {
    //MARK: Constants
    private let mainVC = MainViewController()
    
    //MARK: Variables
    lazy var mainButton = createSideButton(imageName: "mappin.and.ellipse", selector: #selector(mainButtonAction))
    lazy var addButton = createMidButton(selector: #selector(addbuttonAction))
    lazy var widgetButton = createSideButton(imageName: "list.star", selector: #selector(widgetButtonAction))
    lazy var sideButtonsHStack = createHStack([mainButton, widgetButton])
    
    //MARK: Lifecycle
    override func loadView() {
        super.loadView()
        
        drawTab()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        setTab()
        setButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
    }
    
    
    
    
    //MARK: Methods
    @objc private func mainButtonAction() {
        print("mainButtonAction")
    }
    
    @objc private func addbuttonAction() {
        print("addbuttonAction")
    }
    
    @objc private func widgetButtonAction() {
        let vc = WidgetsViewController()
        present(vc, animated: true)
    }
    
}

//MARK: - Extensions

private extension WeatherTabBarController {
    func setTab() {
        mainVC.tabBarItem.isEnabled = false

        self.tabBar.tintColor = .white
        setViewControllers([mainVC], animated: false)
    }
    
    func setButtons() {
        self.tabBar.addSubview(mainButton)
        self.tabBar.addSubview(widgetButton)
        self.tabBar.addSubview(addButton)
        self.tabBar.addSubview(sideButtonsHStack)
        
        NSLayoutConstraint.activate([
            sideButtonsHStack.widthAnchor.constraint(equalTo: tabBar.widthAnchor),
            sideButtonsHStack.heightAnchor.constraint(equalToConstant: 100),
            sideButtonsHStack.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
            sideButtonsHStack.centerYAnchor.constraint(equalTo: tabBar.centerYAnchor, constant: 25),
            
            mainButton.heightAnchor.constraint(equalToConstant: 50),
            mainButton.widthAnchor.constraint(equalToConstant: 50),
            
            widgetButton.heightAnchor.constraint(equalToConstant: 50),
            widgetButton.widthAnchor.constraint(equalToConstant: 50),
            
            addButton.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
            addButton.centerYAnchor.constraint(equalTo: tabBar.centerYAnchor, constant: -5),
            
            addButton.heightAnchor.constraint(equalToConstant: 64),
            addButton.widthAnchor.constraint(equalToConstant: 64)
            
        ])
    }
    
    func drawTab() {
        let path: UIBezierPath = getMainShapePath()
        let shape = CAShapeLayer()
        let pathT: UIBezierPath = getSubShapePath()
        let shapeT = CAShapeLayer()
        
        shape.path = path.cgPath
        shape.frame = CGRect(x: 0, y: 5, width: 0, height: 0)
        shape.lineWidth = 1
        shape.strokeColor = #colorLiteral(red: 0.4589999914, green: 0.5099999905, blue: 0.9570000172, alpha: 1).withAlphaComponent(0.5).cgColor
        shape.fillColor = #colorLiteral(red: 0.1449999958, green: 0.1410000026, blue: 0.2980000079, alpha: 1).withAlphaComponent(0.6).cgColor
        shape.zPosition = -1
        self.tabBar.layer.insertSublayer(shape, at: 0)
        
        shapeT.path = pathT.cgPath
        shapeT.frame = CGRect(x: 70, y: -5, width: 0, height: 0)
        shapeT.lineWidth = 1
        shapeT.strokeColor = #colorLiteral(red: 0.4589999914, green: 0.5099999905, blue: 0.9570000172, alpha: 1).withAlphaComponent(0.5).cgColor
        shapeT.fillColor = #colorLiteral(red: 0.1449999958, green: 0.1410000026, blue: 0.2980000079, alpha: 1)
        shapeT.zPosition = -1
        self.tabBar.layer.insertSublayer(shapeT, at: 1)
    }
    
    func getMainShapePath() -> UIBezierPath {
        let width = self.tabBar.bounds.width
        let height = self.tabBar.bounds.height + 40
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: -0.06504*height))
        path.addLine(to: CGPoint(x: 0.00019*width, y: -0.06699*height))
        path.addLine(to: CGPoint(x: -0.00064*width, y: -0.06778*height))
        path.addLine(to: CGPoint(x: -0.00064*width, y: -0.06504*height))
        path.addLine(to: CGPoint(x: -0.00064*width, y: 0.96748*height))
        path.addLine(to: CGPoint(x: -0.00064*width, y: 0.96951*height))
        path.addLine(to: CGPoint(x: 0, y: 0.96951*height))
        path.addLine(to: CGPoint(x: width, y: 0.96951*height))
        path.addLine(to: CGPoint(x: 1.00064*width, y: 0.96951*height))
        path.addLine(to: CGPoint(x: 1.00064*width, y: 0.96748*height))
        path.addLine(to: CGPoint(x: 1.00064*width, y: -0.06504*height))
        path.addLine(to: CGPoint(x: 1.00064*width, y: -0.06777*height))
        path.addLine(to: CGPoint(x: 0.99982*width, y: -0.06699*height))
        path.addLine(to: CGPoint(x: width, y: -0.06504*height))
        path.addCurve(to: CGPoint(x: 0.99981*width, y: -0.06699*height), controlPoint1: CGPoint(x: 0.99982*width, y: -0.06699*height), controlPoint2: CGPoint(x: 0.99982*width, y: -0.06699*height))
        path.addLine(to: CGPoint(x: 0.99981*width, y: -0.06698*height))
        path.addLine(to: CGPoint(x: 0.99978*width, y: -0.06695*height))
        path.addLine(to: CGPoint(x: 0.99967*width, y: -0.06685*height))
        path.addLine(to: CGPoint(x: 0.99925*width, y: -0.06645*height))
        path.addCurve(to: CGPoint(x: 0.99757*width, y: -0.06487*height), controlPoint1: CGPoint(x: 0.99887*width, y: -0.06609*height), controlPoint2: CGPoint(x: 0.99831*width, y: -0.06556*height))
        path.addCurve(to: CGPoint(x: 0.99107*width, y: -0.05884*height), controlPoint1: CGPoint(x: 0.99609*width, y: -0.06349*height), controlPoint2: CGPoint(x: 0.9939*width, y: -0.06145*height))
        path.addCurve(to: CGPoint(x: 0.96691*width, y: -0.03696*height), controlPoint1: CGPoint(x: 0.98542*width, y: -0.05362*height), controlPoint2: CGPoint(x: 0.97719*width, y: -0.04612*height))
        path.addCurve(to: CGPoint(x: 0.88471*width, y: 0.03264*height), controlPoint1: CGPoint(x: 0.94634*width, y: -0.01865*height), controlPoint2: CGPoint(x: 0.91756*width, y: 0.00626*height))
        path.addCurve(to: CGPoint(x: 0.67172*width, y: 0.1676*height), controlPoint1: CGPoint(x: 0.81898*width, y: 0.08541*height), controlPoint2: CGPoint(x: 0.73696*width, y: 0.14405*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.20279*height), controlPoint1: CGPoint(x: 0.6042*width, y: 0.19198*height), controlPoint2: CGPoint(x: 0.56778*width, y: 0.20279*height))
        path.addCurve(to: CGPoint(x: 0.32571*width, y: 0.1676*height), controlPoint1: CGPoint(x: 0.43222*width, y: 0.20279*height), controlPoint2: CGPoint(x: 0.39324*width, y: 0.19198*height))
        path.addCurve(to: CGPoint(x: 0.11401*width, y: 0.03264*height), controlPoint1: CGPoint(x: 0.26047*width, y: 0.14405*height), controlPoint2: CGPoint(x: 0.1791*width, y: 0.08541*height))
        path.addCurve(to: CGPoint(x: 0.03269*width, y: -0.03696*height), controlPoint1: CGPoint(x: 0.08148*width, y: 0.00626*height), controlPoint2: CGPoint(x: 0.05302*width, y: -0.01865*height))
        path.addCurve(to: CGPoint(x: 0.00882*width, y: -0.05884*height), controlPoint1: CGPoint(x: 0.02253*width, y: -0.04612*height), controlPoint2: CGPoint(x: 0.01441*width, y: -0.05362*height))
        path.addCurve(to: CGPoint(x: 0.00241*width, y: -0.06487*height), controlPoint1: CGPoint(x: 0.00602*width, y: -0.06145*height), controlPoint2: CGPoint(x: 0.00387*width, y: -0.06349*height))
        path.addCurve(to: CGPoint(x: 0.00075*width, y: -0.06645*height), controlPoint1: CGPoint(x: 0.00168*width, y: -0.06556*height), controlPoint2: CGPoint(x: 0.00112*width, y: -0.06609*height))
        path.addLine(to: CGPoint(x: 0.00033*width, y: -0.06685*height))
        path.addLine(to: CGPoint(x: 0.00022*width, y: -0.06695*height))
        path.addLine(to: CGPoint(x: 0.00019*width, y: -0.06698*height))
        path.addLine(to: CGPoint(x: 0.00019*width, y: -0.06698*height))
        path.addCurve(to: CGPoint(x: 0, y: -0.06504*height), controlPoint1: CGPoint(x: 0.00019*width, y: -0.06699*height), controlPoint2: CGPoint(x: 0.00019*width, y: -0.06699*height))
        path.close()
        return path
    }
    
    func getSubShapePath() -> UIBezierPath {
        let width = self.tabBar.bounds.width - 140
        let height = self.tabBar.bounds.height + 40
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0.42104*width, y: 0.00794*height))
        path.addLine(to: CGPoint(x: 0.57835*width, y: 0.00794*height))
        path.addCurve(to: CGPoint(x: 0.7721*width, y: 0.4901*height), controlPoint1: CGPoint(x: 0.6982*width, y: 0.00794*height), controlPoint2: CGPoint(x: 0.73378*width, y: 0.24694*height))
        path.addCurve(to: CGPoint(x: 0.98284*width, y: 0.99803*height), controlPoint1: CGPoint(x: 0.81178*width, y: 0.74184*height), controlPoint2: CGPoint(x: 0.85176*width, y: 0.99803*height))
        path.addLine(to: CGPoint(x: 0.01655*width, y: 0.99803*height))
        path.addCurve(to: CGPoint(x: 0.22729*width, y: 0.4901*height), controlPoint1: CGPoint(x: 0.14764*width, y: 0.99803*height), controlPoint2: CGPoint(x: 0.18762*width, y: 0.74184*height))
        path.addCurve(to: CGPoint(x: 0.42104*width, y: 0.00794*height), controlPoint1: CGPoint(x: 0.26561*width, y: 0.24694*height), controlPoint2: CGPoint(x: 0.3012*width, y: 0.00794*height))
        path.close()
        return path
    }
}
