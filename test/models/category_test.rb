require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@category = Category.new(category: "Example Category")
  end

  test "should be valid" do
  	assert @category.valid?
  end

  test "category should be present" do
  	@category.category = "   "
  	assert_not @category.valid?
  end

end
