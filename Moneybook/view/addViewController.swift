//
//  ViewController.swift
//  Maoneybook
//
//  Created by Pardn on 2023/5/2.
//
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

	override func viewDidLoad() {
		super.viewDidLoad()

		let items: [String] = ["收入", "支出"]
		let segmented = UISegmentedControl(items:items);
		segmented.selectedSegmentTintColor = UIColor(hex: "FCC852");
		segmented.frame = CGRect(x: (vw - 160) / 2, y: 12, width: 160, height: 36);
		segmented.setWidth(80, forSegmentAt: 0);
		segmented.setWidth(80, forSegmentAt: 1);
		segmented.selectedSegmentIndex = 0;

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

		// MARK: add elements.

		_ = view
			.child([
				UIVisualEffectView(style: .extraLight)
					.frame(0, 0, vw, vh),
				topView,
				collectionView,
				numPad
			]);

		// MARK: add Autolayout.

		_ = collectionView
			.Teq(T: view, 60)
			.Leq(L: view)
			.Beq(T: numPad)
			.Req(R: view)
			.Weq(vw);

		_ = numPad
			.Leq(L: view)
			.Beq(B: view)
			.Req(R: view)
			.Weq(vw);

//		// MARK: update layout.
//
//		view.setNeedsLayout();
//		view.layoutIfNeeded();
//		view.layoutSubviews();
	};
};

extension addViewController: UICollectionViewDelegate, UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return costTypes.count;
	};

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 0, height: 0);
	};

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		if self.collectionView == collectionView {
			let cell = collectionView.cell(reuse: "addCollectionViewCell", indexPath) as? addCollectionViewCell ?? addCollectionViewCell();
			let data = costTypes[indexPath.row];
			_ = cell.button
				.img(UIImage(sys: data[1]), align: .top, gap: 10)
				.text(data[0], color: .black, align: .center)
				.if(button: indexPath.row == 0, { button in
					_ = button
						.text(data[0], color: .white, align: .center)
						.bg(color: UIColor(hex: "F97473"));
				});
			return cell
		};
		return UICollectionViewCell();
	};
};

