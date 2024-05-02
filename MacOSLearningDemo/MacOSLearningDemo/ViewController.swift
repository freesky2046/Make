//
//  ViewController.swift
//  MacOSLearningDemo
//
//  Created by ming zhou on 2024/5/2.
//

import Cocoa

extension ViewController {
    static let identifier = NSUserInterfaceItemIdentifier("cell")
}

class ViewController: NSViewController {
    
    @IBOutlet weak var tableView: NSTableView!
    

    
    private var dataList: [String] = [
        "1 开发环境",
        "2 storyboard",
        "3 autoresizing",
        "4 NSView",
        "5 NSButton",
        "6 NSImageView",
        "7 NSCollectionView",
        "8 NSTableView",
        "9 NSWindow",
        "10 NSApplication",
        "11 Document",
        "12 NSTextField",
        "13 NSTextView",
        "14 NSAlert",
        "15 NSPopover",
        "16 NSMenu",
        "17 NSContainerView",
        "18 NSSlider",
        "19 NSOpenPanel",
        "20 cocoapod",
        "21 CustomView1",
        "22 CustomView2",
        "23 View binding"
    
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = NSNib(nibNamed: "MyCellView", bundle: nil)
        tableView.register(cellNib, forIdentifier: Self.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayout() {
        super.viewDidLayout()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

}

// 返回每行的 view 和交互
extension ViewController: NSTableViewDelegate {
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cellView = tableView.makeView(withIdentifier: Self.identifier, owner: nil) as! MyCellView
        let name = dataList[row]
        cellView.configure(text: name)
        return cellView
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 44.0
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        print("😄" + "\(tableView.selectedRow)")
//        print("😄" + "\(tableView.selectedColumn)")
//        let  cellView = tableView.view(atColumn: tableView.selectedColumn, row: tableView.selectedRow, makeIfNecessary: true) as! MyCellView
        let data = dataList[tableView.selectedRow]
        // 1 alert
        if data.contains("NSAlert") {
            
        }
        
        
    }
}

// 返回多少行
extension ViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        dataList.count
    }
}
