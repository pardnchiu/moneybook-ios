/**
 Copyright 2023 Pardn Ltd 帕登國際有限公司.
 Created by Pardn Chiu 邱敬幃.
 Email: chiuchingwei@icloud.com
 */

import Foundation
import UIKit

extension UIStackView {

	convenience init(axis: __axis, align: __alignment, gap: CGFloat) { self.init(); _=self.stack(axis: axis).stack(align: align).stack(gap: gap); };

	convenience init(axis: __axis, align: __alignment, fill: __distribution) { self.init(); _=self.stack(axis: axis).stack(align: align).stack(fill: fill); };

	convenience init(axis: __axis, align: __alignment, fill: __distribution, gap: CGFloat) { self.init(); _=self.stack(axis: axis).stack(align: align).stack(fill: fill).stack(gap: gap) };

	public override func frame(_ x: CGFloat,_ y: CGFloat,_ width: CGFloat,_ height: CGFloat) -> UIStackView { self.frame = CGRect(x, y, width, height); return self; };

	public override func bg(color:  UIColor)  -> UIStackView { self.backgroundColor = color; return self; };

	public enum __axis { case horz, vert; };

	public enum __alignment { case fill, left, right, center, top, bottom, first, last; };

	public enum __distribution { case fill, fillEq, fillPr, eqCenter, eqSpace; };

	public func trans(axis: __axis) -> NSLayoutConstraint.Axis {
		switch axis {
			case .horz: return .horizontal;
			case .vert: return .vertical;
		};
	};
	public func trans(align: __alignment) -> Alignment {
		switch align {
			case .fill	: return .fill; 					/* 填滿 */
			case .left	: return .leading; 				/* 靠左 */
			case .right	: return .trailing; 			/* 靠右 */
			case .center: return .center; 				/* 靠中 */
			case .top		: return .top; 						/* 頂部 */
			case .bottom: return .bottom; 				/* 底部 */
			case .first	: return .firstBaseline; 	/* 首行 */
			case .last	: return .lastBaseline; 	/* 尾行 */
		};
	};
	public func trans(fill: __distribution) -> Distribution {
		switch fill {
			case .fill	  : return .fill; 								/* 填滿空間 */
			case .fillEq  : return .fillEqually; 				/* 填滿並平均分配空間 */
			case .fillPr  : return .fillProportionally; 	/* 填滿並依比例分配空間 */
			case .eqCenter: return.equalCentering; 			/* 填充空間並相同間距 */
			case .eqSpace : return .equalSpacing; 				/* 填充空間並相同中心間距 */
		};
	};

	public func stack(axis:  __axis)  -> UIStackView { self.axis = trans(axis: axis); return self; };

	public func stack(align: __alignment) -> UIStackView { self.alignment = trans(align: align); return self; };

	public func stack(fill:  __distribution?)  -> UIStackView { if let fill = fill { self.distribution = trans(fill: fill); }; return self; };

	public func stack(gap:   CGFloat) -> UIStackView { self.spacing = gap; return self; };

	public func padding(T: CGFloat) -> UIStackView {
		let l: CGFloat = self.directionalLayoutMargins.leading;
		let b: CGFloat = self.directionalLayoutMargins.bottom;
		let r: CGFloat = self.directionalLayoutMargins.trailing;
		self.isLayoutMarginsRelativeArrangement = true;
		self.directionalLayoutMargins = NSDirectionalEdgeInsets(top: T, leading: l, bottom: b, trailing: r);
		return self;
	};

	public func padding(L: CGFloat) -> UIStackView {
		let t: CGFloat = self.directionalLayoutMargins.top;
		let b: CGFloat = self.directionalLayoutMargins.bottom;
		let r: CGFloat = self.directionalLayoutMargins.trailing;
		self.isLayoutMarginsRelativeArrangement = true;
		self.directionalLayoutMargins = NSDirectionalEdgeInsets(top: t, leading: L, bottom: b, trailing: r);
		return self;
	};

	public func padding(B: CGFloat) -> UIStackView {
		let t: CGFloat = self.directionalLayoutMargins.top;
		let l: CGFloat = self.directionalLayoutMargins.leading;
		let r: CGFloat = self.directionalLayoutMargins.trailing;
		self.isLayoutMarginsRelativeArrangement = true;
		self.directionalLayoutMargins = NSDirectionalEdgeInsets(top: t, leading: l, bottom: B, trailing: r);
		return self;
	};

	public func padding(R: CGFloat) -> UIStackView {
		let t: CGFloat = self.directionalLayoutMargins.top;
		let l: CGFloat = self.directionalLayoutMargins.leading;
		let b: CGFloat = self.directionalLayoutMargins.bottom;
		self.isLayoutMarginsRelativeArrangement = true;
		self.directionalLayoutMargins = NSDirectionalEdgeInsets(top: t, leading: l, bottom: b, trailing: R);
		return self;
	};

	public override func child(_ views: [UIView]) -> UIStackView { views.forEach { self.addArrangedSubview($0); }; return self; };

	public func child(unsort views: [UIView]) -> UIStackView { views.forEach { self.addSubview($0); }; return self; };

	public func child(_ view: UIView,_ index: Int) -> UIStackView { self.insertArrangedSubview(view, at: index); return self; };

	public func rm(_ 	 view: UIView) 				-> UIStackView { self.removeArrangedSubview(view); return self; };
};
