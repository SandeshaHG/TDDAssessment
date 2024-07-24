require 'test_helper'

class AddServiceTest < ActiveSupport::TestCase
  def setup
    @service = AddService.new
  end

  test "should confirm AddService class exists" do
    assert defined?(AddService), "AddService class does not exist"
  end

  test 'should respond to add method' do
    assert_respond_to @service, :add
  end

  test 'add method should accept a string input' do
    assert_nothing_raised do
      @service.add("sample string")
    end
  end
end