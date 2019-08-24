require 'rails_helper'

RSpec.describe "agendas/show", type: :view do
  before(:each) do
    @agenda = assign(:agenda, Agenda.create!(
      :agenda_item => "Agenda Item",
      :is_complete => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Agenda Item/)
    expect(rendered).to match(/false/)
  end
end
