class PubsController < ApplicationController
    
    def index
        # pubs = Pub.all
        # render json: pubs
        render plain: "hello world"
    end
end
