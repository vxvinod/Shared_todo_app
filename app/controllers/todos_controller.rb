class TodosController < ApplicationController
  def index
  	@todo_item=Todo.all
  end

  def delete
  	@todo_delete=Todo.last.delete
  end
end
