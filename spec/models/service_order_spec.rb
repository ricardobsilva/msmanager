require 'rails_helper'

RSpec.describe ServiceOrder, type: :model do
  it{ is_expected.to validate_presence_of(:issue_reported) }
end