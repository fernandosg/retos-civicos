module Dashboard
  class EvaluationsController < Dashboard::BaseController
    before_filter :set_challenge, except: :destroy
    before_filter :set_judge, only: :create
    load_and_authorize_resource

    def new
      add_crumb 'Jurado', dashboard_judges_path(challenge_id: params[:challenge_id].to_i)
      add_crumb 'Invitar a juez'
    end

    def show
    end

    def request_permission_for_challenge
      @user = User.find_by_email(params[:email])
      @judge = @user.userable if @user && @user.judge?

      if @user
        if @user.judge?
          render :show
        else
          # user is a collaborator or an organization
          alert_text = t('flash.judge.user_cannot_be_added_as_a_judge')
          redirect_to new_dashboard_judge_path(challenge_id: @challenge), alert: alert_text
        end
      else
        alert_text = t('flash.judge.does_not_exist')
        redirect_to new_dashboard_judge_path(challenge_id: @challenge), alert: alert_text
      end
    end

    def create
      if Evaluation.where(judge_id: @judge.id, challenge_id: @challenge.id).empty?
        @challenge.evaluations.create!(judge_id: @judge.id).initialize_report_cards
        notice_text = t('flash.judge.added_succesfully_for_this_challenge')
        redirect_to dashboard_judges_path(challenge_id: @challenge), notice: notice_text
      else
        alert_text = t('flash.judge.evaluation_already_exists_for_this_challenge')
        redirect_to new_dashboard_judge_path(challenge_id: @challenge), alert: alert_text
      end
    end

    def destroy
      evaluation = Evaluation.find(params[:id])
      challenge = evaluation.challenge
      if evaluation.self_destruct
        notice_text = t('flash.evaluation.evaluation_removed_successfully_from_the_challenge')
        redirect_to dashboard_judges_path(challenge_id: challenge), notice: notice_text
      else
        alert_text = t('flash.evaluation.there_was_an_issue_removing_the_evaluation_from_the_challenge')
        redirect_to dashboard_judges_path(challenge_id: challenge), alert: alert_text
      end
    end

    private

    def set_challenge
      @challenge = Challenge.find(params['challenge_id'])
    end

    def set_judge
      @judge = Judge.find(params['judge_id'])
    end
  end
end
