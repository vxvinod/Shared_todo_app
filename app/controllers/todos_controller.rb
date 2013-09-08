class TodosController < ApplicationController
  def index
  	@todo_item=Todo.all
  	@new_todo=Todo.new
  end

  def delete
  	@todo_delete=Todo.last.delete
  end

  def add
  	todo = Todo.create(:todo_item => params[:todo][:todo_item])

  	unless todo.valid?
  		flash[:error]=todo.errors.full_messages.join("<br>").html_safe
  	else
  		flash[:success]="Todo is successfully added"
  	end
  	  	redirect_to :action=>'index'

  end

  def complete

    params[:todo_checkbox].each do |check|
      todo_id=check
      t=Todo.find_by_id(todo_id)
      t.update_attribute(:completed,true)
    end
    redirect_to :action => 'index'
    

  end


end
