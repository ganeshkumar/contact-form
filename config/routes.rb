Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  def new_contact
    redirect('ContactFrom/index.html')
  end

  get '/contact', to: new_contact
  root to: new_contact

  match '*path',  to: redirect('/404'), via: :all
end
