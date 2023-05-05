/**
 Copyright 2023 Pardn Ltd 帕登國際有限公司.
 Created by Pardn Chiu 邱敬幃.
 Email: chiuchingwei@icloud.com
 */

import Foundation
import UIKit

extension NSLayoutXAxisAnchor {

	public func eq(_ anchor: NSLayoutXAxisAnchor) -> NSLayoutConstraint { return self.constraint(equalTo: anchor) };

	public func eq(_ anchor: NSLayoutXAxisAnchor,_ val: CGFloat) -> NSLayoutConstraint { return self.constraint(equalTo: anchor, constant: val) };
};

extension NSLayoutYAxisAnchor {

	public func eq(_ anchor: NSLayoutYAxisAnchor) -> NSLayoutConstraint { return self.constraint(equalTo: anchor) };

	public func eq(_ anchor: NSLayoutYAxisAnchor,_ val: CGFloat) -> NSLayoutConstraint { return self.constraint(equalTo: anchor, constant: val) };
};

extension NSLayoutDimension {

	public func eq(_ val: CGFloat) -> NSLayoutConstraint { return self.constraint(equalToConstant: val) };
};

extension UIView {

	public var lytX: NSLayoutXAxisAnchor { get { return self.centerXAnchor } };

	public var lytL: NSLayoutXAxisAnchor { get { return self.leftAnchor } };

	public var lytR: NSLayoutXAxisAnchor { get { return self.rightAnchor } };

	public var lytT: NSLayoutYAxisAnchor { get { return self.topAnchor } };

	public var lytB: NSLayoutYAxisAnchor { get { return self.bottomAnchor } };

	public var lytW: NSLayoutDimension { get { return self.widthAnchor } };

	public var lytH: NSLayoutDimension { get { return self.heightAnchor } };

	public func autolayout(_ bool: Bool) -> UIView { self.translatesAutoresizingMaskIntoConstraints = !bool; return self; };

	public func Leq(L anchor: UIView,_ val: CGFloat) -> UIView { self.autolayout(true).lytL.eq(anchor.lytL, val).isActive = true; return self; };

	public func Req(R anchor: UIView,_ val: CGFloat) -> UIView { self.autolayout(true).lytR.eq(anchor.lytR, val).isActive = true; return self; };

	public func Teq(T anchor: UIView,_ val: CGFloat) -> UIView { self.autolayout(true).lytT.eq(anchor.lytT, val).isActive = true; return self; };

	public func Beq(B anchor: UIView,_ val: CGFloat) -> UIView { self.autolayout(true).lytB.eq(anchor.lytB, val).isActive = true; return self; };

	public func Xeq(X anchor: UIView) -> UIView { self.autolayout(true).lytX.eq(anchor.lytX).isActive = true; return self; };

	public func Leq(L anchor: UIView) -> UIView { self.autolayout(true).lytL.eq(anchor.lytL).isActive = true; return self; };

	public func Req(R anchor: UIView) -> UIView { self.autolayout(true).lytR.eq(anchor.lytR).isActive = true; return self; };

	public func Teq(T anchor: UIView) -> UIView { self.autolayout(true).lytT.eq(anchor.lytT).isActive = true; return self; };

	public func Teq(B anchor: UIView) -> UIView { self.autolayout(true).lytT.eq(anchor.lytB).isActive = true; return self; };

	public func Beq(T anchor: UIView) -> UIView { self.autolayout(true).lytB.eq(anchor.lytT).isActive = true; return self; };

	public func Beq(B anchor: UIView) -> UIView { self.autolayout(true).lytB.eq(anchor.lytB).isActive = true; return self; };

	public func Weq(_ val: CGFloat) -> UIView 	{ self.autolayout(true).lytW.eq(val).isActive = true; return self; };

	public func Heq(_ val: CGFloat) -> UIView 	{ self.autolayout(true).lytH.eq(val).isActive = true; return self; };
};
