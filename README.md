# README

- This project uses mysql as database. If you don't have it in your system please install it.

- Replace config/database.yml file with your username and password

- Replace Mailer setting in config/envirornments/development.rb file. with your username and password.

- Goto project dirctory i.e. contact-form

- Run 'bundle install'

- Run 'rake db:create'

- Run 'rake db:migrate'

- To run test cases run 'bundle exec rspec'

- To see coverage please check coverage fodler index.html file

- To run the app 'bundle exec rails s'

- goto browser and type 'http://localhost:3000/ or http://localhost:3000/contact" should redirect to contact form. 
   All other url's eg: http://loclhost:3000/contact-new should goto 404 page
   
- After getting form you choose ur language from dropdown and the form should show in respective language (internationalization done using Jquery plugin i18n)

- Try to submit the form without filling details and see errors show in respective language.

- Try to submit after filling all required fields you should be able to see success message in UI and an entry in database table and you should get email.

- Thank you!
