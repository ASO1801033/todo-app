class TasksController < ApplicationController
  def index
    @tasks = Task.all #登録済みの全タスクを取得
  end

  def new
    @task = Task.new #入力フォームを表示するため@task = Task.newでTaskのモデルオブジェクトを作成
  end

  def create
    @task = Task.create(task_params) #POSTで送信されたパラメータをデータベースに登録
    redirect_to tasks_path #登録後タスク一覧画面に遷移
  end

  def edit
    @task = Task.find(params[:id]) #Tasksテーブルのidを元に検索
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_url #更新後タスク一覧画面に遷移
  end

  def destroy #削除機能(delete)
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_url #削除後タスク一覧画面に遷移
  end

  private
    def task_params
      params.require(:task).permit(:title)
    end


end
