FactoryGirl.define do
  sequence :website do |_n|
    "http://www." + FFaker::Internet.domain_name
  end

  sequence :title do |_n|
    ["", "Director", "Sales Manager",  "Executive Assistant", "Marketing Manager", "Project Manager", "Product Manager", "Engineer"].sample
  end

  sequence :time do |n|
    Time.now - n.hours
  end

  sequence :date do |n|
    Date.today - n.days
  end
end