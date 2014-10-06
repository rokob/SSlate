//
//  BetListViewController.swift
//  slate
//
//  Created by Andy Ledvina on 10/5/14.
//  Copyright (c) 2014 rokob. All rights reserved.
//

import UIKit

let BetListViewControllerIdentifier = "BetListViewController"

class BetListViewController: UITableViewController, BetListViewInterface {

  var eventHandler: BetListModuleInterface?
  var data: BetListData?
  var strongTableView: UITableView?

  @IBOutlet var emptyContentView: UIImageView!

  override func viewDidLoad() {
    super.viewDidLoad()

    strongTableView = tableView
    let cellNib = UINib(nibName: BetListTableViewCellIdentifier, bundle: NSBundle.mainBundle())
    self.tableView.registerNib(cellNib, forCellReuseIdentifier: BetListTableViewCellIdentifier)
    configureView()
  }

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)

    eventHandler?.updateView()
  }

  func configureView() {
    navigationItem.title = "Slate"
    let addItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: Selector("didTapAddButton"))
    navigationItem.rightBarButtonItem = addItem

    tableView.separatorStyle = UITableViewCellSeparatorStyle.None

    if refreshControl == nil {
      let refresher = UIRefreshControl()
      refresher.backgroundColor = UIColor(white: 0.3, alpha: 1.0)
      refresher.tintColor = UIColor.whiteColor()
      refresher.addTarget(self, action: Selector("didPullRefresh"), forControlEvents: UIControlEvents.ValueChanged)
      self.refreshControl = refresher
    }
  }

  func didPullRefresh() {
    eventHandler?.updateView()
  }

  func didTapAddButton() {
    eventHandler?.createNewBet()
  }

  func endRefreshingIfApplicable() {
    if let refresher = refreshControl {
      refresher.endRefreshing()
    }
  }

  func showNoContentMessage() {
    endRefreshingIfApplicable()

    if let emptyView = emptyContentView {
      self.view = emptyView
    } else {
      emptyContentView = UIImageView(image: UIImage(named: "empty"))
      emptyContentView.contentMode = UIViewContentMode.ScaleAspectFit
      self.view = emptyContentView
    }
  }

  func showBetListData(data: BetListData) {
    endRefreshingIfApplicable()

    self.view = strongTableView!
    self.data = data
    reloadBets()
  }

  func reloadBets() {
    tableView.reloadData()
  }

  // MARK: - Table view data source

  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    if let dataSource = data {
      return dataSource.sections.count
    }
    return 0
  }

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if let dataSource = data {
      return dataSource.sections[0].items.count
    }
    return 0
  }

  override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    if let dataSource = data {
      let section = dataSource.sections[section]
      return section.title
    }
    return nil
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(BetListTableViewCellIdentifier, forIndexPath: indexPath) as BetListTableViewCell

    if let item = itemAtIndexPath(indexPath) {
      cell.configure(item)
    }

    return cell
  }

  func itemAtIndexPath(indexPath: NSIndexPath) -> BetListItem? {
    if let dataSource = data {
      return dataSource.sections[indexPath.section].items[indexPath.row]
    }
    return nil
  }

}
