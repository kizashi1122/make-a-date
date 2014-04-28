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
        before { click_button "イベント作成"  }
        it { should have_selector("h4", text: "イベント作成完了")  }
        it { 
          ev = Event.first
          should have_content(ev.url_param)
          should have_link show_event_path(ev.url_param)
        }
      end

      describe "with valid information" do
        subject { -> { click_button "イベント作成" } }
        it { should change( Event, :count ).by(1)  }
      end

      describe "with invalid information (without name)" do
        before do
          fill_in "イベント名", with: ""
          click_button "イベント作成"
        end
        it { should have_content("エラー") }
      end

      describe "with invalid information (without plan)" do
        before do
          fill_in "候補日時", with: ""
          click_button "イベント作成"
        end
        it { should have_content("エラー") }
      end
    end
  end

  describe "Show Event" do
    describe "with no-attendance" do
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
    
    describe "with 2 attendances" do
      let(:event) { FactoryGirl.create(:event_with_atdc) }
      
      before do  
        visit show_event_path(event.url_param)
      end
      
      describe "page" do
        it { should have_content(event.name) }
        it { should have_content('description1') }
        it { should have_content('description2') }
        it { should have_content('2014/1/3 19:00') }
        it { should have_content('2014/1/4 19:00') }
        it { should have_link(event.attendances[0].user_name, :href => edit_attendance_path(event.attendances[0], url_param: event.url_param)) }
        it { should have_link(event.attendances[1].user_name, :href => edit_attendance_path(event.attendances[1], url_param: event.url_param)) }
        it { should have_content(event.attendances[0].comment) }
        it { should have_content(event.attendances[1].comment) }
        it { should have_selector(".glyphicon-remove-sign", count: 4) }
      end
    end
  end
  
  describe "when visiting an unexisted Event" do

    let(:event) { FactoryGirl.create(:event) }

    describe "show page" do
      before  { get show_event_path("this_is_an_unexisted_url_param") } # do not use "visit". if so, response will be nil.
      specify { expect(response).to redirect_to(root_url) }
    end

    describe "edit page" do
      before  { get edit_event_path("this_is_an_unexisted_url_param")  }
      specify { expect(response).to redirect_to(root_url) }
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
      describe "edit an existed event" do
        let(:new_name) { "Name_Changed" }
        let(:new_desc) { "Desc_Changed" }
        let(:new_plan1) { "2014/1/5 19:00" }
        let(:new_plan2) { "2014/1/6 19:00" }
        let!(:org_plan) { event.plan }

        before do
          fill_in "イベント名", with: new_name
          fill_in "詳細",       with: new_desc
          fill_in "候補日時（追加）",   with: new_plan1 + "\n" + new_plan2 + "\n\n"
        end

        describe "with invalid information (without name)" do
          before do
            fill_in "イベント名", with: ""
            click_button "イベント更新"
          end
          it { should have_content("エラー") }
        end

        describe "with invalid information (without plan)" do
          before do
            fill_in "候補日時（追加）", with: ""
            click_button "イベント更新"
          end
          it { should have_content("エラー") }
        end

        describe "with valid information" do
          before do
            click_button "イベント更新"
          end

          it { should have_content(new_name) }
          it { should have_content(new_desc) }
          it { should have_content('2014/1/3 19:00') }
          it { should have_content('2014/1/4 19:00') }
          it { should have_content(new_plan1) }
          it { should have_content(new_plan2) }

          specify { expect(event.reload.name).to  eq new_name }
          specify { expect(event.reload.description).to  eq new_desc }
          specify { expect(event.reload.plan).to eq org_plan + "\t" + new_plan1 + "\t" + new_plan2 }
        end

      end
    end
  end

end
