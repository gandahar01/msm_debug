class RolesController < ApplicationController
  def index
    @roles = Role.all
    render("roles/index.html.erb")
  end

  def show
    @role = Role.find(params[:id])
    render("roles/show.html.erb")
  end

  def new_form
    render("roles/new_form.html.erb")
  end

  def create_row
    @role = Role.new
    
    @role.character_name = params[:the_character_name]
    @role.movie_id = params[:the_movie_id]
    @role.actor_id = params[:the_actor_id]

    @role.save

    redirect_to("/roles/#{@role.id}")
  end

  def edit_form
    @role = Role.find(params[:id])
    render("roles/edit_form.html.erb")
  end

  def update_row
    @role = Role.find(params[:id])

    @role.character_name = params[:character_name]
    @role.movie_id = params[:movie_id]
    @role.actor_id = params[:actor_id]

    @role.save

    render("show")
  end

  def destroy
    @role = Role.find(params[:id])
    @role.destroy
    redirect_to("/roles")
  end
end
