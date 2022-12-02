require "rails_helper"

RSpec.describe JobsTableRowComponent, type: :component do
  let(:client) { create(:client, name: "Polly Anna") }
  let(:plumber1) { create(:plumber, name: "Fred Flitstone") }
  let(:plumber2) { create(:plumber, name: "Barney Rubble") }
  let(:job) { create(:job, client: client, start_on: "2022-02-01", plumbers: [plumber1, plumber2]) }
  it "renders component", :aggregate_failures do
    component = render_inline(described_class.new(job: job))
    expect(component).to have_text "Polly Anna"
    expect(component).to have_text " 1/ 2/2022"
    # expect(component).to have_text "Barney Rubble, Fred Flitstone"
  end
end
