class TodoesController < ApplicationController
  #ログインしていなければ機能が使えない
  # before_action :authenticate_user!
  def index
    #ログインしてたらShowページに
    if (user_signed_in?)
      redirect_to controller: 'todoes', action: 'show', id: current_user.id
    end
  end

  @@current_goal_id = 0
  @@goal = 0
  def show
    @user = User.find(params[:id])
    @goal = @user.goals.last
    @@goal = @user.goals.last #タスク完了にわたすため
    #初回は目標を設定させる
    if (@goal.nil?)
      redirect_to controller: 'todoes', action: 'new'
      return
    end
    if !(@goal.nil?)
      @@current_goal_id = @goal.id
      @current_monster_id = @goal.monster_id
    end
    @monster = Monster.find(@current_monster_id)
    @task = Task.new
    # 完了、未完了タスク
    @get_check = Task.where(goal_id: @@current_goal_id).where(check: true)
    @get_uncheck = Task.where(goal_id: @@current_goal_id).where(check: false)
    # タスク完了、削除
    @check_task = Task.find_by(goal_id: @@current_goal_id)
    @destroy_task = Task.find_by(goal_id: @@current_goal_id)
    # モンスターコメント
    comment_max = Encourage.count;
    @comment = Encourage.find(rand(1..comment_max)).comment
  end
  #目標作成
  def new
    @goal = Goal.new
  end
  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    monster_max = Monster.count
    @goal.monster_id = rand(1..monster_max)
    @goal.save

    redirect_to controller: 'todoes', action: 'show', id: current_user.id
  end
  #タスク作成
  def task_create
    @task = Task.new(task_params)
    @task.goal_id = @@current_goal_id
    @task.save

    redirect_to controller: 'todoes', action: 'show', id: current_user.id
  end
  #タスク完了
  def task_check
    @task = Task.find(params[:id])
    @task.update(check: true)
    #経験値追加
    @@goal.increment(:ex , 10)
    @@goal.save

    if @@goal.ex >= 30
       @@goal.increment(:lv ,1)
       @@goal.save
       @@goal.update(ex: 0)
     end
    redirect_to controller: 'todoes', action: 'show', id: current_user.id
  end
  def destroy
    Task.find(params[:id]).destroy
    redirect_to controller: 'todoes', action: 'show', id: current_user.id
  end
  private
  def goal_params
    params.require(:goal).permit(:goal)
  end
  def task_params
    params.require(:task).permit(:task)
  end
end
