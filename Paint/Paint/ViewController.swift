//
//  ViewController.swift
//  Paint
//
//  Created by MacBook on 17.10.2022.
//

import UIKit

class ViewController: UIViewController {

    let canvas = Canvas()
    let settingsView = UIView()
    
    let switchLabel: UILabel = {
        let label = UILabel()
        label.text = "Fill"
        label.textColor = .black
        label.textAlignment = .right
        return label
    }()
    
    let switchDemo: UISwitch = {
        let switchDemo = UISwitch()
        switchDemo.addTarget(self, action: #selector(switchStateDidChange(_:)), for: .valueChanged)
        switchDemo.setOn(false, animated: false)
        return switchDemo
    }()
    
    let undoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "undo.png"), for: .normal)
        button.addTarget(self, action: #selector(handleUndo), for: .touchUpInside)
        return button
    }()
    
    let clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "eraser.png"), for: .normal)
//        button.setTitle("Clear", for: .normal)
//        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleClear), for: .touchUpInside)
        return button
    }()
    let yellowButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .yellow
        button.layer.borderWidth = 0.5
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    let redButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        button.layer.borderWidth = 0.5
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    let blueButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.layer.borderWidth = 0.5
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    let greenButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .green
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    let purpleButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .purple
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    let brownButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .brown
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    let orangeButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .orange
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    
//    let slider: UISlider = {
//        let slider = UISlider()
//        slider.minimumValue = 1
//        slider.maximumValue = 25
//        slider.addTarget(self, action: #selector(handleSlideSelector), for: .valueChanged)
//        return slider
//    }()
    
    let circleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "circle.png"), for: .normal)
        button.tag = 2
        button.addTarget(self, action: #selector(handleShapeChange), for: .touchUpInside)
        return button
    }()
    let squareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "rectangle.png"), for: .normal)
        button.tag = 3
        button.addTarget(self, action: #selector(handleShapeChange), for: .touchUpInside)
        return button
    }()
    let triangleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "triangle.png"), for: .normal)
        button.tag = 5
        button.addTarget(self, action: #selector(handleShapeChange), for: .touchUpInside)
        return button
    }()
    let lineButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "line.png"), for: .normal)
        button.tag = 4
        button.addTarget(self, action: #selector(handleShapeChange), for: .touchUpInside)
        return button
    }()
    let pencilButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "pen.png"), for: .normal)
        button.tag = 1
        button.addTarget(self, action: #selector(handleShapeChange), for: .touchUpInside)
        return button
    }()
    
    
    @objc fileprivate func handleUndo(){
        print("Undo lines drawn")
        canvas.undo()
    }
    @objc func handleClear(){
        print("Cleared")
        canvas.clear()
    }
    @objc fileprivate func handleShapeChange(button: UIButton){
        let tag = button.tag
        canvas.setShape(number: tag)
    }
    @objc fileprivate func handleColorChange(button: UIButton) {
        canvas.setStrokeColor(color: button.backgroundColor ?? .black)
//        canvas.setStrokeWidth(width: slider.value - 10)
    }
//    @objc fileprivate func handleSlideSelector(){
//        print(slider.value)
//        canvas.setStrokeWidth(width: slider.value)
//    }
    @objc fileprivate func switchStateDidChange(_ sender:UISwitch) {
        canvas.setFill()
    }
    
    
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        canvas.backgroundColor = .white
//        setupLayout()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let beige = UIColor.white
        view.backgroundColor = .white
        canvas.backgroundColor = beige
        canvas.setShape(number: 1)
        settingsView.backgroundColor = .white
        
        setupLayout()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector (handleUndo))  //Tap function will call when user tap on button
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleClear))  //Long function will call when user long press on button.
           tapGesture.numberOfTapsRequired = 1
           undoButton.addGestureRecognizer(tapGesture)
           undoButton.addGestureRecognizer(longGesture)
        
    }
    
    fileprivate func setupLayout() {
        let colorsStackView = UIStackView(arrangedSubviews: [orangeButton, blueButton, purpleButton, redButton, greenButton, yellowButton, brownButton, undoButton, clearButton])
        colorsStackView.distribution = .fillEqually
        colorsStackView.spacing = 0
        
        let shapeStackView = UIStackView(arrangedSubviews: [circleButton, squareButton,  pencilButton, triangleButton, lineButton])
        shapeStackView.distribution = .fillEqually
        shapeStackView.spacing = 10
        
        
        let switchStackView = UIStackView(arrangedSubviews: [switchLabel, switchDemo])
        switchStackView.distribution = .fillEqually
        switchStackView.spacing = 3
        
        let stackView = UIStackView(arrangedSubviews: [
            shapeStackView,
            switchStackView,
            colorsStackView,
            ])
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        view.addSubview(settingsView)
        view.addSubview(canvas)
        
        settingsView.addSubview(stackView)
        settingsView.translatesAutoresizingMaskIntoConstraints = false
        settingsView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        settingsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        settingsView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        settingsView.heightAnchor.constraint(equalToConstant: 100).isActive = true
                
        colorsStackView.translatesAutoresizingMaskIntoConstraints = false
        colorsStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        switchDemo.translatesAutoresizingMaskIntoConstraints = false
        switchDemo.topAnchor.constraint(equalTo: switchStackView.topAnchor, constant: 10).isActive = true

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: settingsView.leadingAnchor, constant: 16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: settingsView.trailingAnchor, constant: -16).isActive = true
        stackView.centerYAnchor.constraint(equalTo: settingsView.centerYAnchor).isActive = true
        
        canvas.translatesAutoresizingMaskIntoConstraints = false
        canvas.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        canvas.topAnchor.constraint(equalTo: settingsView.bottomAnchor).isActive = true
        canvas.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        canvas.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

}

    
//    fileprivate func setupLayout() {
//        canvas.frame = view.frame
//        let colorStackView = UIStackView(arrangedSubviews: [
//                                         yellowButton,
//                                         redButton,
//                                         blueButton,
//                                                           ])
//
//        let shapeStackView = UIStackView(arrangedSubviews: [
//            circleButton,
//            squareButton,
//            lineButton,
//            pencilButton,
//        ])
//
//        shapeStackView.distribution = .fillEqually
//        shapeStackView.spacing = 10
//
//        let switchStackView = UIStackView(arrangedSubviews: [switchLabel, switchDemo])
//        switchStackView.distribution = .fillEqually
//        switchStackView.spacing = 3
//
//            let stackView = UIStackView(arrangedSubviews: [
//                slider,
//                shapeStackView,
//                colorStackView,
//                switchStackView,
//            ])
//        stackView.spacing = 10
//        stackView.distribution = .fillEqually
//
//
//            view.addSubview(stackView)
//            stackView.translatesAutoresizingMaskIntoConstraints = false
//            stackView.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
//            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
//            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
//        }
//
//}

