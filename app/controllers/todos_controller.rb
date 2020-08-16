class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  def index
    @todos = Todo.all
    @todo ||= Todo.new
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      redirect_to todos_path, notice: 'Todo was successfully created.'
    else
      render :new
    end
  end

  def update
    if @todo.update(todo_params)
      redirect_to @todo, notice: 'Todo was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @todo.destroy
      redirect_to todos_url, notice: 'Todo was successfully destroyed.'
    end
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:description, :completed_at)
  end
end
