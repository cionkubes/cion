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
To create a new environment navigate to the environments page, here you should see a form for creating a environment. The form consists of the following fields.

|Field|Description|
|---|---|
|Name|The name of the service, e.g. **qa**|
|Tag-Match|A regex, when new images are pushed the new image's tags must match in order for the images to be deployed to services running in this environment.|
|Connection mode|Choose one of the connection modes detailed below.|

##### Docker TLS
This connection mode allows you to securely connect to a remote docker environment over TLS. Click here for [help](secrets.md#docker) with setting up the secrets. You will need to fill out the following extra fields.
|Field|Description|
|---|---|
|URL|The remote environment's URL, e.g. **tcp://10.68.4.60:2376**|
|CA|The file with the certificate authority, e.g. **/run/secrets/qa.ca.pem**|
|Certificate|Client's certificate, e.g. **/run/secrets/qa.cert.pem**|
|Key|Client's key, e.g. **/run/secrets/qa.key.pem**|
##### Kubernetes service account
This connection mode allows you to securely connect to a remote kubernetes environment over with a service account. Click here for [help](secrets.md#kubernetes) with setting up the secrets. You will need to fill out the following extra fields.
|Field|Description|
|---|---|
|URL|The remote environment's URL, e.g. ****|
|CA|The file with the certificate authority, e.g. **/run/secrets/qa.ca.pem**|
|Certificate|Client's certificate, e.g. **/run/secrets/qa.cert.pem**|
|Key|Client's key, e.g. **/run/secrets/qa.key.pem**|

##### Docker socket
This connection mode allows you to connect to a local docker environment through the docker socket. This mode will connect through */var/run/docker.sock*

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

Navigate to the config page from the menu on the left. You can configure repositories in the textbox titled `repos`.

The config is a json structure consisting of a list of docker image host `users`. A `user` consists of the following properties.

##### User
|Field|Optional|Description|
|---|---|---|
|user|No|The image host username|
|repos|Yes|A list of repo objects described below|
|default_login|Yes|If a repository that is not in the `repos` object is accesses this default value will be used for all repositories under this user|
|default_glob|Yes|If a repository that is not in the `repos` object is accesses this default value will be used for all repositories under this user|

##### Repo
|Field|Optional|Description|
|---|---|---|
|repo|No|The name of the repository|
|login|Yes|A string pointing to a json file with credentials for logging in to `[user]/[repo]`|
|glob|Yes, default is `(.*)/(.*):(.*)`|A regex used for parsing incoming images, there should be three groups in the regex. The first group matches the user, the second group matches the repo, and the third group matches the tag. These matches are used i.e. when a environment accepts or rejects a tag.|
