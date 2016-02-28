class TagsController < ApplicationController
    
    def index
        @filterrific = initialize_filterrific(
            Tag,
            params[:filterrific]
        ) or return
        @tags = @filterrific.find.page(params[:page])
    
        respond_to do |format|
            format.html
            format.js
        end
    end
    
    
    def new
        @directive = Directive.find_by(id: params[:directive_id])
        @tag = @directive.tags.build
        @relationship = DirectivesTag.new(directive_id: params[:directive_id])

    end
    
    def create
        directive = Directive.find_by(id: params[:tag][:directive_id])
        if directive.tags.create(tag: params[:tag][:tag])
            flash[:success] = "Tag Created!"
            redirect_to root_url
        else
            flash[:error] = "Tag Creation Failed"
            redirect_to root_url
        end
    end
end