class Powder < Sinatra::Base

  # General route actions
  get '/' do
    erb :home
  end

  get '/about' do
    erb :about
  end

  # RESTful Protein Controller Actions
  # index
  get '/proteins' do
    @proteins = protein.all
    erb(:"proteins/index")
  end

  # new
  get '/proteins/new' do
    @protein = protein.new
    erb(:"proteins/new")
  end

  # create
  post '/proteins' do
    @protein = protein.new(params[:protein])
    if @protein.save
      redirect("/proteins/#{@protein.id}")
    else
      erb(:"proteins/new")
    end
  end

  # show
  get '/proteins/:id' do
    @protein = protein.find(params[:id])
    erb(:"proteins/show")
  end

  # edit
  get '/proteins/:id/edit' do
    @protein = protein.find(params[:id])
    erb(:"proteins/edit")
  end

  # update
  put '/proteins/:id' do
    @protein = protein.find(params[:id])
    if @protein.update_attributes(params[:protein])
      redirect("/proteins/#{protein.id}")
    else
      erb(:"proteins/edit")
    end
  end

  # delete
  delete '/proteins/:id/delete' do
    @protein = protein.find(params[:id])
    if @protein.destroy
      redirect('/proteins')
    else
      redirect("/proteins/#{@protein.id}")
    end
  end

end
