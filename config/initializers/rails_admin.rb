RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true
  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model Group do

    edit do
      exclude_fields :lessons
      field :students do
        nested_form false
      end
    end

  end

  config.model PriceDetail do

    list do
      exclude_fields :id
      field :price do
        pretty_value do
          bindings[:view].number_to_currency(value, precision: 0)
        end
      end
    end
  end

  [User, Teacher, Student].each do |imodel|

    config.model imodel do

      object_label_method do
        :full_name
      end

      list do
        field :first_name
        field :last_name
        field :email
        field :last_sign_in_at
      end

      edit do
        field :first_name
        field :last_name
        field :email
        field :password
      end
    end
  end
end
