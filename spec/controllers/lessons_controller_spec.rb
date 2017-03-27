require 'rails_helper'

RSpec.describe LessonsController, type: :controller do

  login_teacher

  before(:each) do
    @group = create(:group, teacher: @teacher)
    @lesson_params = {group_id: @group.id}
  end

  describe "GET index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index, params: @lesson_params
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "assigns @lessons" do
      lesson = create(:lesson, group: @group)
      get :index, params: @lesson_params
      expect(assigns(:lessons)).to eq([lesson])
    end
  end

  describe "GET new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new, params: @lesson_params
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "assigns @lesson" do
      lesson = build(:lesson, group: @group, duration: nil, date: nil)
      get :new, params: @lesson_params
      expect(assigns(:lesson).attributes).to eq(lesson.attributes)
    end
  end

  describe "GET show" do
    it "responds successfully with an HTTP 200 status code" do
      lesson = create(:lesson, group: @group)
      get :show, params: @lesson_params.merge({id: lesson.id})
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "assigns @lesson" do
      lesson = create(:lesson, group: @group)
      get :show, params: @lesson_params.merge({id: lesson.id})
      expect(assigns(:lesson)).to eq(lesson)
    end
  end

  describe "GET edit" do
    it "responds successfully with an HTTP 200 status code" do
      lesson = create(:lesson, group: @group)
      get :edit, params: @lesson_params.merge({id: lesson.id})
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "assigns @lesson" do
      lesson = create(:lesson, group: @group)
      get :edit, params: @lesson_params.merge({id: lesson.id})
      expect(assigns(:lesson)).to eq(lesson)
    end
  end

  describe "POST create" do
    context "with correct params" do
      it "creates a new lesson successfully" do
        expect {post :create, params: @lesson_params.merge(lesson: attributes_for(:lesson))}.to change(Lesson, :count).by(1)
      end

      it "redirects to lessons page" do
        post :create, params: @lesson_params.merge(lesson: attributes_for(:lesson))
        expect(response).to redirect_to(group_lessons_path(@group.id))
      end
    end

    context "with wrong params" do
      it "doesn't create a new lesson" do
        expect {post :create, params: @lesson_params.merge(lesson: {})}.to change(Lesson, :count).by(0)
      end

      it "renders new page" do
        post :create, params: @lesson_params.merge(lesson: {})
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT update" do
    context "with correct params" do

      before(:each) do
        @lesson = create(:lesson, group: @group, duration: 90)
        @lesson_attributes = {duration: 120}
        put :update, params: @lesson_params.merge(id: @lesson.id, lesson: @lesson_attributes)
      end

      it "updated an existing lesson successfully" do
        @lesson.reload
        expect(@lesson.duration).to eq(@lesson_attributes[:duration])
      end

      it "redirects to lesson page" do
        expect(response).to redirect_to(group_lesson_path(@group.id, @lesson.id))
      end
    end

  end
end
