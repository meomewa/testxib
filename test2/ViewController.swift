//
//  ViewController.swift
//  test2
//
//  Created by Nguyen Tuan Anh on 20/01/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "View 1"
        // Load Image
        let str = "https://image.winudf.com/v2/image1/Y29tLndhbGxpZS5rYXdhaWlhbmltZWJveS53YWxscGFwZXJzX3NjcmVlbl8xXzE1NzY5MDkzMDhfMDQx/screen-1.jpg?fakeurl=1&type=.jpg"
        let strUrl = URL(string: str)
        if let unstrUrl = strUrl {
            loadImageData(url: unstrUrl)
        }
        // Tapgesture
        addGesture()
    }
    
    // MARK: - Load Image from Internet
    func loadImageData(url: URL) {
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            guard let response = response as? HTTPURLResponse else {
                return
            }
            print("Response status code: \(response.statusCode)")
            
            guard let data = data else {
                print("No data")
                return
            }
            
            DispatchQueue.main.async {
                if let image2v = UIImage(data: data) {
                    self.imageView.image = image2v
                }
            }
        }.resume()
    }
    
    // MARK: - add Gesture
    func addGesture() {
        let tapped = UITapGestureRecognizer()
        tapped.numberOfTapsRequired = 1
        tapped.addTarget(self, action: #selector(toView2(_:)))
        self.imageView.addGestureRecognizer(tapped)
    }
    
    @objc func toView2(_ gesture: UITapGestureRecognizer) {
        print("tapped to imageView")
        let vc = ViewController2()
        vc.lbtext = "OK Im fine"
        navigationController?.pushViewController(vc, animated: true)
    }
}
