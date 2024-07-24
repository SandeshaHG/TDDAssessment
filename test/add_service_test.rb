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

  test 'should add 2 numbers in a string with commas' do
    assert_equal 15, @service.add("7,8")
  end

  test 'should add 3 numbers in a string with commas' do
    assert_equal 25, @service.add("7,8,10")
  end

  test 'should add 4 numbers in a string with commas' do
    assert_equal 30, @service.add("7,8,10,5")
  end

  test 'should add 2 numbers if they are separated by /n (new line)' do
    assert_equal 15, @service.add("7\n8")
  end

  test 'should add multiple numbers if they are separated by /n (new line)' do
    assert_equal 25, @service.add("7\n8\n10")
  end

  test 'should add multiple numbers if they are separated by /n (new line) and commas' do
    assert_equal 35, @service.add("7\n8,10\n10")
  end

  test 'should respond to validate_input method' do
    assert_respond_to @service, :validate_input
  end

  test 'should respond to fetch delimiter method and return \n and , if // is not present' do
    assert_respond_to @service, :fetch_delimiter
    assert_equal 35, @service.add("7\n8,10\n10")
  end

  test 'should return the necessary delimiter  if // is present' do
    assert_equal 3, @service.fetch_delimiter("//;\n1;2")
  end
end