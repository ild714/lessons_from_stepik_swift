//
//  ViewController.swift
//  Views
//
//  Created by Ильдар Нигметзянов on 12/07/2019.
//  Copyright © 2019 Ildar Nigmetzyanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 1)
    @IBAction func stepperChanged(_ sender: UIStepper) {
        updateUI()
    }
    @IBOutlet weak var timeLabel: UILabel!
    
    
    private var isGameActive = false
    @IBAction func actionButtonTapped(_ sender: UIButton) {
        if isGameActive {
            stopGame()
        }
        else {
            startGame()
        }
    }
    
    @IBOutlet weak var stepper: UIStepper!
    private var gameTimeLeft : TimeInterval = 0
    
    
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var gameFieldView: GameFieldView!
    
    
    private func startGame() {
        score = 0
        repositionImagewithTimer()
        gameTimer?.invalidate()
        gameTimer = Timer.scheduledTimer(
            timeInterval : 1,
            target: self,
            selector:#selector(gameTimerTick),
            userInfo: nil,
            repeats:true
            )
        gameTimeLeft = stepper.value
        isGameActive = true
        updateUI()
    }
    private func stopGame() {
        isGameActive = false
        updateUI()
        gameTimer?.invalidate()
        timer?.invalidate()
        scoreLabel.text = "Последний счет : \(score)"
    }
    
    private func updateUI() {
        gameFieldView.isShapeHidden = !isGameActive
        stepper.isEnabled = !isGameActive
        if isGameActive {
             timeLabel.text = "Осталось \(Int(gameTimeLeft)) сек"
             actionButton.setTitle("Остановить", for: .normal)
        } else
        {
            timeLabel.text = "Время:\(Int(stepper.value))сек"
             actionButton.setTitle("Начать", for: .normal)
        }
    }
    
    // 2)
    private var gameTimer : Timer?
    private var timer : Timer?
    private let displayDuration : TimeInterval = 2
    private var score = 0
    @IBOutlet weak var scoreLabel: UILabel!
    //@IBOutlet weak var shapeY: NSLayoutConstraint!
    //@IBOutlet weak var shapeX: NSLayoutConstraint!
    func objectTaped() {
        guard isGameActive else {return}
        repositionImagewithTimer()
        score += 1
    }
    
    private func repositionImagewithTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(
            timeInterval : 2 ,
            target : self,
            selector : #selector(moveImage),
            userInfo : nil,
            repeats : true
        )
        timer?.fire()
    }
    
    //@IBOutlet weak var gameObject: UIImageView!
    
    @objc private func moveImage() {
        gameFieldView.randomizeShape()
        /*
        let maxX = gameFieldView.bounds.maxX - gameObject.frame.width
        let maxY = gameFieldView.bounds.maxY - gameObject.frame.height
        shapeX.constant = CGFloat(arc4random_uniform(UInt32(maxX)))
        shapeY.constant = CGFloat(arc4random_uniform(UInt32(maxY)))
        */
    }
    
    @objc private func gameTimerTick() {
        gameTimeLeft-=1
        if gameTimeLeft <= 0 {
            stopGame()
        } else
        {
            updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        gameFieldView.layer.borderWidth = 1
        gameFieldView.layer.borderColor = UIColor.gray.cgColor
        gameFieldView.layer.cornerRadius = 5
        updateUI()
        gameFieldView.shapeHitHandler = {[weak self] in
            self?.objectTaped()
        }
    }
}

