FactoryGirl.define do
  factory :inspection do
    sequence(:start_date)          {|n| DateTime.now.change(hour:9) + n.days}
    end_date                       {start_date + 30.minutes}
    inspection_type
    facility
  end
end
