require 'test_helper'

class AddServiceTest < ActiveSupport::TestCase
  test "should confirm AddService class exists" do
    assert defined?(AddService), "AddService class does not exist"
  end

  test 'should respond to add method' do
    @service = AddService.new
    assert_respond_to @service, :add
  end
end