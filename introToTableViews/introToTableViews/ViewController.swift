//
//  ViewController.swift
//  introToTableViews
//
//  Created by Lisa J on 10/30/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
   //if u use vc from objects then delegate is autoset but tableview will take up whole screen and can't change that
    var daysOfWeek = [["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"],
      ["星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"],
      ["Monday: Getsuyôbi (げつようび – 月曜日)",
        "Tuesday: Kayôbi (かようび – 火曜日)",
        "Wednesday: Suiyôbi (すいようび – 水曜日)",
       " Thursday: Mokuyôbi (もくようび – 木曜日)",
       " Friday: Kinyôbi (きんようび – 金曜日)",
       " Saturday: Doyôbi (どようび – 土曜日)"]
    ]//array of arrays 0 index is eng, 1 index is chinese
    var color1 = UIColor.darkGray
    var color2 = UIColor.lightGray
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpColors()
        tableView.delegate = self // tell its delegate when something happens
        tableView.dataSource = self
    }
    func setUpColors() {
        self.color1 = randomColor()
        self.color2 = randomColor()
    }
    func randomColor() -> UIColor {
        let randRed = CGFloat(drand48())
        let randGreen = CGFloat(drand48())
        let randBlue = CGFloat(drand48())
        return UIColor(displayP3Red: randRed, green: randGreen, blue: randBlue, alpha: 1)
    }
    //all delegate methods are optional
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRow = indexPath.row
        let selectedSection = indexPath.section
        daysOfWeek[selectedSection][selectedRow] = "I clicked on this"
        tableView.reloadData() //reload everything again instantly to make the above again, have to reload data everytime model is updated
    }
    //data Source methods(REQUIRED)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daysOfWeek[section].count//displays each item in section so correct number
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Day Cell")!
        let rowToSetUp = indexPath.row
        //set day of week to number
        let sectionToSetUp = indexPath.section//language 0 is eng, 1 is chinese
        let daysOfWeekArr = daysOfWeek[sectionToSetUp]
        let dayAtRow = daysOfWeekArr[rowToSetUp]
        
        //set up properties of the cell
        cell.textLabel?.text = dayAtRow
        cell.detailTextLabel?.text = String(rowToSetUp) //the numbers
        switch sectionToSetUp {
        case 0:
            cell.backgroundColor = color1
        case 1:
            cell.backgroundColor = color2
        default:
            break
        }
        //alternating colors: (Dark grey -> light grey -> Dark grey)
//        if (indexPath.row % 2 == 0)
//        {
//            cell.backgroundColor = color1
//        }
//        else {  cell.backgroundColor = color2
//    }
        return cell
        
        
    }
  //Data source methods (optionsl)
    func numberOfSections(in tableView: UITableView) -> Int {
        return daysOfWeek.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch  section {
        case 0:
            return "English"//displays title
        case 1:
            return "Chinese"
        case 2:
            return "Japanese"
        default:
            return "Unknown Language"
        }
    }

}

