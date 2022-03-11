//
//  TweetTableViewCell.swift
//  PlatziTweet3
//
//  Created by Carlos Tapia on 24/02/22.
//

import UIKit
import Kingfisher

class TweetTableViewCell: UITableViewCell {
    //MARK:- IBOulets
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var videoButton: UIButton!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tweetImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setupCellWith(post: Post) {
        nameLabel.text = post.author.name
        nickNameLabel.text = post.author.nickname
        messageLabel.text = post.text
        
        if post.hasImage {
            //configurar imagen
            tweetImageView.kf.setImage(with: URL(string: post.imageUrl))
        } else {
            tweetImageView.isHidden = true 
        }
    }
}
