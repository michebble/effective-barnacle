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
end
