require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    before do
      @message = FactoryBot.build(:message)
    end

    it 'contentとimageが存在していれば保存できること' do
      expect(@message).to be_valid
    end
    it 'contentが空でも保存できること' do
      @message.content = nul
      expect(@message).to be_valid
    end
    it 'imageが空でも保存できること' do
      @message.image = nul
      expect(@message).to be_valid
    end
    it 'contentとimageが空では保存できないこと' do
      @message.content = nul
      @message.image = nul
      @message.valid?
      expect(@message.errors.full_message).to include("Content can't be blank")
    end
    it 'roomが紐付いていないと保存できないこと' do
      @message.room = nil
      @message.valid?
      expect(@message.errors.full_messages).to include("Room must exist")

    end
    it 'userが紐付いていないと保存できないこと' do
      @message.user = nil
      @message.valid?
      expect(@message.errors.full_messages).to include("User must exist")
    end
  end
end