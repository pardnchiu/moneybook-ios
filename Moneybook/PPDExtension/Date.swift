/**
 Copyright 2023 Pardn Ltd 帕登國際有限公司.
 Created by Pardn Chiu 邱敬幃.
 Email: chiuchingwei@icloud.com
 */

import Foundation
import UIKit

extension Date {
	var preMonth				: Date { get { return Calendar.current.date(byAdding: .month, value: -1, to: Date()) ?? Date(); } };
	var nextMonth				: Date { get { return Calendar.current.date(byAdding: .month, value: 1, to: Date()) ?? Date(); } };
	var startOfMonth		: Date { get { return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self))) ?? Date(); } };
	var startOfNextMonth: Date { get { return self.nextMonth.startOfMonth } };
	var endOfMonth			: Date { get { return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth) ?? Date(); } };
	var endOfPreMonth		: Date { get { return self.preMonth.endOfMonth } };
};
