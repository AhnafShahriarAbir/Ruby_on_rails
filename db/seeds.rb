User.create!(name:  "Admin User",
             email: "admin@rmit.edu.au",
             password:              "password",
             password_confirmation: "password",
             admin: true)


User.create!(name:  "Coordinator 1",
             email: "cor1@rmit.edu.au",
             password:              "12345678",
             password_confirmation: "12345678")

User.create!(name:  "Coordinator 2",
             email: "cor2@rmit.edu.au",
             password:              "12345678",
             password_confirmation: "12345678")

User.create!(name:  "Coordinator 3",
             email: "cor3@rmit.edu.au",
             password:              "12345678",
             password_confirmation: "12345678")


Course.create!(name: "Java Programming",
              prerequisite: "Programming 1",
              category: "Programming",
              description: "This is a Java programming Course. And this is a description section where description is written. ",
              location: "12.12.12",
              user_id: 2)

Course.create!(name: "Python Programming",
              prerequisite: "Programming 1",
              category: "Programming",
              description: "This is a Python programming Course. And this is a description section where description is written. ",
              location: "12.12.12",
              user_id: 3)

Course.create!(name: "Further programming",
              prerequisite: "Programming 1",
              category: "Programming",
              description: "This is a Web programming Course. And this is a description section where description is written. ",
              location: "14.12.12",
              user_id: 2)

Category.create!(name: "Web Development")
Category.create!(name: "Java")
Category.create!(name: "Full Stack Dev")
Category.create!(name: "iOs Engineering")


Location.create!(name: "14.10.31")
Location.create!(name: "14.06.21")
Location.create!(name: "14.10.30")

