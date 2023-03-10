# Python base image.
FROM python:3.10
RUN rmdir -rf LBG-Python
# Clone the repo
RUN git clone https://github.com/henrydellam/LBG-Python.git
# Create and set the work directory inside the image named 'app'
COPY LBG-Python .
WORKDIR /LBG-Python
# Execute a pip install command using the list 'requirements.txt'
RUN pip install -r requirements.txt
# Copy the app file into the image working directory
# State the listening port for the container. 
# The app's code does not actually specify the port, so it would be useful to include here.
EXPOSE 8080
# Run 'python app.py' on container start-up. This is the main process.
ENTRYPOINT ["python", "lbg.py"]
