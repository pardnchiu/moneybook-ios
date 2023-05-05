/**
 Copyright 2023 Pardn Ltd 帕登國際有限公司.
 Created by Pardn Chiu 邱敬幃.
 Email: chiuchingwei@icloud.com
 */

import Foundation
import UIKit

class tabLeftView: UIVisualEffectView {

	var tabView		: UIView!
	var backButton: UIButton!
	var headButton: UIButton!
	var nameLabel	: UILabel!
	var mailButton: UIButton!
	var listView	: UIStackView!

	private let animationSec: Double = 0.2;
	private let tabWidth	: CGFloat = vw * 0.7;
	private let topHeight	: CGFloat = safeTop() + 44 + 15 + 60 + 30;
	private let backIcon	: UIImage = UIImage(sys: "chevron.backward") ?? _image;
	private let headIcon	: UIImage = UIImage(sys: "person.fill") ?? _image;
	private let mailIcon	: UIImage = UIImage(sys: "envelope.fill") ?? _image;

	@objc func tabBack() {
		UIViewPropertyAnimator(duration: animationSec, curve: .easeOut) {
			_=self.alpha(0);
			_=self.tabView.x(-self.tabWidth);
		}.startAnimation();
	};

	convenience init(head: UIImage?, name: String) {
		self.init(style: .regular);

		backButton = UIButton(15, safeTop(), 30, 44)
			.img(backIcon)
			.text(color: .black, align: .left)
			.touch(down: self, #selector(tabBack));

		headButton = UIButton(15, safeTop() + 44 + 15, 60, 60)
			.bg(image: head, mode: .scaleAspectFit)
			.if(button: head == nil, { button in
				_ = button.bg(image: headIcon, mode: .center, color: .black)
			})
			.text(color: .black, align: .center)
			.bg(color: .lightGray)
			.radius(30)
			.border(color: .black, width: 2)
			

		nameLabel = UILabel(15 + 60 + 15, safeTop() + 44 + 10, tabWidth - (15 + 60 + 15) - 30, 30)
				.text(name, color: .black, align: .left, row: 1, wrap: .byClipping)
				.font(weight: .bold, size: 21);

		mailButton = UIButton(15 + 60 + 15, safeTop() + 44 + 20 + 30, tabWidth - (15 + 60 + 15) - 30, 40)
			.img(mailIcon, align: .left, gap: 10)
			.text("開啟信箱", color: .white, align: .center)
			.font(weight: .bold, size: 15)
			.radius(20)
			.border(color: .black, width: 2)
			.bg(color: UIColor(hex: "47B7DF"));

		listView = UIStackView(axis: .vert, align: .center, fill: .eqSpace, gap: 20)
			.padding(T: 20)
			.child([
				UIButton()
					.img(UIImage(name: "github"), align: .left, gap: 15)
					.text("Github", color: .black, align: .center)
					.radius(20)
					.border(color: .black, width: 2)
					.Weq(tabWidth - 40)
					.Heq(40),
				UIButton()
					.img(UIImage(name: "linkedin-in"), align: .left, gap: 15)
					.text("Linkedin", color: .black, align: .center)
					.radius(20)
					.border(color: .black, width: 2)
					.Weq(tabWidth - 40)
					.Heq(40),
				UIButton()
					.img(UIImage(name: "facebook"), align: .left, gap: 15)
					.text("Facebook", color: .black, align: .center)
					.radius(20)
					.border(color: .black, width: 2)
					.Weq(tabWidth - 40)
					.Heq(40),
				UIButton()
					.img(UIImage(name: "instagram"), align: .left, gap: 15)
					.text("Instagram", color: .black, align: .center)
					.radius(20)
					.border(color: .black, width: 2)
					.Weq(tabWidth - 40)
					.Heq(40)
			])

		tabView = UIView(-tabWidth, 0, tabWidth, vh)
			.bg(color: .white)
			.shadow()
			.child([
				UIView(0, 0, tabWidth, safeTop() + 44 + 15 + 60 + 30)
					.bg(color: UIColor(hex: "FCC852")),
				backButton,
				headButton,
				nameLabel,
				mailButton,
				listView
			]);

		_=self
			.frame(0, 0, vw, vh)
			.child([
				UIView(0, 0, vw, vh)
					.bg(color: UIColor(rgb: "0/0/0/0.07")),
				tabView
			])
			.alpha(0);

		_=listView
			.Teq(T: self, topHeight)
			.Weq(tabWidth);

		UIViewPropertyAnimator(duration: animationSec, curve: .easeIn) {
			_=self.alpha(1);
			_=self.tabView.x(0);
		}.startAnimation();
	};
};
