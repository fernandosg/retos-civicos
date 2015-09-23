module Panel
  class BaseController < ApplicationController

    add_crumb 'Panel', '/panel/entradas'
    def authenticate_member!
      redirect_back_or challenges_path, I18n.t('flash.unauthorized.message') unless (current_user && current_user.member?)
    end
  end
end
