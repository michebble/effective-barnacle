require "rails_helper"

RSpec.describe Job, type: :model do
  describe ".mark_as_done" do
    let(:job) { create(:job, done_at: nil) }

    it "sets the job's done_at" do
      freeze_time do
        expect { job.mark_as_done }.to change { job.done_at }.from(nil).to(Time.current)
      end
    end

    context "when the job's done_at is already set" do
      let(:job) { create(:job, done_at: Time.current - 1.hour) }

      it "does not change the current done_at" do
        expect { job.mark_as_done }.to_not change { job.done_at }
      end
    end
  end

  # Scopes

  describe "#by_period" do
    let!(:out_of_range_job1) { create(:job, start_on: "2022/02/28") }
    let!(:out_of_range_job2) { create(:job, start_on: "2022/04/01") }
    let!(:in_range_job) { create(:job, start_on: "2022/03/12") }
    let(:start_on_from) { "2022/03/01" }
    let(:start_on_to) { "2022/03/30" }

    it "returns jobs between the start_on_from and start_on_to dates" do
      expect(Job.by_period(start_on_from, start_on_to)).to contain_exactly(in_range_job)
    end
  end
end
