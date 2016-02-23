locations = Location.create ([{name: 'San Luis Obispo', state: 'CA', zip: '93401'}, {name: 'San Diego', state: 'CA', zip: '90913'}, {name: 'Los Angeles', state: 'CA', zip: '90001'}])
user = User.create(name: 'Sunjay Dhama', email: 'sunjay@example.com', password: "password")
post = Post.create(user_id:1, to_id:1, from_id:1, title: 'Test Title', description: 'Test Description', when_date: DateTime.strptime("02/23/2016 17:00", "%m/%d/%Y %H:%M"))

