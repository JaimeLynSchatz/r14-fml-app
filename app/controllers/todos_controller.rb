class TodosController < ApplicationController
  def index
    @todo_items = Todo.all
    render :index
  end

  def delete
    Todo.last.delete
    redirect_to :action => 'index'
  end

  def add
    todo = Todo.create(:todo_item => params[:todo_text])
    if !todo.valid? # or say unless todo.valid?
      flash[:error] = todo.errors.full_messages.join("<br>").html_safe
    else
      flash[:success] = "You've added to the list!".html_safe
    end
    redirect_to :action => 'index'
   end

  def complete
    params.permit(:completed)
    params[:todo_checkbox].each do |check|
      todo_id = check
      t = Todo.find_by_id(todo_id)
      flash[:success] = "Well done!".hmtl_safe
      t.update_attribute(:completed, true)
    end
    redirect_to :action => 'index'
  end
end
