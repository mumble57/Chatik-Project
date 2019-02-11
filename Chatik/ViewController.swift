//
//  ViewController.swift
//  Chatik
//
//  Created by Hiii Power on 08.02.19.
//  Copyright © 2019 Hiii Power. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum States : String {
        case viewDidNotExist = "view did not exist",loadView = "loadView", viewDidLoad = "viewDidLoad", viewWillAppear = "viewWillAppear",  viewDidAppear = "viewDidAppear", viewWillLayoutSubviews = "viewWillLayoutSubviews", viewDidLayoutSubviews = "viewDidLayoutSubviews", viewWillDisappear = "viewWillDisappear", viewDidDisappear = "viewDidDisappear"
    }
    
    enum LogState{
        case On
        case Off
    }
    
    var presentState = States.viewDidNotExist
    var previousState = States.viewDidNotExist
    
    //Turn logs on/off here
    var logState = LogState.On
    //var logState = LogState.Off
    
    var output = String()
    func lifeCycle(previousState: String, presentState: String) -> String {
        switch logState {
        case .On:
            output = "Application did  " + previousState + " to state " + presentState
            return output
        case .Off:
            output = ""
            return output
        }
        
    }
    override func loadView() {
        super.loadView()
        previousState = presentState
        presentState = .loadView
        print(lifeCycle(previousState: previousState.rawValue, presentState: presentState.rawValue))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        previousState = presentState
        presentState = .viewDidLoad
        print(lifeCycle(previousState: previousState.rawValue, presentState: presentState.rawValue))
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        previousState = presentState
        presentState = .viewWillAppear
        print(lifeCycle(previousState: previousState.rawValue, presentState: presentState.rawValue))
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        previousState = presentState
        presentState = .viewDidAppear
        print(lifeCycle(previousState: previousState.rawValue, presentState: presentState.rawValue))
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        previousState = presentState
        presentState = .viewWillLayoutSubviews
        print(lifeCycle(previousState: previousState.rawValue, presentState: presentState.rawValue))
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        previousState = presentState
        presentState = .viewDidLayoutSubviews
        print(lifeCycle(previousState: previousState.rawValue, presentState: presentState.rawValue))
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        previousState = presentState
        presentState = .viewWillDisappear
        print(lifeCycle(previousState: previousState.rawValue, presentState: presentState.rawValue))
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        previousState = presentState
        presentState = .viewDidDisappear
        print(lifeCycle(previousState: previousState.rawValue, presentState: presentState.rawValue))
    }

}

