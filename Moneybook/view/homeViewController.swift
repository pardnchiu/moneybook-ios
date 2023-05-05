/**
 Copyright 2023 Pardn Ltd 帕登國際有限公司.
 Created by Pardn Chiu 邱敬幃.
 Email: chiuchingwei@icloud.com
 */

import Foundation
import UIKit

var datas: [[String:Any]] = [
	[
		"date": "2023/05/03 星期三",
		"price": -1234,
		"list": [
			[
				"title":"線上購物1",
				"price": 123
			] as [String : Any],
			[
				"title":"線上購物2",
				"price": 456
			] as [String : Any]
		]
	],
	[
		"date": "2023/05/02 星期二",
		"price": -1234,
		"list": [
			[
				"title":"線上購物3",
				"price": 123
			] as [String : Any],
			[
				"title":"線上購物4",
				"price": 456
			] as [String : Any]
		]
	],
	[
		"date": "2023/05/01 星期一",
		"price": -1234,
		"list": [
			[
				"title":"線上購物5",
				"price": 123
			] as [String : Any],
			[
				"title":"線上購物6",
				"price": 456
			] as [String : Any]
		]
	],
	[
		"date": "2023/04/30 星期日",
		"price": -1234,
		"list": [
			[
				"title":"線上購物7",
				"price": 123
			] as [String : Any],
			[
				"title":"線上購物8",
				"price": 456
			] as [String : Any]
		]
	]
];

class homeViewController: UIViewController {

	private var isMonthSelectorShow = false;
	private var isLeftTabShow = false;

	public var titleButton			: UIButton!
	public var scrollView				: UIScrollView!
	public var contentView			: UIStackView!
	public var collectionView		: UICollectionView!
	public var addButton				: UIButton!
	public var monthSelecView		: UIVisualEffectView!
	public var monthCollectView	: UICollectionView!

	override func viewDidLoad() {
		super.viewDidLoad();

		let date = Date();
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy年MM月"

		titleButton = UIButton()
			.img(UIImage(sys: "arrow.up.circle"), align: .right, gap: 5)
			.text(dateFormatter.string(from: date), color: .black, align: .center)
			.font(weight: .bold, size: 17)
			.touch(down: self, #selector(navTitleTap));

		monthSelecView = UIVisualEffectView(style: .regular)
			.frame(0, -vh, vw, vh);

		let monthCollectionViewLayout = UICollectionViewFlowLayout()._ { e in
			e.minimumLineSpacing 			= 15;
			e.minimumInteritemSpacing = 10;
			e.scrollDirection 				= .vertical;
			e.estimatedItemSize 			= CGSize((vw - 50) / 4, 40);
			e.headerReferenceSize 		= CGSize(vw, 60)
		};

		monthCollectView = UICollectionView(0, 0, vw, vh, monthCollectionViewLayout)
			.proto(self, self)
			.cell(monthCollectViewCell.self, "monthCollectViewCell")
			.header(monthCollectViewHeader.self, "monthCollectViewHeader")
			.padding(horz: 10)
			.bg(color: .clear)
			.alpha(0);

		let homeCollectionViewLayout = UICollectionViewFlowLayout()._ { e in
			e.minimumLineSpacing 			= 20;
			e.minimumInteritemSpacing = 1;
			e.scrollDirection 				= .vertical;
			e.estimatedItemSize.width = vw
		};

		collectionView = UICollectionView(0, 0, vw, vh, homeCollectionViewLayout)
			.proto(self, self)
			.cell(homeCollectViewCell.self, "homeCollectViewCell");

		scrollView = UIScrollView();
		contentView = UIStackView(axis: .vert, align: .top, fill: .eqSpace);

		navigationItem.titleView = titleButton
		navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(sys: "list.bullet"), style: .done, target: self, action: #selector(navLeftBar));
		navigationItem.leftBarButtonItem?.tintColor = .black;
		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(sys: "calendar"), style: .done, target: self, action: #selector(navRightCanendar));
		navigationItem.rightBarButtonItem?.tintColor = .black;

		addButton = UIButton()
			.text(color: .white, align: .center)
			.img(UIImage(sys: "plus"))
			.border(color: .black, width: 2)
			.touch(down: self, #selector(addItem))
			.bg(color: UIColor(hex: "F97473"))
			.radius(30)
			.shadow();

		let homePieView = homePieView(70);

		_=view
			.child([
				scrollView
					.child([
						contentView
							.child([
								homePieView,
								collectionView
							]),
						addButton
					]),
				monthSelecView
					.child([
						monthCollectView
					])
			])
			;

		_=scrollView
			.Teq(T: view)
			.Leq(L: view)
			.Beq(B: view)
			.Req(R: view)
			.Weq(vw)
			;

		collectionView
			.padding(T: 15)
			.padding(B: 60)
			.Weq(vw)
			.Heq(collectionView.frame.size.height)
			;

		_=contentView
			.padding(T: 20)
			.Teq(T: scrollView)
			.Leq(L: scrollView)
			.Beq(B: scrollView)
			.Req(R: scrollView)
			.Weq(vw)
			;

		_=addButton
			.Xeq(X: view)
			.Beq(B: view, -30)
			.Weq(60)
			.Heq(60)
			;
	};

	override func viewWillAppear(_ animated: Bool) {


		{
		// 更新內容高度
		collectionView.isScrollEnabled = false;
		collectionView.setNeedsLayout();
		collectionView.layoutIfNeeded();
		collectionView.removeConstraint(collectionView.constraints[1])
		_=collectionView
			.Heq(collectionView.contentSize.height + 15 /* padding-top */ + 60 /* padding-bottom */)
			;
		}()
	}

	@objc func navTitleTap() {
		if (isMonthSelectorShow) {
			isMonthSelectorShow = false;
			UIViewPropertyAnimator(duration: 0.3, curve: .easeIn) {
				_=self.titleButton.imageView?.rotate(angle: -180);
				_=self.monthCollectView.alpha(0);
			}.startAnimation();
			Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { _ in
				UIViewPropertyAnimator(duration: 0.3, curve: .easeOut) {
					_=self.monthSelecView.y(-vh);
				}.startAnimation();
			};
		} else {
			isMonthSelectorShow = true;
			let h = navigationController?.navigationBar.frame.size.height ?? 0;
			scrollView.setContentOffset(CGPoint(x: 0, y: -safeTop() - h), animated: true);
			UIViewPropertyAnimator(duration: 0.3, curve: .easeIn) {
				_=self.titleButton.imageView?.rotate(angle: 180);
				_=self.monthSelecView.y(0);
			}.startAnimation();
			Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { _ in
				UIViewPropertyAnimator(duration: 0.3, curve: .easeOut) {
					_=self.monthCollectView.alpha(1);
				}.startAnimation();
			};
		};
	};

	@objc func navLeftBar() {
		let tabLeftView = tabLeftView(head: UIImage(name: "head"), name: "邱敬幃");
		_=navigationController?.view
			.child([
				tabLeftView
			]);
	};

	@objc func navRightCanendar() {
		let vc = calendarViewcontroller();
		self.present(vc, animated: true);
	};

	@objc func addItem() {
		let vc = addViewController();
		self.present(vc, animated: true);
	};
};

extension homeViewController: UICollectionViewDelegate, UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		if self.collectionView == collectionView {
			return datas.count;
		};
		return 12;
	};

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		if self.collectionView == collectionView {
			let cell = collectionView.cell(reuse: "homeCollectViewCell", indexPath) as? homeCollectViewCell ?? homeCollectViewCell();

			let data = datas[indexPath.row];
			if let date = data["date"] as? String {
				_=cell.headerLabel
					.attr(txt: date)
					.attr(align: .left)
					.attr(charSpacing: 1)
					.attr(minH: 40)
					.attr(offset: 10)
					;
			};
			if let total = data["total"] as? Int {
				_=cell.totalLabel
					.attr(txt: String(total))
					.attr(align: .left)
					.attr(charSpacing: 1)
					.attr(minH: 40)
					.attr(offset: 10)
					;
			};
			_=cell
				.view
				.child({
					var ary: [homeDayRowView] = [];
					if let list = data["list"] as? [[String:Any]] {
						for i in 0..<list.count {
							let e = list[i]
							guard let title = e["title"] as? String, let price = e["price"] as? Int else { break; };
							ary.append(homeDayRowView(title:title, price: String(price), isFirst: i == 0));
						};
					};
					return ary;
				}());
			return cell
		};
		let cell = collectionView.cell(reuse: "monthCollectViewCell", indexPath) as? monthCollectViewCell ?? monthCollectViewCell();
		_=cell.button
			.text("\(indexPath.row + 1)月", color: .black, align: .center)
			;
		if (indexPath.row + 1 == 5) {
			_=cell.contentView.bg(color: UIColor(hex: "F97473"));
			_=cell.button.text(color: .white, align: .center);
		};
		return cell;
	};

	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "monthCollectViewHeader", for: indexPath) as? monthCollectViewHeader, kind == UICollectionView.elementKindSectionHeader else { return UICollectionReusableView(); };
		return header;
	};
};
