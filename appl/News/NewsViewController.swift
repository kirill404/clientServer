//
//  NewsViewController.swift
//  views
//
//  Created by Кирилл Пучков on 17.03.2019.
//  Copyright © 2019 Кирилл Пучков. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.sectionHeaderHeight = 70.0
        tableView.sectionFooterHeight = 40.0
        tableView.register(UINib(nibName: "NewsHeader", bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: "NewsHeaderView")
        tableView.register(UINib(nibName: "NewsFooter", bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: "NewsFooterView")

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsTableViewCell
//        cell.labelNewsText.sizeToFit()
//        cell.labelNewsText.numberOfLines = 0
//        cell.awakeFromNib()
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "NewsHeaderView") as! NewsHeaderView
        header.contentView.backgroundColor = UIColor.white
        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: "NewsFooterView")
        return footer
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        cell.alpha = 0
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 1,
                       options: [], animations: {
                        cell.transform = .identity
                        cell.alpha = 1
        })
    }
    

//    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
    
//    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
    
    
}


