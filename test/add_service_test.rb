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
        @service.add(12345)
    end

    assert_raises(ArgumentError) do
        @service.add(nil)
    end

    assert_raises(ArgumentError) do
        @service.add({})
    end

    assert_raises(ArgumentError) do
        @service.add([])
    end
  end

  test 'should return 0 for empty string' do
    assert_equal 0, @service.add("")
  end

  test 'should return the number, if the entire string contains only digits' do
    assert_equal 12, @service.add("12")
  end

  test 'should raise error for strings which has any alphabet characters' do
    assert_raises(ArgumentError) do
        @service.add("12abcd")
    end

    assert_raises(ArgumentError) do
        @service.add("abcd12abcd")
    end

    assert_raises(ArgumentError) do
        @service.add("abcd12")
    end
  end
end