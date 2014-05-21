json.array!(@company_facebooks) do |company_facebook|
  json.extract! company_facebook, :id, :fid, :company_name, :f_url, :f_likes, :company_description
  json.url company_facebook_url(company_facebook, format: :json)
end
