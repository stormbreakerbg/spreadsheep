namespace '/sheet' do
  before { require_user_login! }

  get '/:id' do |id|
    @sheet = Sheet.find id

    ensure_user_access_to @sheet

    haml :'sheet/view', layout: :fullscreen
  end

  get '/:id/cells' do |id|
    @sheet = Sheet.find id

    ensure_user_access_to @sheet

    json @sheet.cells
  end

  get '/create/:directory_id' do |directory_id|
    @directory = Directory.find directory_id
    ensure_user_access_to @directory

    haml :'sheet/create'
  end

  post '/create/:directory_id' do |directory_id|
    @directory = Directory.find directory_id
    ensure_user_access_to @directory

    Sheet.create! user: current_user,
                  directory: @directory,
                  name: params['name']

    redirect to "/directory/#{@directory.id}/#{@directory.slug}"
  end

  post '/delete/:id' do |id|
    @sheet = Sheet.find id
    ensure_user_access_to @sheet

    redirect_url = "/directory/#{@sheet.directory.id}/#{@sheet.directory.slug}"

    @sheet.destroy!

    redirect to redirect_url
  end
end
