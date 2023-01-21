# YSKit/CreateObject 创建对象快捷方式

## Foundation，目前包含以下几类
~~~ swift
URL.ys.create(...) -> URL?
Bundle.ys.create(...) -> Bundle
~~~

## Cocoa，目前包含以下几类
~~~ swift
UIView.ys.create(...) -> UIView

UIScrollView.ys.create(...) -> UIScrollView

UITableView.ys.create(...) -> UITableView 
UITableView.ys.createCell(...) -> UITableViewCell
UITableView.ys.createCell_empty(...) -> UITableViewCell
UITableView.ys.createHeaderFooterView(...) -> UITableViewHeaderFooterView?

UICollectionView.ys.create(...) -> UICollectionView
UICollectionView.ys.createCell(...) -> UICollectionViewCell
UICollectionView.ys.createCel_empty(...) -> UICollectionViewCell
UICollectionView.ys.createHeader(...) -> UICollectionReusableView
UICollectionView.ys.createFooter(...) -> UICollectionReusableView

UIImage.ys.create(...) -> UIImage
UIImageView.ys.create(...) -> UIImageView

UILabel.ys.create(...) -> UILabel

UIButton.ys.create(...) -> UIButton

UITextField.ys.create(...) -> UITextField

UIBarButtonItem.ys.create(...) -> UIBarButtonItem

UIAlertAction.ys.create(...) -> UIAlertAction

UISwitch.ys.create(...) -> UISwitch

UIDatePicker.ys.create(...) -> UIDatePicker

UIProgressView.ys.create(...) -> UIProgressView

UIPasteboard.ys.create(...) -> UIPasteboard

UIColor.ys.create(...) -> UIColor
UIColor.ys.createRandom(...) -> UIColor
~~~
