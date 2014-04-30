# -*- coding: utf-8 -*-
require 'spec_helper'
include ApplicationHelper

describe "Attendances" do

  subject { page }

  describe "show atenndance page" do
    let(:event) { FactoryGirl.create(:event) }
    before do 
      visit show_event_path(event.url_param)
      click_link "あなたの予定を登録する"
    end
    it { should have_content("出欠を新規登録する") }
    it { should have_selector("select", count: 2) }
    it { should have_selector("#mytime_select_0", text: display_status(0)) } # not ok
    it { should have_selector("#mytime_select_1", text: display_status(0)) } # not ok
    it { should_not have_selector("#mytime_select_2") } 
  end

  describe "Create an attendance" do
    let(:event) { FactoryGirl.create(:event) }
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
      it { should have_selector(".fa-times-circle", count: 2) }
    end

    describe "submit with re-selecting both" do
      before do 
        select display_status(2), from: "mytime_select_0"  # select OK
        select display_status(1), from: "mytime_select_1"  # select Maybe
        click_button "更新する"
      end
      it { should have_link(new_name)}
      it { should have_content(new_comment)}
      it { should have_selector(".fa-question-circle", count: 1) }
      it { should have_selector(".fa-check-circle", count: 1) }
    end
  end


  describe "edit only first attendance" do
    let(:event) { FactoryGirl.create(:event_with_atdc) }
    
    before do
      visit edit_attendance_path(event.attendances[0], url_param: event.url_param)
      select display_status(2), from: "mytime_select_0"  # select OK
      select display_status(1), from: "mytime_select_1"  # select Maybe
      click_button "更新する"
    end

    it { should have_link(event.attendances[0].user_name)}
    it { should have_link(event.attendances[1].user_name)}
    it { should have_selector(".fa-question-circle", count: 1) }
    it { should have_selector(".fa-check-circle", count: 1) }
    it { should have_selector(".fa-times-circle", count: 2) }

  end

end
