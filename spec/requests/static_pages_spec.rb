require 'spec_helper'

describe "StaticPages" do
	
	describe "Home page" do
		
		it "should have the content 'MERL'" do
			visit '/static_pages/home'
			expect(page).to have_content('MERL')
		end

		it "should have the title 'Home'" do
			visit '/static_pages/home'
			expect(page).to have_title("MERL | Home")
		end
	
	end

	describe "About page" do
		
		it "should have the content 'About'" do
			visit '/static_pages/about'
			expect(page).to have_content('About')
		end

		it "should have the title 'About'" do
			visit '/static_pages/about'
			expect(page).to have_title("MERL | About")
		end

	end

	describe "Contact page" do
		
		it "should have content 'Contact'" do
			visit '/static_pages/contact'
			expect(page).to have_content('Contact')
		end

		it "should have the title 'Contact'" do
			visit '/static_pages/contact'
			expect(page).to have_title("MERL | Contact")
		end

	end
end
