class Blog < ApplicationRecord
  belongs_to :user

  scope :order_by_title, -> { order(:title) }
  scope :order_by_title_desc, -> { order(title: :desc) }
  scope :order_by_title_sql, -> { order("blogs.title") }
  scope :order_by_title_length, -> { order("LENGTH(blogs.title)") }
  scope :order_by_title_arel_sql, -> { order(Arel.sql("LENGTH(blogs.title)")) }
  scope :order_by_param, -> (param) { order(param) }
  scope :order_by_param_with_arel_sql, -> (param) { order(Arel.sql(param)) }
end
