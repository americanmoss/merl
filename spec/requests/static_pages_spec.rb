require 'spec_helper'

describe "StaticPages" do

	subject {page}
	
	describe "Home page" do
		before {visit root_path}

		it { should have_content('Home') }
		it { should have_title("Home | MERL") }
	
	end

	describe "About page" do
		before {visit about_path}

		it { should have_content('About') }
		it { should have_title("About | MERL") }

	end

	describe "Contact page" do
		before {visit contact_path}
		
		it { should have_content('Contact') }
		it { should have_title("Contact | MERL") }

	end
end
