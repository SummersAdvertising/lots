require 'test_helper'

class MapWorkersControllerTest < ActionController::TestCase
  setup do
    @map_worker = map_workers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:map_workers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create map_worker" do
    assert_difference('MapWorker.count') do
      post :create, map_worker: { match_id: @map_worker.match_id, name: @map_worker.name, order: @map_worker.order, status: @map_worker.status, worker_id: @map_worker.worker_id }
    end

    assert_redirected_to map_worker_path(assigns(:map_worker))
  end

  test "should show map_worker" do
    get :show, id: @map_worker
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @map_worker
    assert_response :success
  end

  test "should update map_worker" do
    put :update, id: @map_worker, map_worker: { match_id: @map_worker.match_id, name: @map_worker.name, order: @map_worker.order, status: @map_worker.status, worker_id: @map_worker.worker_id }
    assert_redirected_to map_worker_path(assigns(:map_worker))
  end

  test "should destroy map_worker" do
    assert_difference('MapWorker.count', -1) do
      delete :destroy, id: @map_worker
    end

    assert_redirected_to map_workers_path
  end
end
