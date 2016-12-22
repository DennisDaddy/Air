require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Ruby on Rails"
  end


  test "should get home" do
    get root_url
    assert_response :success
    assert_select "title", "Ruby on Rails"
    
  end

  test "should get help" do
    get help_url
    assert_response :success
    assert_select "title", "Help | Ruby on Rails"
  end

  test "Should get about" do
    get about_url
    assert_response :success
    assert_select "title", "About | Ruby on Rails"
    end

end
