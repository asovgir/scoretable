require 'rails_helper'

RSpec.describe "agendas/edit", type: :view do
  before(:each) do
    @agenda = assign(:agenda, Agenda.create!(
      :agenda_item => "MyString",
      :is_complete => false
    ))
  end

  it "renders the edit agenda form" do
    render

    assert_select "form[action=?][method=?]", agenda_path(@agenda), "post" do

      assert_select "input[name=?]", "agenda[agenda_item]"

      assert_select "input[name=?]", "agenda[is_complete]"
    end
  end
end
