class ApplicationController < ActionController::Base
    before_action :set_locale

    def default_url_options
        { locale: I18n.locale }
    end

    def changeLanguage
      changeUser = User.find_by_id(current_user.id)
      changeUser.prefLanguage = params[:language]
      changeUser.save
      redirect_to root_path(locale: changeUser.prefLanguage)
    end

    private

    def set_locale
      
        if signed_in?
            tempUser = User.find_by_id(current_user.id)
            if tempUser.prefLanguage != nil
                I18n.locale = tempUser.prefLanguage
            end
        elsif
            I18n.locale = params[:locale] || I18n.default_locale
        end
    end
end
