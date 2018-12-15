require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get books_url, params: { order_by: "books.title" }
    assert_response :success
  end
end