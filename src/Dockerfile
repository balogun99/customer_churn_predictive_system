FROM python:3.10.18
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
EXPOSE 8501
CMD ["Streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]