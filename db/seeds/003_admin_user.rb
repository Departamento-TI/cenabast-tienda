require 'highline/import'
require 'chilean/rutify'

# see last line where we create an admin if there is none, asking for email and password
def prompt_for_admin_password
  if ENV['ADMIN_PASSWORD']
    password = ENV['ADMIN_PASSWORD'].dup
    say "Admin Password #{password}"
  else
    password = ask('Password [spree123]: ') do |q|
      q.echo = false
      q.validate = /^(|.{6,40})$/
      q.responses[:not_valid] = 'Invalid password. Must be at least 6 characters long.'
      q.whitespace = :strip
    end
    password = 'spree123' if password.blank?
  end

  password
end

def prompt_for_admin_email
  if ENV['ADMIN_EMAIL']
    email = ENV['ADMIN_EMAIL'].dup
    say "Admin User #{email}"
  else
    email = ask('Email [spree@example.com]: ') do |q|
      q.echo = true
      q.whitespace = :strip
    end
    email = 'spree@example.com' if email.blank?
  end

  email
end

def prompt_for_admin_rut
  rut = ask('Rut [11.111.111-1]: ') do |q|
    q.validate = Chilean::Rutify.valid_rut? q
    q.responses[:not_valid] = 'Invalid run value. Must be a valid chilean rut.'
    q.whitespace = :strip
  end
  rut = '11.111.111-1' if rut.blank?
  Chilean::Rutify.format_rut(rut)
end

def create_admin_user
  if ENV['AUTO_ACCEPT']
    password = 'spree123'
    email = 'spree@example.com'
  else
    # name = prompt_for_admin_name unless name
    email = prompt_for_admin_email
    password = prompt_for_admin_password
    rut = prompt_for_admin_rut
  end
  attributes = {
    password:,
    password_confirmation: password,
    email:,
    login: email,
    run: rut
  }

  load 'spree/user.rb'

  if Spree::User.find_by(email:)
    say "\nWARNING: There is already a user with the email: #{email}, so no account changes were made.  If you wish to create an additional admin \
        user, please run rake spree_auth:admin:create again with a different email.\n\n"

  else
    admin = Spree::User.new(attributes)
    if admin.save
      role = Spree::Role.find_or_create_by(name: 'admin')
      admin.spree_roles << role
      admin.save
      admin.generate_spree_api_key! if Spree::Auth::Engine.api_available?
      say 'Done!'
    else
      say 'There was some problems with persisting new admin user:'
      admin.errors.full_messages.each do |error|
        say error
      end
    end
  end
end

create_admin_user if Spree::User.admin.empty? || agree('Would you like to create a new admin user? (yes/no)')
