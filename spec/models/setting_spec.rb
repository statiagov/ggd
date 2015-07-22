require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Setting do
  it "should create a new instance given valid attributes" do
    Setting.create!(name: "name", value: "value")
  end

  it "should find existing setting by its name using [] or method notations, and cache settings" do
    @setting = FactoryGirl.create(:setting, name: "thingymabob", value: "magoody")
    expect(Setting.cache.key?("thingymabob")).to eq(false)
    expect(Setting[:thingymabob]).to eq("magoody")
    expect(Setting.cache.key?("thingymabob")).to eq(true)
    expect(Setting.thingymabob).to eq("magoody")
  end

  it "should use value from YAML if setting is missing from database" do
    @setting = FactoryGirl.create(:setting, name: "magoody", value: nil)
    Setting.yaml_settings.merge!(magoody: "thingymabob")
    expect(Setting[:magoody]).to eq("thingymabob")
    expect(Setting.magoody).to eq("thingymabob")
  end

  it "should save a new value of a setting using []= or method notation" do
    Setting[:hello] = "world"
    expect(Setting[:hello]).to eq("world")
    expect(Setting.hello).to eq("world")

    Setting.world = "hello"
    expect(Setting.world).to eq("hello")
    expect(Setting[:world]).to eq("hello")
  end

  it "should handle false and nil values correctly" do
    Setting[:hello] = false
    expect(Setting[:hello]).to eq(false)
    expect(Setting.hello).to eq(false)
  end
end