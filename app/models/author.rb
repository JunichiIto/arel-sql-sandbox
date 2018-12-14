class Author < ApplicationRecord
  scope :order_by_symbol, -> { order(:name) }
  scope :order_by_symbol_desc, -> { order(name: :desc) }
  scope :order_by_text, -> { order("authors.name") }
  scope :order_by_function, -> { order("LOWER(authors.name)") }
  scope :order_by_function_with_arel_sql, -> { order(Arel.sql("LOWER(authors.name)")) }
  scope :order_by_param, -> (param) { order(param) }
  scope :order_by_param_with_arel_sql, -> (param) { order(Arel.sql(param)) }
end
