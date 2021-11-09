//
//  HomeViewController.swift
//  PartnerNotification
//
//  Created by 吉田なつみ on 2021/11/09.
//
import HorizonCalendar
import UIKit

class HomeViewController: UIViewController {

    private func makeContent() -> CalendarViewContent {
      let calendar = Calendar.current

      let startDate = calendar.date(from: DateComponents(year: 2020, month: 01, day: 01))!
      let endDate = calendar.date(from: DateComponents(year: 2021, month: 12, day: 31))!

      return CalendarViewContent(
        calendar: calendar,
        visibleDateRange: startDate...endDate,
        monthsLayout: .vertical(options: VerticalMonthsLayoutOptions()))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let calendarView = CalendarView(initialContent: makeContent())
        view.addSubview(calendarView)
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          calendarView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
          calendarView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
          calendarView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
          calendarView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
        ])
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
