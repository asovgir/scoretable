require 'rails_helper'

RSpec.describe "agendas/new", type: :view do
  before(:each) do
    assign(:agenda, Agenda.new(
      :agenda_item => "MyString",
      :is_complete => false
    ))
  end

  it "renders new agenda form" do
    render

    assert_select "form[action=?][method=?]", agendas_path, "post" do

      assert_select "input[name=?]", "agenda[agenda_item]"

      assert_select "input[name=?]", "agenda[is_complete]"
    end
  end
end
