//
//  File.swift
//  Registro
//
//  Created by Branchbit on 14/03/22.
//

import Foundation
import UIKit
import Charts

class GraphicsCell: UITableViewCell, EGPieChartDelegate  {
    func animationDidStart() {
        
    }
    
    func animationDidStop() {
        
    }
    
    lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = ColorManager.colorWhite
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var overLine: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = ColorManager.colorBlack
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.text = "Pregunta"
        label.textColor = ColorManager.colorBlack
        return label
    }()
    
    lazy var pieChartView: EGPieChartView = {
        let view = EGPieChartView()
        return view
    }()
    
    public var resto: [CGFloat] = [99]
   
    func requestDatas() {
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 0)
            DispatchQueue.main.async {
                var testDataArr: [CGFloat] = []
                var profile: [String] = []
                switch self.tag{
                    case 0:
                    let data: [CGFloat] = dataG.p1a
                    let prof: [String] = dataG.p1
                    profile = prof
                    testDataArr = data
                    case 1:
                    let data: [CGFloat] = dataG.p2a
                    let prof: [String] = dataG.p2
                    profile = prof
                    testDataArr = data
                    case 2:
                    let data: [CGFloat] = dataG.p3a
                    let prof: [String] = dataG.p3
                    profile = prof
                    testDataArr = data
                    case 3:
                    let data: [CGFloat] = dataG.p4a
                    let prof: [String] = dataG.p4
                    profile = prof
                    testDataArr = data
                default:
                    let data: [CGFloat] = dataG.p5a
                    let prof: [String] = dataG.p5
                    profile = prof
                    testDataArr = data
                }
                
//                let testDataArr: [CGFloat] = [55.2]
                var datas = [EGPieChartData]()
                for i in 0..<testDataArr.count {
                    
                    let data = EGPieChartData(value: testDataArr[i],
                                              content: "\(profile[i])")
                    datas.append(data)
                }
                let dataSource = EGPieChartDataSource(datas: datas)
                dataSource.setAllValueFont(.systemFont(ofSize: 11))
                dataSource.setAllValueTextColor(UIColor.black)
                
                let colors: [UIColor] = [.red, .green, .orange, .cyan, .lightGray]
//                let colors: [UIColor] = [.red]
                dataSource.fillColors = colors
                
//                let content = NSString(string: "I'm a Pie Chart")
//                let range = content.range(of: "Pie Chart")
//                let attr = NSMutableAttributedString(string: String(content))
//                attr.setAttributes([.foregroundColor: UIColor.blue, .font: UIFont.systemFont(ofSize: 14)], range: range)
//                dataSource.centerAttributeString = attr.copy() as? NSAttributedString
//                self.pieChartView.drawCenter = true
                self.pieChartView.dataSource = dataSource
                self.pieChartView.animate(1.5)
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        backgroundColor = ColorManager.colorWhite
        setupUIElements()
        setupConstraints()
        allGrphics()
        
        
    }
    
    func allGrphics() {
        pieChartView.drawOutsideValues = true
        pieChartView.line1AnglarOffset = 0.2
        pieChartView.line1Persentage = 0.95
        pieChartView.line1Lenght = 20
        pieChartView.line2Length = 15
        pieChartView.rotation = 270
        pieChartView.delegate = self
        requestDatas()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUIElements() {
        contentView.addSubview(containerView)
        containerView.addSubview(overLine)
        containerView.addSubview(nameLabel)
        containerView.addSubview(pieChartView)
        
    }
    
    fileprivate func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            overLine.topAnchor.constraint(equalTo: containerView.topAnchor),
            overLine.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            overLine.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            overLine.heightAnchor.constraint(equalToConstant: 1),
            
            nameLabel.topAnchor.constraint(equalTo: overLine.bottomAnchor,constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -10),
            
        ])
        
        pieChartView.frame = CGRect(x: 0 ,y: 40, width: contentView.frame.width , height: contentView.frame.width )
        pieChartView.outerRadius = contentView.frame.width / 2.0 - 40.0
    }
    
    @objc func finishEditing(){
        self.endEditing(true)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func updateInfoToShow(){
        
    }

}
