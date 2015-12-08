FactoryGirl.define do
	factory :user do
		sequence :email do 
			"kbaries@gmail.com"
		end
		password "ohreally"
		password_confirmation "ohreally"
	end
end