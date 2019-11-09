require 'spec_helper'

describe 'nested form for tag in post', :type => :feature do 
  it 'can create a post without a new tag' do
    visit 'posts/new'
    within(all('.field').first) do
      fill_in('Name', :with => @post1.name)
      fill_in('Content', :with => @post1.content)
    end
    click_button('Create Post')
    expect(page).to have_content(@post1.name)
  end

  it 'can create a post with a new tag' do 
    visit 'posts/new'
    within(all('.field').first) do
      fill_in('Name', :with => @post1.name)
      fill_in('Content', :with => @post1.content)
    end
    binding.pry
    within(all('.field').last) do
      fill_in('post_tags_attributes_0_name', :with => "witty")
    end
    click_button('Create Post')
    expect(page).to have_content("witty")
  end
end