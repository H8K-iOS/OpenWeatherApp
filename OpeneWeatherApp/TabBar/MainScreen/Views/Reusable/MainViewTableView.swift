import UIKit

class MainViewTableViewCell: UITableViewCell {
    //MARK: Identifier
    static var identifier = "MainViewTableViewCell"
    
    //MARK: Constansts
    lazy var temperatureLabel = createTemperatureLabel()
    lazy var weatherDescriptionLabel = createWeatherDescLabel()
    lazy var currentLocationLabel = createLocationLabel()
    lazy var maxTempLabel = createMinMaxLabel()
    lazy var minTempLabel = createMinMaxLabel()
    lazy var temperatureVStack = createStack(axis: .vertical, aligment: .center, spacing: -40)
    lazy var maxMinHStack = createStack(axis: .horizontal, aligment: .center, spacing: 5)
    lazy var maxMinVStack = createStack(axis: .vertical, aligment: .leading, spacing: 3)
    
    //MARK: Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        self.backgroundColor = .clear
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Methods
    private func setupUI() {
        self.addSubview(temperatureLabel)
        self.addSubview(weatherDescriptionLabel)
        self.addSubview(currentLocationLabel)
        self.addSubview(maxTempLabel)
        self.addSubview(minTempLabel)
        self.addSubview(maxMinHStack)
        self.addSubview(maxMinVStack)
        self.addSubview(temperatureVStack)
        
        temperatureVStack.addArrangedSubview(currentLocationLabel)
        temperatureVStack.addArrangedSubview(temperatureLabel)
        maxMinVStack.addArrangedSubview(weatherDescriptionLabel)
        maxMinVStack.addArrangedSubview(maxMinHStack)
        maxMinHStack.addArrangedSubview(maxTempLabel)
        maxMinHStack.addArrangedSubview(minTempLabel)
        
        NSLayoutConstraint.activate([
            temperatureVStack.topAnchor.constraint(equalTo: self.topAnchor, constant: -30),
            temperatureVStack.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: +10),
        
            maxMinVStack.topAnchor.constraint(equalTo: temperatureVStack.bottomAnchor, constant: -10),
            maxMinVStack.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: +10),
            
        ])
    }
    
    public func updateCell(with model: WeatherModel) {
        guard let hourly = model.hourly.first else { return }
        currentLocationLabel.text = model.city
        temperatureLabel.text = String(format: "%0.0f" + "°", hourly.temp)
        guard let desc = hourly.weatherDetail.first?.weatherDescription else { return }
        weatherDescriptionLabel.text = desc.capitalize
        
        guard let daily = model.daily.first else { return }
        maxTempLabel.text = String(format: "H: " + "%0.0f" + "°", daily.temp.max)
        minTempLabel.text = String(format: "L: " + "%0.0f" + "°", daily.temp.min)
    }
}
