class ApplicationController < ActionController::API
    before_action :basic
      
    private

    def basic
        # プロダクション環境だけBASIC認証をかけたい
        if Rails.env == "production"
        authenticate_or_request_with_http_basic do |name, password|
        name == ENV['BASIC_AUTH_NAME'] && password == ENV['BASIC_AUTH_PASSWORD']
        end
    end

end
