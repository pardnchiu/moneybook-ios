/**
 Copyright 2023 Pardn Ltd 帕登國際有限公司.
 Created by Pardn Chiu 邱敬幃.
 Email: chiuchingwei@icloud.com
 */

import Foundation
import UIKit

extension UICollectionView {
	
	@objc convenience public init(_ x: CGFloat,_ y: CGFloat,_ w: CGFloat,_ h: CGFloat,_ layout: UICollectionViewLayout) { self.init(frame: CGRect(x: x, y: y, width: w, height: h), collectionViewLayout: layout); };

	public func proto(_ delegate: UICollectionViewDelegate,_ dataSource: UICollectionViewDataSource) -> UICollectionView { self.delegate = delegate; self.dataSource = dataSource; return self; };

	public func padding(vert: CGFloat) -> UICollectionView { self.contentInset.top = vert; self.contentInset.bottom = vert; return self; };

	public func padding(horz: CGFloat) -> UICollectionView { self.contentInset.left = horz; self.contentInset.right = horz; return self; };

	public func padding(T: CGFloat) -> UICollectionView { self.contentInset.top = T; return self; };

	public func padding(B: CGFloat) -> UICollectionView { self.contentInset.bottom = B; return self; };

	public func cell(_ cell: AnyClass?,_ id: String) -> UICollectionView { self.register(cell, forCellWithReuseIdentifier: id); return self; };

	public func cell(reuse tag: String,_ indexPath: IndexPath) -> UICollectionViewCell { return self.dequeueReusableCell(withReuseIdentifier: tag, for: indexPath); };

	public func header(_ header: AnyClass?,_ id: String) -> UICollectionView { self.register(header, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: id); return self; };

	override public func alpha(_ alpha: CGFloat)  -> UICollectionView { self.alpha = alpha; return self; };

	override public func bg(color:  UIColor)  -> UICollectionView { self.backgroundColor = color; return self; };
};
