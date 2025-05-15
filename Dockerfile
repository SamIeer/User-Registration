# this specifies the bade image that the build will extend
FROM python:slim    

# specifies the working directory or path in the image where files will be copied and commands will be executed
WORKDIR /#PROJECTS/app 

# copies the file from the host and pyt them into the container image
COPY requirements.txt ./
COPY . .

#tell builder to run the specifies command
# RUN pip install django
RUN pip install -r requirements.txt
RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		sqlite3 \
	&& rm -rf /var/lib/apt/lists/*
# ENV <name> <value> - this instruction sets an environment variable that a running container will use.

# this instruction sets configuration on the image that indicates a port the image would like to expose
EXPOSE 8000

# USER <user-or-uid> - this instruction sets the default user for all subsequent instructions.

# This instruction sets the default command a conatiner using this image will run
CMD ["python","manage.py","runserver","0.0.0.0:8000"]