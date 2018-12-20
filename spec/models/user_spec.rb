require 'rails_helper'

describe User do
  describe '#create' do
    it "is valid with a nickname, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
    end

    it "is invalid with a password that has less than 6 characters " do
      user = build(:user, password: "12345", password_confirmation: "12345")
      user.valid?
      expect(user.errors[:password][0]).to include("は6文字以上で入力してください")
    end

    it "is invalid without telephone" do
    user = build(:user, telephone: "")
    user.valid?
    expect(user.errors[:telephone]).to include("を入力してください")
    end

    it "is invalid without first_name" do
    user = build(:user, first_name: "")
    user.valid?
    expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "is invalid without last_name" do
    user = build(:user, last_name: "")
    user.valid?
    expect(user.errors[:last_name]).to include("を入力してください")
    end

    it "is invalid without first_name_phonetic" do
    user = build(:user, first_name_phonetic: "")
    user.valid?
    expect(user.errors[:first_name_phonetic]).to include("を入力してください")
    end

    it "is invalid without last_name_phonetic" do
    user = build(:user, last_name_phonetic: "")
    user.valid?
    expect(user.errors[:last_name_phonetic]).to include("を入力してください")
    end

  end
end
