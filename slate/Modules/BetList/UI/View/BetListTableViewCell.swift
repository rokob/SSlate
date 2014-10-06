//
//  BetListTableViewCell.swift
//  slate
//
//  Created by Andy Ledvina on 10/5/14.
//  Copyright (c) 2014 rokob. All rights reserved.
//

import UIKit

let BetListTableViewCellIdentifier: String = "BetListTableViewCell"

class BetListTableViewCell: UITableViewCell {

  @IBOutlet weak var homeImage: UIImageView!
  @IBOutlet weak var awayImage: UIImageView!
  @IBOutlet weak var eventTitleLabel: UILabel!
  @IBOutlet weak var eventDateLabel: UILabel!
  @IBOutlet weak var favoriteLabel: UILabel!
  @IBOutlet weak var oddsLabel: UILabel!
  @IBOutlet weak var wagerLabel: UILabel!
  @IBOutlet weak var viewerPickLabel: UILabel!
  @IBOutlet weak var opponentLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
  }

  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }

  func configure(item: BetListItem) {
    // Bro I know, I will fix this just chill
    homeImage.image = UIImage(data: NSData(contentsOfURL: item.homeImageURL))
    awayImage.image = UIImage(data: NSData(contentsOfURL: item.awayImageURL))
    eventTitleLabel.text = item.eventTitle
    eventDateLabel.text = item.eventDate
    favoriteLabel.text = item.favorite
    oddsLabel.text = item.odds
    wagerLabel.text = item.wager
    viewerPickLabel.text = item.viewerPick
    opponentLabel.text = item.opponent
  }

}
