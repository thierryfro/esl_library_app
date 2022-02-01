json.set! :students do

  json.array! @students do |student|
    json.extract! student, :name, :email
  end

end
