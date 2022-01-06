//
//  ViewController.swift
//  Swift-dp
//
//  Created by Dakota Lane Holmes on 1/4/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ExpandableHeaderViewDelegate {

    
    @IBAction func showPopup(_ sender: Any) {
        let popOverVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sbPopUpID") as! PopUpViewController
        self.addChild(popOverVc)
        popOverVc.view.frame = self.view.frame
        self.view.addSubview(popOverVc.view)
        popOverVc.didMove(toParent: self)
    }
    @IBOutlet weak var textCred: UITextView!
    
    @IBOutlet weak var tableView: UITableView!

    
    var sections = [
            Section(sector: "General Overview",
                    information: ["G.O. context"],
                    expanded: false),
            Section(sector: "Datapath Preview",
                    information: ["Datapath Preview"],
                    expanded: false),
            Section(sector: "Datapath Elements",
                    information: ["ALU Context", "ALU Graphic", "Multiplexer Context", "Multiplexer Graphic", "Register File Context", "Register File Graphic", "Instruction Memory Contex", "Instruction Memory Graphic", "Data Memory Contex", "Data Memory Graphic", "Logic Gate Contex"],
                    expanded: false),
            Section(sector: "Instruction Stages",
                    information: ["Fetch", "Decode", "Execution"],
                    expanded: false),
            Section(sector: "Control Signals Overview",
                    information: ["RegDst", "RegWrite", "ALUSrc", "MemWrite", "MemtoReg", "MemRead", "PC Src"],
                    expanded: false),
            Section(sector: "Instructions",
                    information: ["ALU Execution Graphic", "ALU Control Signals Graphic", "Load Execution Graphic", "Load Control Signals Graphic", "Store Execution Graphic", "Store Control Signals Graphic", "Branch Execution Graphic", "Branch Control Signals Graphic"],
                    expanded: false)
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].information.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (sections[indexPath.section].expanded) {
            return 70
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ExpandableHeaderView()
        header.customInit(title: sections[section].sector, section: section, delegate: self)
        
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell")!
        cell.textLabel?.text = sections[indexPath.section].information[indexPath.row]
        return cell
    }
    
    func toggleSection(header: ExpandableHeaderView, section: Int) {
        sections[section].expanded = !sections[section].expanded
        tableView.beginUpdates()
        for i in 0 ..< sections[section].information.count {
            tableView.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
        tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let simpleVC = SimpleVC()
        simpleVC.customInit(imageName: sections[indexPath.section].information[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(simpleVC, animated: true)
    }


}

