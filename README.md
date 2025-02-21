###Summary:  https://github.com/user-attachments/assets/ef152e89-8706-4257-9424-3bbadfc0a5d4



###Focus Areas: I prioritized user experience, application design and its functionality. I tried to think on behalf of the user and what makes the application more appealing to the users, and how easily they can access and navigate the tasks. I believe this approach generates better ideas and how the application can be improved by thinking from someone's perspective.

###Time Spent: I spent almost 4 hours on this project, I allocated my time equally on this task as well as my daily routine tasks. I took 2 hours out of my day to finish this task and completed it in 2 days.

###Trade-offs and Decisions: One trade-off was using @StateObject for RecipeViewMode to make the UI reactive but it is less flexible for dependency injection or unit testing.
Also, I decided to load images asynchronously using tasks for responsive UI. But, this means there may be a slight delay in loading images when recipes are first fetched.

###Weakest Part of the Project: One weak point is error handling, the app displays an error message when loading fails but there’s no retry mechanism or alternative content in case of network failures.

###Additional Information:I thought about adding the search bar to search recipes by name and I also implemented it into the app, but I tested it and realized that the simple UI I had before looks much better so I removed it to make the app look simple yet appealing.

