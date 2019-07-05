FROM gettyimages/spark:2.4.1-hadoop-3.0

# spark UI runs on 4040
EXPOSE 4040

# update the packages
RUN apt-get update -y

# install compilers and python libraries (at the moment required for the ujson pypi package)
RUN apt-get install build-essential python3-dev -y

# We're using pipenv to manage dependencies
RUN pip install "pip==10.0.1"
RUN pip install "pipenv==11.10.1"

# Copy the pip files over to do initial setup
COPY Pipfile* ./

# Install all deps
RUN pipenv sync

# Copy over all the code
COPY . .
