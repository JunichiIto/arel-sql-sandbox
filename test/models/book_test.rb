require 'test_helper'

class BookTest < ActiveSupport::TestCase
  def setup
    @alice_book = books(:alice_book)
    @allen_book = books(:allen_book)
    @bob_book = books(:bob_book)
  end

  test ".order_by_symbol" do
    assert_equal [@allen_book, @alice_book, @bob_book], Book.order_by_symbol
  end

  test ".order_by_symbol_desc" do
    assert_equal [@bob_book, @alice_book, @allen_book], Book.order_by_symbol_desc
  end

  test ".order_by_text" do
    assert_equal [@allen_book, @alice_book, @bob_book], Book.order_by_text
  end

  test ".order_by_function" do
    assert_equal [@alice_book, @allen_book, @bob_book], Book.order_by_function
  end

  test ".order_by_function_with_arel_sql" do
    assert_equal [@alice_book, @allen_book, @bob_book], Book.order_by_function_with_arel_sql
  end

  test ".order_by_param" do
    assert_equal [@bob_book, @alice_book, @allen_book], Book.order_by_param("books.title DESC")

    # https://rails-sqli.org/
    sql = <<~SQL
      CASE WHEN SUBSTR(books.author_email, 1, 1) = 'x' THEN 0 ELSE 1 END
    SQL
    assert_equal [@bob_book, @alice_book, @allen_book], Book.order_by_param(sql)
  end

  test ".order_by_param_with_arel_sql" do
    sql = <<~SQL
      CASE WHEN SUBSTR(books.author_email, 1, 1) = 'x' THEN 0 ELSE 1 END
    SQL
    assert_equal [@bob_book, @alice_book, @allen_book], Book.order_by_param_with_arel_sql(sql)
  end

  ALLOWED_ATTRIBUTES = %w(title author_name).freeze
  def validate_order_by(text)
    unless text.in?(ALLOWED_ATTRIBUTES)
      raise ArgumentError, "Unexpected attribute: #{text}"
    end
    text
  end

  test '.validate_order_by' do
    text = 'title'
    order_by = validate_order_by(text)
    assert_equal [@allen_book, @alice_book, @bob_book], Book.order(Arel.sql(order_by))

    text = 'author_email'
    assert_raises(ArgumentError) do
      validate_order_by(text)
    end
  end
end
