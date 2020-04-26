//
//  ViewController.swift
//  H202-Spray-Stopwatch
//
//  Created by Paul Osman on 04/08/2015.
//  Copyright (c) 2015 Paul Osman. All rights reserved.
//
//  User depracted code

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var timer = NSTimer()
    
    var minutes:Int = 0
    
    var seconds:Int = 0
    
    var hundredths:Int = 0
    
    var spraySteps = [""]
    
    var sprayTime = [""]
    
    var startStopwatch:Bool = true
    
    var addStep:Bool = false
    
    var stopwatchString:String = ""

    @IBOutlet weak var stopwatchLB: UILabel!
    
    @IBOutlet weak var stepsTV: UITableView!
    
    @IBOutlet weak var startStopUIB: UIButton!
    
    @IBOutlet weak var resetUIB: UIButton!
    
    @IBAction func startStopUIBTapped(sender: AnyObject) {
        
        if startStopwatch == true {
            
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("updateStopwatch"), userInfo: nil, repeats: true)
            
            startStopwatch = false
            
            startButtonStop()
            
            resetUIB.enabled = false
            
            stepsTV.scrollEnabled = false

        } else {
            
            timer.invalidate()
            
            startStopwatch = true
            
            startButtonStart()
            
            resetUIB.enabled = true
            
            stepsTV.scrollEnabled = true
            
        }
    }
    
    func scrollToFirstRow() {
        
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        
        self.stepsTV.scrollToRowAtIndexPath(indexPath, atScrollPosition: .Top, animated: true)
    }
    
    func commonMethoda() {
        
        stepsTV.reloadData()
        
        scrollToFirstRow()
        
    }
    
    @IBAction func resetUIBTapped(sender: AnyObject) {
        
        resetAll()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetAll()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startButtonStart() {
        
        startStopUIB.setImage(UIImage(named: "StartButton.png"), forState: UIControlState.Normal)
        
    }
    
    func startButtonStop() {
        
        startStopUIB.setImage(UIImage(named: "StopButton.png"), forState: UIControlState.Normal)
        
    }
    
    func resetAll () {
        
        minutes = 0
        
        seconds = 0
        
        hundredths = 0
        
        stopwatchString = "00:00.00"
        
        stopwatchLB.text = stopwatchString
        
        resetUIB.enabled = false
        
        startStopUIB.enabled = true
        
        startStopwatch = true
        
        startButtonStart()
        
        spraySteps.removeAll(keepCapacity: false)
        
        sprayTime.removeAll(keepCapacity: false)
        
        stepsTV.reloadData()
        
    }
    
    func updateStopwatch() {
        
        hundredths += 1
        if hundredths == 100 {
            
            seconds += 1
            hundredths = 0
            
            }
        
        if seconds == 60 {
            
            minutes += 1
            seconds = 0
            
            }
        
        let hundredthsString = hundredths > 9 ? "\(hundredths)" : "0\(hundredths)"
        
        let secondsString = seconds > 9 ? "\(seconds)" : "0\(seconds)"
        
        let minutesString = minutes > 9 ? "\(minutes)" : "0\(minutes)"
        
            stopwatchString = "\(minutesString):\(secondsString).\(hundredthsString)"
        
            stopwatchLB.text = stopwatchString
        
        if minutes == 0 && seconds == 0 && hundredths == 1 {
            
            sprayTime.insert("00:00.00", atIndex: 0)
            
            spraySteps.insert("Step: Tank Filling STARTED", atIndex: 0)
            
            sprayTime.insert("00:00.00", atIndex: 0)
            
            spraySteps.insert("Spray Tank filling valve M-Y034 OPEN", atIndex: 0)
            
            sprayTime.insert("00:00.00", atIndex: 0)
            
            spraySteps.insert("H202 Pump ON", atIndex: 0)
            
            commonMethoda()
            
        }
        
        if minutes == 0 && seconds == 10 && hundredths == 0 {
            
            sprayTime.insert("00:10.00", atIndex: 0)
            
            spraySteps.insert("Spray tank high level probe ON", atIndex: 0)
            
            commonMethoda()
            
        }
        
        if minutes == 0 && seconds == 11 && hundredths == 0 {
            
            sprayTime.insert(stopwatchString, atIndex: 0)
            
            spraySteps.insert("Spray Tank filling valve M-Y034 CLOSED", atIndex: 0)
            
            sprayTime.insert(stopwatchString, atIndex: 0)
            
            spraySteps.insert("H202 Pump OFF", atIndex: 0)
            
            commonMethoda()
            
        }

        if minutes == 0 && seconds == 11 && hundredths == 0 {
            
            sprayTime.insert("00:11.00", atIndex: 0)
            
            spraySteps.insert("Step: Filling ENDED", atIndex: 0)
            
            commonMethoda()
            
        }
        
        if minutes == 0 && seconds == 10 && hundredths == 50 {
            
            sprayTime.insert("00:11.00", atIndex: 0)
            
            spraySteps.insert("Step: Spraying STARTED", atIndex: 0)
            
            commonMethoda()
            
        }
        
        if minutes == 0 && seconds == 11 && hundredths == 0 {
            
            sprayTime.insert("00:11.00", atIndex: 0)
            
            spraySteps.insert("Spraying valve M-Y035 OPEN", atIndex: 0)
            
            sprayTime.insert("00:11.00", atIndex: 0)
            
            spraySteps.insert("Air to Spray tank valve M-Y004 OPEN", atIndex: 0)
            
            commonMethoda()
            
        }
        
        if minutes == 0 && seconds == 19 && hundredths == 0 {
            
            sprayTime.insert("00:19.00", atIndex: 0)
            
            spraySteps.insert("Filler looking for Tank Low level Probe ON", atIndex: 0)
            
            commonMethoda()
            
        }
        
        if minutes == 0 && seconds == 45 && hundredths == 0 {
            
            sprayTime.insert("00:45.00", atIndex: 0)
            
            spraySteps.insert("Filler stopped looking for Tank Low level Probe ON", atIndex: 0)
            
            commonMethoda()
            
        }
        
        if minutes == 0 && seconds == 50 && hundredths == 00 {
            
            sprayTime.insert("00:50.00", atIndex: 0)
            
            spraySteps.insert("Step: Spraying ENDED", atIndex: 0)
            
            commonMethoda()
            
        }
        
        if minutes == 0 && seconds == 51 && hundredths == 0 {
            
            sprayTime.insert("00:50.00", atIndex: 0)
            
            spraySteps.insert("Step: Pause STARTED", atIndex: 0)
            
            commonMethoda()
            
        }
        
        if minutes == 1 && seconds == 51 && hundredths == 50 {
            
            sprayTime.insert("01:52.00", atIndex: 0)
            
            spraySteps.insert("Air to Spray tank valve M-Y004 CLOSED", atIndex: 0)
            
            sprayTime.insert("01:52.00", atIndex: 0)
            
            spraySteps.insert("Spraying valve M-Y035 CLOSED", atIndex: 0)
            
            commonMethoda()
            
        }
        
        if minutes == 1 && seconds == 51 && hundredths == 50 {
            
            sprayTime.insert("01:52.00", atIndex: 0)
            
            spraySteps.insert("Spraying is complete", atIndex: 0)
            
            commonMethoda()
            
        }
        
        if minutes == 1 && seconds == 52 {
            
            timer.invalidate()
            
            resetUIB.enabled = true
            
            startStopUIB.enabled = false
            
        }
        
    }
    
    //tableView Methods
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "Cell")
        
        cell.detailTextLabel!.textColor = UIColor.blackColor()
        
        cell.backgroundColor = self.view.backgroundColor
        
        cell.textLabel?.font = UIFont(name: "Helvetica Neue", size: 12)
        
        cell.detailTextLabel?.font = UIFont(name: "Helvetica Neue", size: 12)
        
        cell.textLabel!.text = sprayTime[indexPath.row]
        
        cell.detailTextLabel!.text = spraySteps[indexPath.row]
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return spraySteps.count
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if spraySteps[indexPath.row] == "Step: Tank Filling STARTED" || spraySteps[indexPath.row] ==  "Step: Filling ENDED" {
            
            displayStepInfo("Step: Tank Filling STARTED:\nThe purpose of the Spraying step is to coat all the surfaces of the Aseptic Chamber with H202 to ensure it is sterile.\n\nThe first interim step of this process is to fill the Spray Tank with H202.\n\nThe H202 Pump (MM010) is turned on and the Tank Filling valve (M.Y034) is opened, after 10 seconds the Spray Tank high level probe (MB043.2) is checked to indicate that the tank is full.\n\nIf the tank is full the filling valve (M.Y034) is closed and the filler will move on to the next interim step 'spraying'.\n\nIf the high level probe has not been made there will be an alarm at 12 seconds and the filler will step down.")
            
        }
        
        if spraySteps[indexPath.row] == "Step: Spraying STARTED" || spraySteps[indexPath.row] == "Step: Spraying ENDED" {
            
            displayStepInfo("Step: Spraying STARTED:\n\nDuring The Spraying step the Aseptic Chamber is sprayed with H202.\n\nThe Spraying Valve (M.Y035) and Compressed Air valve (M.Y004) open, the CA will push the H202 from the tank to the H202 Evaporator. Inside the Evaporator the H202 is vapourised with hot air from the Superheater, this H202-rich vapour then flows through the Air Knife and B-Valve/Filling Pipe/LS Element/LS Short-Stop Element into the Aseptic Chamber.\n\nAlso during this step the Bending Roller rotates and the Suction Valve is positioned to allow exhaustion from the H202 bath.\n\nAt 19 seconds the filler will check the Spray Tank Low Level Probe (MB043.1), if there is no level detected the filler will go into venting as the tank has emptied too fast.\n\nIf after 50 seconds there is still a level detected at the Low Level Probe (MB043.1) then the Filler will go into venting as the Spray Tank has taken too long to empty\n\nIf at 50 seconds there is no level detected at the Low Level Probe (MB043.1) spraying is OK and the Filler will move on to the next step which is 'Pause'.")
            
        }
        
        if spraySteps[indexPath.row] == "Step: Pause STARTED" || spraySteps[indexPath.row] == "Step: Pause ENDED" {
            
            displayStepInfo("Step: Pause STARTED:\n\nDuring this interim step the H202 vapour will condense on the cold surfaces of the Aseptic Chamber.\n\nThe Air Inlet Valve will change position to bypass the Aseptic Chamber and allow air to flow directly to the compressor.\n\nThe Heat Exchanger Valve changes position to allow cold air to flow via the Heat Exchanger to cool the heated air from the Superheater.\n\nDuring 'Pause' the bending roller will continue to rotate.\n\nPause will finish after 112 seconds and the The Spraying Valve (M.Y035) and Compressed Air valve (M.Y004) will close.")
            
        }
        
        if spraySteps[indexPath.row] == "Spray Tank filling valve M-Y034 OPEN" || spraySteps[indexPath.row] == "Spray Tank filling valve M-Y034 CLOSED"{
            
            displayStepInfo("Spray Tank filling valve: M.Y034\n\nPLC Output Coil ID: Q075\n\nPLC & Hardware:\n-A118[14/B3] > X004[81(Signal)/82(0vdc)]\n\nCable:\n +M-W430\n\nDocumentation:\nEM: 2771720-0101 Page 85\nSPC: 2771718-0104 Page 1-84")
            
        }
        
        if spraySteps[indexPath.row] == "H202 Pump ON" || spraySteps[indexPath.row] == "H202 Pump OFF"  {
            
            displayStepInfo("H202 Pump ON \n\nPLC Output Coil ID: Q017\n\nPLC &  Hardware:\n-A115[02/A1] > K009[A1] > MM010\n\nCable:\n +M-W308\n\nDocumentation:\nEM: 2771720-0101 Page 78\nSPC: 2771718-0104 Page 6-56")
            
        }
        
        if spraySteps[indexPath.row] == "Spray tank high level probe ON" {
            
            displayStepInfo("Spray Tank high level probe\n\nPLC Input ID: I042\n\nPLC & Hardware:\nProbe 2[MB043.2] > +M-W425[2] > X004[32] > A301[B2] > A301[15] > A104[11/B2]\n\nDocumentation:\nEM: 2771720-0101 Pages 33/59\nSPC: 2771718-0104 Page 1-84/10-26")
            
        }
        
        if spraySteps[indexPath.row] == "Spraying valve M-Y035 OPEN" {
            
            displayStepInfo("Spray valve: M.Y035\n\nPLC Output Coil ID: Q076\n\nPLC & Hardware:\n-A118[15/B4] > X004[83(Signal)/84(0vdc)]\n\nCable:\n +M-W431[01(Signal)/02(0vdc)]\n\nDocumentation:\nEM: 2771720-0101 Page 85\nSPC: 2771718-0104 Page 1-84")
            
        }
        
        if spraySteps[indexPath.row] == "Air to Spray tank valve M-Y004 OPEN" {
            
            displayStepInfo("Spray valve: M.Y004\n\nPLC Output Coil ID: Q076\n\nPLC & Hardware:\n-A118[15/B4] > X004[85(Signal)/86(0vdc)]\n\nCable:\n +M-W432[01(Signal)/02(0vdc)]\n\nDocumentation:\nEM: 2771720-0101 Page 85\nSPC: 2771718-0104 Page 1-84")
            
        }
        
        if spraySteps[indexPath.row] == "Filler looking for Tank Low level Probe ON" {
            
            displayStepInfo("Spray Tank low level probe\n\nPLC Input ID: I042\n\nPLC & Hardware:\nProbe 1[MB043.1] > +M-W425[3] > X004[33] > A301[B3] > A301[15] > A104[11/B2]\n\nDocumentation:\nEM: 2771720-0101 Pages 33/59\nSPC: 2771718-0104 Page 1-84/10-26")
            
        }
        
    }
    
    @IBAction func helpBarButton(sender: AnyObject) {
        
        displayStepInfo("Instructions:\n\nStart the stopwatch the moment the elapsed time indicator on the TPOP appears when you step up the filler to step: spraying.\n\nStop the stopwatch the moment the alarm appears on the TPOP.\n\nThe table willl display the current step the filler is trying to execute.")
        
    }
    
    func displayStepInfo(userMessage: String) {
        
        let infoMessage = UIAlertController(title: "Information", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        let closeAction = UIAlertAction(title: "Close", style:UIAlertActionStyle.Default, handler: nil)
        
        infoMessage.addAction(closeAction)
        
        self.presentViewController(infoMessage, animated: true, completion: nil)
        
    }


}

