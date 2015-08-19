require 'rails_helper'

describe Cart do

  it { is_expected.to have_and_belong_to_many :products }

end