# TODO:
# Clear the input after todo is created
# add reordering with acts as list
  # - https://www.youtube.com/watch?v=r884jAqAbHY
  # Try and update the positions of the elements in the stimulus controller, then trigger a stimulusreflex action to update them

class TodoReflex < ApplicationReflex
  before_reflex :build_todo, except: :create
  after_reflex :clear_todo, except: :create

  def create
    @todo = Todo.new(todo_params)

    if @todo.valid?
      @todo.save

      clear_todo
    else
      @todo
    end
  end

  def update
    params = todo_params.to_hash
    params["completed_at"] = params["completed_at"] == "1" ? Time.current : nil

    @todo.update(params)
  end

  def destroy
    @todo.destroy
  end

  protected

  # Clear the todo instance variable to prevent its value being used when the form is built
  def clear_todo
    @todo = nil
  end

  def todo_params
    params.require(:todo).permit(:id, :description, :completed_at)
  end

  def build_todo
    @todo = Todo.find(todo_params[:id].to_i)
  end
end
