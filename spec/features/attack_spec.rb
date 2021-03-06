# frozen_string_literal: true

feature '#attack' do
  scenario 'allows player_1 to attack player_2 and get a confirmation' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content "#{@player_2_name} took damage"
  end

  scenario 'player_1 attacks player_2 and takes off 10hp' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content "#{@player_2_name}: 50HP"
  end

  scenario 'player 2 attacks player 1 and takes off 10hp' do
    sign_in_and_play
    click_button 'Attack'
    click_button 'ok'
    click_button 'Attack'
    expect(page).to have_content "#{@player_1_name}: 50HP"
  end
end
