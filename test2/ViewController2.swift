//
//  ViewController2.swift
//  test2
//
//  Created by Nguyen Tuan Anh on 20/01/2022.
//

import UIKit

class ViewController2: UIViewController {
    @IBOutlet weak var tlb: UILabel!
    var lbtext: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "view2"
        
        view.backgroundColor = .green
        tlb.textAlignment = .center
        tlb.textColor = .red
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "bye", style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: nil, action: nil)
        
        guard let lbtext = lbtext else {
            return
        }
        tlb.text = lbtext

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
}
