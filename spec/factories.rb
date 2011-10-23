require 'factory_girl'

FactoryGirl.define do
  # Users
  factory :user, :aliases => [:bob, :jamis] do
    sequence(:username) { |n| "darksideofthemoon_#{n}" }
    sequence(:email)    { |n| "pf#{n}@love.com" }
    password "bob123bob"
    password_confirmation "bob123bob"
  end

  factory :jimmy, :class => :user do
    username "jpage"
    email "jpage@lz.com"
    password "stairwaytoheaven"
    password_confirmation "stairwaytoheaven"
  end

  # Lists
  factory :todo_list, :class => :list do |l|
    l.name "my todo list"
    l.public true
    l.association :user, :factory => :jimmy
  end

  factory :xmas_list, :class => :list do |l|
    l.name "xmas list"
    l.public false
  end

  factory :groceries_list, :class => :list do |l|
    l.name "groceries' list"
    l.public true
    l.association :user, :factory => :jamis
  end

  factory :shopping_list, :class => :list do |l|
    l.name "shopping list"
    l.public true
    l.association :user, :factory => :jamis
  end

  # Tasks
  factory :xmas_gifts_task, :class => :task do
    name "buy children's presents"
    finished false
    due_on do
      today = Date.today
      next_xmas_year = today >= Date.civil(today.year, 12, 25) ? today.year : today.year + 1
      DateTime.new(next_xmas_year, 12, 24)
    end
    association :list, :factory => :xmas_list
  end

  factory :buy_wine_task, :class => :task do
    name "buy wine to dinner"
    finished false
    association :list, :factory => :shopping_list
  end

  factory :today_pending_task, :class => :task do
    name "something i should do today"
    finished false
    due_on { Date.today.midnight }
    association :list, :factory => :todo_list
  end

  factory :today_finished_task, :class => :task do
    name "something already done due today"
    finished true
    due_on { Date.today.midnight }
    association :list, :factory => :todo_list
  end
end
