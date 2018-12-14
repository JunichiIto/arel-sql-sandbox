require 'test_helper'

class BlogTest < ActiveSupport::TestCase
  test ".order_by_title" do
    assert_equal [blogs(:blahhh), blogs(:hi)], Blog.order_by_title
  end

  test ".order_by_title_desc" do
    assert_equal [blogs(:hi), blogs(:blahhh)], Blog.order_by_title_desc
  end

  test ".order_by_title_sql" do
    assert_equal [blogs(:blahhh), blogs(:hi)], Blog.order_by_title_sql
  end

  test ".order_by_title_length" do
    assert_equal [blogs(:hi), blogs(:blahhh)], Blog.order_by_title_length
  end

  test ".order_by_title_arel_sql" do
    assert_equal [blogs(:hi), blogs(:blahhh)], Blog.order_by_title_arel_sql
  end

  test ".order_by_param" do
    assert_equal [blogs(:blahhh), blogs(:hi)], Blog.order_by_param("blogs.title")
  end

  test ".order_by_param_with_arel_sql" do
    assert_equal [blogs(:blahhh), blogs(:hi)], Blog.order_by_param_with_arel_sql("blogs.title")
  end
end
