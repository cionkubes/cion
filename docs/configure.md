# Configuring cion

The cion web interface primarily exists to aid in configuring the automatic deployment of images to services in either docker swarm or kubernetes. Some experimental features may be configurable in a online text editor while a UI is developed for the feature.

### User management
When cion starts for the first time a admin user will be created with the username and password **admin**, it's necessary to change this password *immediately*.

Navigate to the admin page from the menu on the left. You should see a list of existing users. Click on a user open the user settings for that user.
![admin page](img/admin.png)

#### Changing password
To change a users password navigate to the users settings, here you should see a form where you can input the new password.

#### Changing permissions
To change a users permissions navigate to the users settings, here you should see a series of checkboxes for each available permission.

#### Deleteing a user
To delete a user navigate to the users settings, here you should see a delete button at the top right of the page.

#### Creating a user
To create a user navigate to the admin page, here you should see a page with a form for creating a new user.

### Profile
You can access your own profile by clicking on the *profile* link at the bottom left. Here you can change your own password and set a email account used for your gravatar profile image.
![profile page](img/profile.png)

### Environment

Navigate to the environments page from the menu on the left. You should see ....
![environment page](img/env.png)

#### Creating a new environment
...

#### Deleting a environment
...

#### Environment settings
...

### Service
Navigate to the services page from the menu on the left. You should see a list of existing services and a button for creating new services.
![services page](img/services.png)

#### Creating a new service
To create a service navigate to the services page, here you should see the `create` button in the top right. The form has the three following fields.

|Field|Description|
|---|---|
|Service Name|This field corresponds with the name of the service running in your environments as show by docker service ls, if a service is running in a kubernetes environment the name should correspond with the deployment name.|
|Environments|Select the list of environments where cion should look for services matching the name field.|
|Image name|This field should identify the image you wish to update the found services with, the format is: `[repo]/[image]` e.g. `cion/web` (NB tags should not be specified here, it is up the the individual environments to accept or reject tags)|

### Repositories

Navigate to the repositories page from the menu on the left. You should see ....
![environment page](img/repos.png)

...