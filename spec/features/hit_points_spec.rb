# frozen_string_literal: true

feature 'shows hit points' do
  scenario "allows player1 to see player2's hit points" do
    sign_in_and_play
    expect(page).to have_content 'Thor: 60HP'
  end
end

feature 'shows hit points' do
  scenario "allows player1 to see player2's hit points" do
    sign_in_and_play
    expect(page).to have_content 'Thanos: 60HP'
  end
end
