/**
 Copyright 2023 Pardn Ltd 帕登國際有限公司.
 Created by Pardn Chiu 邱敬幃.
 Email: chiuchingwei@icloud.com
 */

import Foundation
import UIKit

class calendarViewcontroller: UIViewController {

	private var dateCollectionView: UICollectionView!
	private var dataTableView			: UITableView!

	private var list	: [[String:Bool]] = [];
	private var datas	: [[String:String]] = [
		[
			"title": "線上購物1",
			"price": "123"
		],
		[
			"title": "線上購物2",
			"price": "456"
		]
	];

	override func viewDidLoad() {
		super.viewDidLoad();

		let firstDay: Int = {
			let date = Date().startOfMonth;
			let dateFormatter = DateFormatter()
			dateFormatter.dateFormat = "EEEE";
			switch dateFormatter.string(from: date) {
				case "Monday"		: return 1;
				case "Tuesday"	: return 2;
				case "Wednesday": return 3;
				case "Thursday"	: return 4;
				case "Friday"		: return 5;
				case "Saturday"	: return 6;
				default					: return 0;
			};
		}();

		let lastDate: Int = {
			let date = Date().endOfMonth;
			let dateFormatter = DateFormatter();
			dateFormatter.dateFormat = "dd";
			return Int(dateFormatter.string(from: date)) ?? 0
		}();

		let preLastDate: Int = {
			let date = Date().endOfPreMonth;
			let dateFormatter = DateFormatter();
			dateFormatter.dateFormat = "dd";
			return Int(dateFormatter.string(from: date)) ?? 0
		}();

		list = [
			["週日":false],
			["週一":false],
			["週二":false],
			["週三":false],
			["週四":false],
			["週五":false],
			["週六":false]
		];

		for i in (preLastDate - firstDay + 1)...preLastDate {
			list.append(["\(i)":false]);
		};

		for i in 1...lastDate {
			list.append(["\(i)":true]);
		};

		let length = 7 - (list.count % 7);

		for i in 1...length {
			list.append(["\(i)":false]);
		};

		let calendarCollectionViewLayout = UICollectionViewFlowLayout()._ { e in
			let widrh: CGFloat = CGFloat(Int((vw - 20) / 7))
			e.minimumLineSpacing = 0;
			e.minimumInteritemSpacing = 0;
			e.scrollDirection = .vertical;
			e.estimatedItemSize = CGSize(widrh, 35);
		};

		dateCollectionView = UICollectionView(0, 0, vw, vh, calendarCollectionViewLayout)
			.padding(vert: 15)
			.padding(horz: 10)
			.proto(self, self)
			.cell(calendarCollectionViewCell.self, "calendarCollectionViewCell")
			.bg(color: .clear);

		dataTableView = UITableView();
		dataTableView.delegate = self;
		dataTableView.dataSource = self;
		dataTableView.register(dataTableViewCell.self, forCellReuseIdentifier: "dataTableViewCell");

		_=dataTableView.bg(color: .clear)

		_=view
			.child([
				UIVisualEffectView(style: .extraLight)
					.frame(0, 0, vw, vh),
				dateCollectionView,
				dataTableView
			]);

		_=dateCollectionView
			.Teq(T: view)
			.Leq(L: view)
			.Req(R: view)
			.Heq(vh);

		_=dataTableView
			.Leq(L: view)
			.Req(R: view)
			.Beq(B: view);
	};

	override func viewWillAppear(_ animated: Bool) {
		dateCollectionView.isScrollEnabled = false;
		dateCollectionView.setNeedsLayout();
		dateCollectionView.layoutIfNeeded();
		dateCollectionView.removeConstraint(dateCollectionView.constraints[0])
		_=dateCollectionView
			.Heq(dateCollectionView.contentSize.height + 30 /* vert padding */);

		_=dataTableView
			.Teq(B: dateCollectionView)
	}
};

extension calendarViewcontroller: UICollectionViewDelegate, UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return list.count;
	};

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		if self.dateCollectionView == collectionView {
			let cell = collectionView.cell(reuse: "calendarCollectionViewCell", indexPath) as? calendarCollectionViewCell ?? calendarCollectionViewCell();
			let data: [String:Bool] = list[indexPath.row];
			let key = [String](data.keys)[0];
			let value = [Bool](data.values)[0];
			let todayDate: Int = {
				let date = Date();
				let dateFormatter = DateFormatter()
				dateFormatter.dateFormat = "dd";
				return Int(dateFormatter.string(from: date)) ?? 0
			}();
			_=cell.button
				.text("\(key)")
				.if(button: !value, { button in
					_=button
						.text(color: .lightGray, align: .center)
						.font(weight: .regular, size: 13)
				})
				.if(button: key == "\(todayDate)", { button in
					_=button
						.text(color: .white, align: .center)
						.font(weight: .bold, size: 15)
						.bg(color: UIColor(hex: "F97473"))
				})
				.if(button: indexPath.row < 7, { button in
					_=button
						.text(color: .black, align: .center)
						.font(weight: .bold, size: 13)
				})
				return cell
		};
		return UICollectionViewCell();
	};
};

extension calendarViewcontroller: UITableViewDelegate, UITableViewDataSource {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return datas.count;
	};

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "dataTableViewCell") as? dataTableViewCell else { return UITableViewCell() };
		let data: [String:String] = datas[indexPath.row];
		if let title = data["title"], let price = data["price"] {
			_=cell.titleLabel.text(title);
			_=cell.priceLabel.text(price);
		};
		return cell;
	};
};
