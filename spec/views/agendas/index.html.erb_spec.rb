require 'rails_helper'

RSpec.describe "agendas/index", type: :view do
  before(:each) do
    assign(:agendas, [
      Agenda.create!(
        :agenda_item => "Agenda Item",
        :is_complete => false
      ),
      Agenda.create!(
        :agenda_item => "Agenda Item",
        :is_complete => false
      )
    ])
  end

  it "renders a list of agendas" do
    render
    assert_select "tr>td", :text => "Agenda Item".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
