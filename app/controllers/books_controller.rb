class BooksController < ApplicationController
  def index
    @books =
      if params[:arel_sql]
        Book.order(Arel.sql(params[:order_by]))
      else
        Book.order(params[:order_by])
      end
  end
end
