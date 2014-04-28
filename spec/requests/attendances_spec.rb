# -*- coding: utf-8 -*-
require 'spec_helper'

describe "Attendances" do

  subject { page }
  let(:event) { FactoryGirl.create(:event) }

  describe "show atenndance page" do
    before do 
      visit show_event_path(event.url_param)
      click_link "あなたの予定を登録する"
    end
    it { should have_content("出欠を新規登録する") }
    it { should have_selector("select", count: 2) }
    it { should have_selector("#mytime_select_0", text: "Not OK") }
    it { should have_selector("#mytime_select_1", text: "Not OK") }
    it { should_not have_selector("#mytime_select_2") } 
  end

  describe "Create an attendance" do
    let(:new_name) { "John Doe" }
    let(:new_comment) { "I wanna participate in it." }

    before do 
      visit new_attendance_path(event.url_param)
      fill_in "お名前", with: new_name
      fill_in "コメント",       with: new_comment
    end
    
    describe "submit with no name" do
      before do
        fill_in "お名前", with: ""
        click_button "更新する" 
      end
      it { should have_content("エラー")}
    end
        
    describe "submit without re-selecting" do
      before { click_button "更新する" }
      it { should have_link(new_name)}
      it { should have_content(new_comment)}
      it { should have_selector(".glyphicon-remove-sign", count: 2) }
    end

    describe "submit with re-selecting both" do
      before do 
        select "Ok!",   from: "mytime_select_0"
        select "Maybe", from: "mytime_select_1"
        click_button "更新する"
      end
      it { should have_link(new_name)}
      it { should have_content(new_comment)}
      it { should have_selector(".glyphicon-question-sign", count: 1) }
      it { should have_selector(".glyphicon-ok-sign", count: 1) }
    end

  end
end
