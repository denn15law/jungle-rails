require 'rails_helper'

RSpec.feature "Visitor navigates to home page, adds one product to cart", type: :feature, js: true do

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

  scenario "They click on add to cart," do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    page.find('.product button').click
    save_screenshot

    #VERIFY
    expect(page).to have_text 'My Cart (1)'
  end

end 