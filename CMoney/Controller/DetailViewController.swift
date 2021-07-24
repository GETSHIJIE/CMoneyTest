//
//  DetailViewController.swift
//  CMoney
//
//  Created by 黃仕杰 on 2021/7/24.
//

import UIKit

class DetailViewController: UIViewController {

    static let SegueIdentifier = "Segue_DetailViewController"
    
    // MARK: ViewModel
    var detailViewModel: DetailViewModel!
    
    // MARK: Outlet
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var hdImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var copyRightLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        config()
    }
    
    private func config() {
        dateLabel.text = detailViewModel.date
        titleLabel.text = detailViewModel.title
        copyRightLabel.text = detailViewModel.copyRight
        descriptionTextView.text = detailViewModel.descriptions
        hdImageView.load(urlString: detailViewModel.hdLink)
    }
}
