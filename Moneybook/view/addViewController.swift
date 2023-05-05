/**
 Copyright 2023 Pardn Ltd 帕登國際有限公司.
 Created by Pardn Chiu 邱敬幃.
 Email: chiuchingwei@icloud.com
 */

import Foundation
import UIKit

class addViewController: UIViewController {

	var collectionView: UICollectionView!
	var topView				: UIView!
	var numPad				: numPadView!

	var costTypes: [[String]] = [
		["娛樂", "gamecontroller.fill"],
		["日用品", "cart.fill"],
		["房租", "house.fill"],
		["醫療", "stethoscope"],
		["社交", "person.3.fill"],
		["禮物", "teddybear.fill"],
		["3C", "iphone.gen1"],
		["其他", "square.grid.2x2.fill"],
		["自訂1", "camera.fill"],
		["自訂2", "camera.macro"],
		["自訂3", "photo.fill"],
		["新增", "plus.app.fill"]
	];
	var incomeTypes: [[String]] = [
		["薪水", "dollarsign.circle.fill"],
		["獎金", "dollarsign.square.fill"],
		["回饋", "dollarsign.arrow.circlepath"],
		["交易", "cart.fill"],
		["股票", "chart.line.uptrend.xyaxis"],
		["租金", "house.fill"],
		["投資", "chart.pie.fill"],
		["其他", "square.grid.2x2.fill"],
		["新增", "plus.app.fill"]
	];

	override func viewDidLoad() {
		super.viewDidLoad()

		let items: [String] = ["收入", "支出"];
		
		let segmented = UISegmentedControl(items:items)._ { e in
			e.selectedSegmentTintColor = UIColor(hex: "FCC852");
			e.frame = CGRect(x: (vw - 160) / 2, y: 12, width: 160, height: 36);
			e.setWidth(80, forSegmentAt: 0);
			e.setWidth(80, forSegmentAt: 1);
			e.selectedSegmentIndex = 0;
		};

		numPad = numPadView(bgColor: UIColor(hex: "FCC852"));

		topView = UIView()
			.frame(0, 0, vw, 60)
			.child([
				segmented
			]);

		let addCollectionViewLayout = UICollectionViewFlowLayout()._ { e in
			e.minimumLineSpacing = 10;
			e.minimumInteritemSpacing = 1;
			e.scrollDirection = .vertical;
			e.estimatedItemSize = CGSize((vw - 50) / 4, (vw - 50) / 4)
		};

		collectionView = UICollectionView(0, 0, vw, vh, addCollectionViewLayout)
			.padding(horz: 10)
			.padding(vert: 10)
			.proto(self, self)
			.cell(addCollectionViewCell.self, "addCollectionViewCell")
			.bg(color: .clear);

		_=view
			.child([
				UIVisualEffectView(style: .extraLight)
					.frame(0, 0, vw, vh),
				topView,
				collectionView,
				numPad
			]);

		_=collectionView
			.Teq(T: view, 60)
			.Leq(L: view)
			.Beq(T: numPad)
			.Req(R: view)
			.Weq(vw);

		_=numPad
			.Leq(L: view)
			.Beq(B: view)
			.Req(R: view)
			.Weq(vw);
	};
};

extension addViewController: UICollectionViewDelegate, UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return incomeTypes.count;
	};

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize.zero;
	};

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.cell(reuse: "addCollectionViewCell", indexPath) as? addCollectionViewCell else { return UICollectionViewCell(); };
		let data = incomeTypes[indexPath.row];
		_=cell.button
			.img(UIImage(sys: data[1]), align: .top, gap: 10)
			.text(data[0], color: .black, align: .center)
			.if(button: indexPath.row == 0, { button in
				_=button
					.text(data[0], color: .white, align: .center)
					.bg(color: UIColor(hex: "F97473"));
			});
		return cell;
	};
};

