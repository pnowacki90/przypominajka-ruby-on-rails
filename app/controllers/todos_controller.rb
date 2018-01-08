class TodosController < ApplicationController
  
  def show
    @todo = Todo.find(params[:id])
  end
  
  def index
    @todos = Todo.all
  end
  
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    flash[:notice] = "Usunięto"
    redirect_to todos_path
  end
  
  def edit
    @todo = Todo.find(params[:id])

  end
  
  def new
    @todo = Todo.new
  end
  
  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = "Utworzono obiekt"
      redirect_to todo_path(@todo)
    else
      render 'new'
    end
  end
  
  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      flash[:notice] = "Zaktualizowano wpis"
      redirect_to todo_path(@todo)
    else
      render 'edit'
    end
  end
  
  private
  def todo_params
    params.require(:todo).permit(:name, :description)
  end
end