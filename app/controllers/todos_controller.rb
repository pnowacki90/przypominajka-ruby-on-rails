class TodosController < ApplicationController
  
  def show
    @todo = Todo.find(params[:id])
  end
  
  def index
    
  end
  
  def destroy
    
  end
  
  def edit
    
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
    
  end
  
  private
  def todo_params
    params.require(:todo).permit(:name, :description)
  end
end