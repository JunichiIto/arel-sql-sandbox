class Book < ApplicationRecord
  scope :order_by_symbol, -> { order(:title) }
  scope :order_by_symbol_desc, -> { order(title: :desc) }
  scope :order_by_text, -> { order("books.title") }
  scope :order_by_function, -> { order("LOWER(books.title)") }
  scope :order_by_function_with_arel_sql, -> { order(Arel.sql("LOWER(books.title)")) }
  scope :order_by_param, -> (param) { order(param) }
  scope :order_by_param_with_arel_sql, -> (param) { order(Arel.sql(param)) }
end
