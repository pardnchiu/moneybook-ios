/**
 Copyright 2023 Pardn Ltd 帕登國際有限公司.
 Created by Pardn Chiu 邱敬幃.
 Email: chiuchingwei@icloud.com
 */

import Foundation
import UIKit

class numPadView: UIStackView {

	convenience init(bgColor: UIColor) {
		self.init(axis: .vert, align: .left, fill: .eqSpace, gap: 10);

		let textView = UIStackView(axis: .horz, align: .fill, fill: .eqSpace)
			.frame(0, 0, vw, 50)
			.bg(color: .white)
			.padding(L: 15)
			.padding(R: 15)
			.child([
				UITextField()
					._({ e in
						e.placeholder = "在此輸入描述"
					}),
				UILabel()
					.text("$0")
					.font(weight: .bold, size: 23)
			])
			.border(vert: .black, width: 2);

		let enterButton = UIButton()
			.text("⏎", color: .white, align: .center)
			.font(weight: .bold, size: 21)
			.bg(color: UIColor(hex: "F97473"))
			.radius((vw - 90) / 5 / 2)
			.border(color: .black, width: 2);

		_=self
			.padding(L: 15)
			.padding(T: 70)
			.bg(color: bgColor)
			.child([
				UIStackView(axis: .horz, align: .left, fill: .eqSpace)
					.child([
						UIButton()
							.img(UIImage(sys: "arrowtriangle.backward.fill"))
							.text(color: .black, align: .left)
							.Heq(40),
						UIButton()
							.img(UIImage(sys: "calendar.badge.clock"), align: .left, gap: 10)
							.text("2023/05/04 星期四", color: .black, align: .center)
							.font(weight: .bold, size: 17)
							.Heq(40),
						UIButton()
							.img(UIImage(sys: "arrowtriangle.forward.fill"))
							.text(color: .black, align: .right)
							.Heq(40)
					])
					.bg(color: .white)
					.Weq(vw - 30)
					.Heq(40)
					.radius(20)
					.border(color: .black, width: 2)
					.clip(view: true),
				UIStackView(axis: .horz, align: .left, fill: .eqSpace, gap: 15)
					.child([
						UIButton()
							.text("7", color: .black, align: .center)
							.font(weight: .bold, size: 21)
							.bg(color: .white)
							.radius((vw - 90) / 5 / 2)
							.border(color: .black, width: 2)
							.Weq((vw - 90) / 5)
							.Heq((vw - 90) / 5),
						UIButton()
							.text("8", color: .black, align: .center)
							.font(weight: .bold, size: 21)
							.bg(color: .white)
							.radius((vw - 90) / 5 / 2)
							.border(color: .black, width: 2)
							.Weq((vw - 90) / 5)
							.Heq((vw - 90) / 5),
						UIButton()
							.text("9", color: .black, align: .center)
							.font(weight: .bold, size: 21)
							.bg(color: .white)
							.radius((vw - 90) / 5 / 2)
							.border(color: .black, width: 2)
							.Weq((vw - 90) / 5)
							.Heq((vw - 90) / 5),
						UIButton()
							.text("÷", color: .white, align: .center)
							.font(weight: .bold, size: 21)
							.bg(color: UIColor(hex: "47B7DF"))
							.radius((vw - 90) / 5 / 2)
							.border(color: .black, width: 2)
							.Weq((vw - 90) / 5)
							.Heq((vw - 90) / 5),
						UIButton()
							.text("AC", color: .white, align: .center)
							.font(weight: .bold, size: 21)
							.bg(color: UIColor(hex: "47B7DF"))
							.radius((vw - 90) / 5 / 2)
							.border(color: .black, width: 2)
							.Weq((vw - 90) / 5)
							.Heq((vw - 90) / 5)
					]),
				UIStackView(axis: .horz, align: .left, fill: .eqSpace, gap: 15)
					.child([
						UIButton()
							.text("4", color: .black, align: .center)
							.font(weight: .bold, size: 21)
							.bg(color: .white)
							.radius((vw - 90) / 5 / 2)
							.border(color: .black, width: 2)
							.Weq((vw - 90) / 5)
							.Heq((vw - 90) / 5),
						UIButton()
							.text("5", color: .black, align: .center)
							.font(weight: .bold, size: 21)
							.bg(color: .white)
							.radius((vw - 90) / 5 / 2)
							.border(color: .black, width: 2)
							.Weq((vw - 90) / 5)
							.Heq((vw - 90) / 5),
						UIButton()
							.text("6", color: .black, align: .center)
							.font(weight: .bold, size: 21)
							.bg(color: .white)
							.radius((vw - 90) / 5 / 2)
							.border(color: .black, width: 2)
							.Weq((vw - 90) / 5)
							.Heq((vw - 90) / 5),
						UIButton()
							.text("×", color: .white, align: .center)
							.font(weight: .bold, size: 21)
							.bg(color: UIColor(hex: "47B7DF"))
							.radius((vw - 90) / 5 / 2)
							.border(color: .black, width: 2)
							.Weq((vw - 90) / 5)
							.Heq((vw - 90) / 5),
						UIButton()
							.text("←", color: .white, align: .center)
							.font(weight: .bold, size: 21)
							.bg(color: UIColor(hex: "47B7DF"))
							.radius((vw - 90) / 5 / 2)
							.border(color: .black, width: 2)
							.Weq((vw - 90) / 5)
							.Heq((vw - 90) / 5)
					]),
				UIStackView(axis: .horz, align: .left, fill: .eqSpace, gap: 15)
					.child([
						UIButton()
							.text("1", color: .black, align: .center)
							.font(weight: .bold, size: 21)
							.bg(color: .white)
							.radius((vw - 90) / 5 / 2)
							.border(color: .black, width: 2)
							.Weq((vw - 90) / 5)
							.Heq((vw - 90) / 5),
						UIButton()
							.text("2", color: .black, align: .center)
							.font(weight: .bold, size: 21)
							.bg(color: .white)
							.radius((vw - 90) / 5 / 2)
							.border(color: .black, width: 2)
							.Weq((vw - 90) / 5)
							.Heq((vw - 90) / 5),
						UIButton()
							.text("3", color: .black, align: .center)
							.font(weight: .bold, size: 21)
							.bg(color: .white)
							.radius((vw - 90) / 5 / 2)
							.border(color: .black, width: 2)
							.Weq((vw - 90) / 5)
							.Heq((vw - 90) / 5),
						UIButton()
							.text("+", color: .white, align: .center)
							.font(weight: .bold, size: 21)
							.bg(color: UIColor(hex: "47B7DF"))
							.radius((vw - 90) / 5 / 2)
							.border(color: .black, width: 2)
							.Weq((vw - 90) / 5)
							.Heq((vw - 90) / 5)
					]),
				UIStackView(axis: .horz, align: .left, fill: .eqSpace, gap: 15)
					.child([
						UIButton()
							.text("00", color: .black, align: .center)
							.font(weight: .bold, size: 21)
							.bg(color: .white)
							.radius((vw - 90) / 5 / 2)
							.border(color: .black, width: 2)
							.Weq((vw - 90) / 5)
							.Heq((vw - 90) / 5),
						UIButton()
							.text("0", color: .black, align: .center)
							.font(weight: .bold, size: 21)
							.bg(color: .white)
							.radius((vw - 90) / 5 / 2)
							.border(color: .black, width: 2)
							.Weq((vw - 90) / 5)
							.Heq((vw - 90) / 5),
						UIButton()
							.text(".", color: .black, align: .center)
							.font(weight: .bold, size: 21)
							.bg(color: .white)
							.radius((vw - 90) / 5 / 2)
							.border(color: .black, width: 2)
							.Weq((vw - 90) / 5)
							.Heq((vw - 90) / 5),
						UIButton()
							.text("-", color: .white, align: .center)
							.font(weight: .bold, size: 21)
							.bg(color: UIColor(hex: "47B7DF"))
							.radius((vw - 90) / 5 / 2)
							.border(color: .black, width: 2)
							.Weq((vw - 90) / 5)
							.Heq((vw - 90) / 5)
					])
			])
			.child(unsort: [
				textView,
				enterButton
			]);

		_=enterButton
			.Beq(B: self, -safeBottom())
			.Req(R: self, -15)
			.Weq((vw - 90) / 5)
			.Heq((vw - 90) / 5 * 2 + 10)
	};
};
