FROM python:3.7-alpine

# Container runs 'pip3 install pipenv' to install pipenv.
# RUN ["pip3", "install", "pipenv"]
RUN pip3 install pipenv

# Copy files from current directory to app/.
COPY . app/

# Use app/ as working directory.
WORKDIR /app

# Container runs 'pipenv install' to install requirements (flask) from Pipfile. 
RUN pipenv install

# Listen on specified port.
EXPOSE 5000

# Finally, run flask app.py.
ENTRYPOINT pipenv run python app.py

