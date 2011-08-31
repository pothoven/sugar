class Chart

  def Chart.collect_data_for_test_types(test_types, duration=4)
    dates = []
    today = Date.today
    start_date = today - duration.weeks
    while start_date <= today do
      dates.push(start_date)
      start_date += 1.day
    end
    chart_data = []
    test_types.each do |test_type|
      if test_type[1] == "on"
        chart_data.push({"name" => test_type[0], "results" => [], "dates" => dates})
      end
    end
    dates.each do |d|
      chart_data.each do |c|
        result = BloodTest.find_by_test_date_and_test_type_id(d, TestType[c["name"]].id)
        if result.present?
          c["results"].push([d.to_datetime.to_i * 1000, result.result])
        end
      end
    end

    return chart_data

  end

end
