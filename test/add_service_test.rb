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

  test 'should raise error if initialized without string' do
    assert_raises(ArgumentError) do
      AddService.new(12345)
    end

    assert_raises(ArgumentError) do
      AddService.new(nil)
    end

    assert_raises(ArgumentError) do
      AddService.new({})
    end

    assert_raises(ArgumentError) do
      AddService.new([])
    end
  end
end