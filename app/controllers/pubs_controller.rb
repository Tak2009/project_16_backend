class PubsController < ApplicationController
    
    def index
        pubs = Pub.all
        render json: pubs
    end
end
