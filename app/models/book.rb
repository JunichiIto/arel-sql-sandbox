class Book < ApplicationRecord
  scope :order_by_symbol, -> { order(:author_name) }
  scope :order_by_symbol_desc, -> { order(author_name: :desc) }
  scope :order_by_text, -> { order("books.author_name") }
  scope :order_by_function, -> { order("LOWER(books.author_name)") }
  scope :order_by_function_with_arel_sql, -> { order(Arel.sql("LOWER(books.author_name)")) }
  scope :order_by_param, -> (param) { order(param) }
  scope :order_by_param_with_arel_sql, -> (param) { order(Arel.sql(param)) }
end
