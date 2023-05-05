/**
 Copyright 2023 Pardn Ltd 帕登國際有限公司.
 Created by Pardn Chiu 邱敬幃.
 Email: chiuchingwei@icloud.com
 */

import Foundation
import UIKit

class homePieView: UIStackView {

	public var leftButton	: UIButton!
	public var rightButton: UIButton!
	public var pieView		: UIView!

	private var leftView	: UIView!
	private var rightView	: UIView!

	convenience init(_ percent: Int) {
		self.init(axis: .vert, align: .fill, fill: .eqSpace);

		let angle: CGFloat = CGFloat(percent) / 100 * 360;

		leftButton = UIButton()
			.padding(L: 15)
			.text("月支出", sub: "$0", color: .black, align: .left)
			.text(color: .black, align: .left)
			.subFont(weight: .heavy, size: 28);

		_=leftButton.subtitleLabel?
			.layer(
				{
					let border = CALayer();
					border.backgroundColor = UIColor(hex: "F97473").cgColor;
					border.frame = CGRect(x: 0, y: 0, width: 53, height: 3);
					self.layer.addSublayer(border);
					return border;
				}()
			);

		rightButton = UIButton()
			.padding(R: 15)
			.text("月收入", sub: "$0", color: .black, align: .right)
			.text(color: .black, align: .right)
			.subFont(weight: .heavy, size: 28);

		_=rightButton.subtitleLabel?
			.layer(
				{
					let border = CALayer();
					border.backgroundColor = UIColor(hex: "F97473").cgColor;
					border.frame = CGRect(x: -14, y: 0, width: 53, height: 3);
					self.layer.addSublayer(border);
					return border;
				}()
			);

		rightView = UIView(-100, 0, 200, 200)
			.bg(color: .clear)
			.radius(100)
			.layer([
				CAGradientLayer()
					.frame(100, 0, 100, 200)
					.bg(clr: .lightGray)
					.point(start: 0, 0.5)
					.point(end: 1, 0.5)
			])
			.clip(view: true);

		leftView = UIView(0, 0, 200, 200)
			.bg(color: .clear)
			.radius(100)
			.layer([
				CAGradientLayer()
					.frame(0, 0, 100, 200)
					.bg(clr: .lightGray)
					.point(start: 0, 0.5)
					.point(end: 1, 0.5)
			])
			.clip(view: true);

		pieView = UIView()
			.child([
				UIView(100, 0, 100, 200)
					.child([
						rightView
					])
					.clip(view: true),
				UIView(0, 0, 100, 200)
					.child([
						leftView
					])
					.clip(view: true),
				UIView(20, 20, 160, 160)
					.bg(color: .white)
					.radius(80)
					.shadow()
					.child([
						UILabel(0, 0, 160, 160)
							.text("\(percent)%", color: .black, align: .center, row: 0, wrap: .byClipping)
							.font(weight: .bold, size: 25)
					])
			])
			.Weq(200)
			.Heq(200)
			.radius(100)
			.bg(color: UIColor(hex: "FCC852"))
			.shadow();

		_=self.child([
			UIStackView(axis: .horz, align: .fill, fill: .eqSpace)
				.child([
					leftButton,
					rightButton
				])
				.Weq(vw),
			UIStackView(axis: .horz, align: .left, fill: .eqSpace)
				.padding(B: 5)
				.child([
					UIView().Weq((vw - 200) / 2),
					pieView,
					UIView().Weq((vw - 200) / 2)
				])
				.Weq(vw)
				.Heq(205)
		]);

		UIViewPropertyAnimator(duration: 1.2, curve: .easeIn) {
			_=self.rightView
				.rotate(angle: angle > 180 ? 180 : angle);
		}.startAnimation()
		Timer.scheduledTimer(withTimeInterval: 1.25, repeats: false) { _ in
			UIViewPropertyAnimator(duration: 0.4, curve: .easeOut) {
				_=self.leftView
					.rotate(angle: angle > 180 ? angle - 180 : 0);
			}.startAnimation();
		};
	};
};
