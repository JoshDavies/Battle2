
feature 'switches players turn' do
  scenario "switches to  player2 after player1 attacks" do
    sign_in_and_play
    click_button "Attack"
    click_button "ok"
    expect(page).to have_content 'Thor take your turn!'
  end
end
