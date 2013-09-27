require 'test_helper'

class MapTasksControllerTest < ActionController::TestCase
  setup do
    @map_task = map_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:map_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create map_task" do
    assert_difference('MapTask.count') do
      post :create, map_task: { match_id: @map_task.match_id, order: @map_task.order, status: @map_task.status, task_id: @map_task.task_id, title: @map_task.title }
    end

    assert_redirected_to map_task_path(assigns(:map_task))
  end

  test "should show map_task" do
    get :show, id: @map_task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @map_task
    assert_response :success
  end

  test "should update map_task" do
    put :update, id: @map_task, map_task: { match_id: @map_task.match_id, order: @map_task.order, status: @map_task.status, task_id: @map_task.task_id, title: @map_task.title }
    assert_redirected_to map_task_path(assigns(:map_task))
  end

  test "should destroy map_task" do
    assert_difference('MapTask.count', -1) do
      delete :destroy, id: @map_task
    end

    assert_redirected_to map_tasks_path
  end
end
