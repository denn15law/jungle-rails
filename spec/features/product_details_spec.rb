require 'rails_helper'

RSpec.feature "Visitor navigates to Product Page from Home Page", type: :feature, js: true do

  #SETUP
  before :each do
    @category = Category.create! name: 'Apparel'
    @category.products.create!(
      name: Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
  end

  scenario "Clicking on Product redirects to Product show page" do
    # ACT
    visit root_path


    # DEBUG / VERIFY
    page.find('.product header').click
    save_screenshot

    #VERIFY
    expect(page).to have_css 'section.products-show'
  end

end 
