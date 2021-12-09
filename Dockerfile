# Base image
FROM python:3.9-slim

# Update os and install git
RUN apt-get update && \
    apt-get install -y git

# Install pip and setuptools
RUN pip install --upgrade pip && \
    pip install --upgrade setuptools

# Install dependecies
WORKDIR /home
COPY . /home
RUN pip install -r requirements.txt

# Run notebook
EXPOSE 8888
CMD [ "jupyter", "notebook", "--ip", "0.0.0.0", "--port", "8888", "--no-browser", "--allow-root" ]
