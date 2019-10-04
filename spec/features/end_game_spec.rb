feature 'lose game' do
  scenario 'player 2 has no hp and loses' do
    sign_in_and_play
    10.times{take_a_turn}
    click_button 'Attack'
    expect(page).to have_content "#{@player_2_name} loses"
  end
end
