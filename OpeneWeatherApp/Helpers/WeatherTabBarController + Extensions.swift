
import UIKit

extension WeatherTabBarController {
    func createSideButton(imageName: String, selector: Selector) -> UIView {
        let tapGesture = UITapGestureRecognizer(target: self, action: selector)
        
        let img = UIImageView()
        img.image = UIImage(systemName: imageName)
        img.tintColor = .white
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        
        img.widthAnchor.constraint(equalToConstant: 30).isActive = true
        img.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 50).isActive = true
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapGesture)
        view.addSubview(img)
        
        img.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        img.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        return view
    }
    
    func createMidButton(selector: Selector) -> UIView {
        let tapGesture = UITapGestureRecognizer(target: self, action: selector)
        
        let img = UIImageView()
        img.image = UIImage(systemName: "plus")
        img.tintColor = #colorLiteral(red: 0.2820000052, green: 0.1920000017, blue: 0.6159999967, alpha: 1)
        
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        
        img.widthAnchor.constraint(equalToConstant: 34).isActive = true
        img.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 32
        view.layer.borderColor = UIColor.darkGray.cgColor
        view.layer.borderWidth = 3
        view.layer.shadowColor = #colorLiteral(red: 0.2820000052, green: 0.1920000017, blue: 0.6159999967, alpha: 1).withAlphaComponent(1).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.8
        
        view.widthAnchor.constraint(equalToConstant: 64).isActive = true
        view.heightAnchor.constraint(equalToConstant: 64).isActive = true
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapGesture)
        view.addSubview(img)
        
        img.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        img.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        return view
    }
    
    func createHStack(_ subViews: [UIView]) -> UIStackView {
        let hs = UIStackView(arrangedSubviews: subViews)
        hs.translatesAutoresizingMaskIntoConstraints = false
        hs.axis = .horizontal
        hs.distribution = .fillEqually
        hs.alignment = .leading
        hs.spacing = 180
        hs.backgroundColor = .clear
        return hs
    }
}
