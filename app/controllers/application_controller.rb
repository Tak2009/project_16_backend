class ApplicationController < ActionController::API
    before_action :basic
      
    private

    def basic
        # プロダクション環境だけBASIC認証をかけたい
        # if Rails.env.production? 
        http_basic_authenticate_with name: ENV['BASIC_AUTH_NAME'], password: ENV['BASIC_AUTH_PASSWORD'] if Rails.env.production?
    end

end
