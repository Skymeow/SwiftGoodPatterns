play videos based on cell postion to tableview

```
func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let cells = tableView.visibleCells as! [VideoFeedCell]
        //        based on the height, the least num of visible cell is 2
        if let visibleRowIndex = tableView.indexPathsForVisibleRows?.count {
            if  visibleRowIndex > 1 {
                let lastIndexPath = tableView.indexPathsForVisibleRows!.last!
                let lastVisibleIndex = lastIndexPath.row
//                print(lastVisibleIndex)
                var topRightRect = self.tableView.rectForRow(at: lastIndexPath)
                topRightRect = topRightRect.offsetBy(dx: -tableView.contentOffset.x, dy:  -tableView.contentOffset.y)
                let tableViewMid = tableView.frame.midY
                let check = topRightRect.minY - tableViewMid
                // when the top right y of last visible cell bigger than half of tableview, play lastcell
                //  when check is negative, the last visible cell is above tableview midY (play last visible cell)
                if check < 0 {
                    // pause 2rd last visible cell
//                    print("2rd Last ", lastVisibleIndex-1)
                    let prevIndexPath = IndexPath(row: lastVisibleIndex-1, section: 0)
                    if let prev = self.tableView.cellForRow(at: prevIndexPath) as? VideoFeedCell {
                        prev.playerLayer?.player?.pause()
                    }
                    // play last visible cell
                    if let last = self.tableView.cellForRow(at: lastIndexPath) as? VideoFeedCell {
                        self.prepareVideoLoading(cell: last, forItemAtIndex: (lastVisibleIndex))
                    }
                    
                } else if check > 0 {
                    // pause last visible cell
                    if let last = self.tableView.cellForRow(at: lastIndexPath) as? VideoFeedCell {
                        last.playerLayer?.player?.pause()
                    }
                    // play 2rd last visible cell
                    let prevIndexPath = IndexPath(row: lastVisibleIndex-1, section: 0)
                    if let prev = self.tableView.cellForRow(at: prevIndexPath) as? VideoFeedCell {
                        self.prepareVideoLoading(cell: prev, forItemAtIndex: (lastVisibleIndex-1))
                    }
                    
                } else {
                    // pause both last, 2rd last cell
//                    let prevIndex = tableView.indexPathsForVisibleRows?[lastVisibleIndex-1]
//                    if let old = self.tableView.cellForRow(at: prevIndex!) as? VideoFeedCell {
//                        old.playerLayer?.player?.pause()
//                    }
                    
                }
            }
    }
```

```
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "feedcell") as? VideoFeedCell else{
            fatalError()
        }
        cell.tag = indexPath.row
        let gifThumbnailStr = self.videoFeeds![indexPath.row].thumbnil
        let gifThumbnailUrl = URL(string: gifThumbnailStr!)
        cell.videoThumbnail.kf.indicatorType = .activity
        cell.videoThumbnail.kf.setImage(with: gifThumbnailUrl,options: [.cacheSerializer(FormatIndicatedCacheSerializer.png), .cacheSerializer(FormatIndicatedCacheSerializer.jpeg)])
        
        if indexPath.row == 0 {
            self.currentPlayingCell = cell
            self.prepareVideoLoading(cell: cell, forItemAtIndex: indexPath.row)
            
        }
        
        return cell
    }
```



