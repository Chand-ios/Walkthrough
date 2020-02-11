//
//  ViewController.swift
//  Walkthrough
//
//  Created by apple on 2/11/20.
//  Copyright © 2020 Terasoftware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var spotlightView = AwesomeSpotlightView()

    @IBOutlet weak var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSpotlight()
        spotlightView.start()
        view.addSubview(spotlightView)
        setupViews()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
       super.viewDidAppear(animated)
        setupSpotlight()
        spotlightView.start()

     }
    
    func setupViews() {
       btn.layer.cornerRadius = 8.0
       btn.clipsToBounds = true
       
     }
    
    
    func setupSpotlight() {
      let logoImageViewSpotlightRect = CGRect(x: btn.frame.origin.x, y: btn.frame.origin.y, width: btn.frame.size.width, height: btn.frame.size.height)
      let logoImageViewSpotlightMargin = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
      let logoImageViewSpotlight = AwesomeSpotlight(withRect: logoImageViewSpotlightRect, shape: .circle, text: "logoImageViewSpotlight", margin: logoImageViewSpotlightMargin)
       // spotlightView = AwesomeSpotlightView(frame: btn.frame)
      spotlightView = AwesomeSpotlightView(frame: view.frame, spotlight: [logoImageViewSpotlight])
      spotlightView.cutoutRadius = 8
      spotlightView.delegate = self
    }

}

extension ViewController : AwesomeSpotlightViewDelegate {

func spotlightView(_ spotlightView: AwesomeSpotlightView, willNavigateToIndex index: Int) {
  print("spotlightView willNavigateToIndex index = \(index)")
}

func spotlightView(_ spotlightView: AwesomeSpotlightView, didNavigateToIndex index: Int) {
  print("spotlightView didNavigateToIndex index = \(index)")
}

func spotlightViewWillCleanup(_ spotlightView: AwesomeSpotlightView, atIndex index: Int) {
  print("spotlightViewWillCleanup atIndex = \(index)")
}

func spotlightViewDidCleanup(_ spotlightView: AwesomeSpotlightView) {
  print("spotlightViewDidCleanup")
}

}
