# -*- coding: utf-8 -*-
require 'spec_helper'

describe "Events" do

  subject { page }
  
  describe "Home" do
    before { visit root_path }
    it { should have_content("イベント作成") }

    describe "Create Event" do
      before do
        fill_in "イベント名", with: "Some Event"
        fill_in "詳細",       with: "Place is blah blah blah.. \nUrl is blah blah"
        fill_in "候補日時",   with: "1\n2\n3\n\n"
      end

      describe "with valid information" do
        subject { -> { click_button "イベント作成" } }
        it { should change( Event, :count ).by(1) }
      end

      describe "with invalid information (without name)" do
        before do
          fill_in "イベント名", with: ""
          click_button "イベント作成"
        end
        it { should have_content("error") }
      end

      describe "with invalid information (without plan)" do
        before do
          fill_in "候補日時", with: ""
          click_button "イベント作成"
        end
        it { should have_content("error") }
      end
    end
  end

  describe "Show Event" do
    let(:event) { FactoryGirl.create(:event) }
    
    before do  
      visit show_event_path(event.url_param)
    end
    
    describe "page" do
      it { should have_content(event.name) }
      it { should have_content('description1') }
      it { should have_content('description2') }
      it { should have_content('2014/1/3 19:00') }
      it { should have_content('2014/1/4 19:00') }
    end
  end
  
  describe "Edit Event" do
    let(:event) { FactoryGirl.create(:event) }
    
    before do  
      visit edit_event_path(event.url_param)
    end
    
    describe "page" do
      it { should have_xpath("//input[@name='event[name]']") }
      it { have_selector("#event_name", value: event.name) }
      it { should have_content('description1') }
      it { should have_content('description2') }
      it { should have_content('2014/1/3 19:00') }
      it { should have_content('2014/1/4 19:00') }
      #
      # edit operation here
      # 
    end
  end

end
