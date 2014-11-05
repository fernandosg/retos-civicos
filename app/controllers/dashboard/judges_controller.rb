module Dashboard
  class JudgesController < Dashboard::BaseController
    def index
      @judges = Judge.all
    end

    def show
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(params[:user])
      @user.password = @user.email

      @user.userable = Judge.new
      if @user.save
        redirect_to dashboard_judges_path
      else
        render :new
      end
    end
  end
end
