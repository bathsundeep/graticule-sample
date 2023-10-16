## Hello and welcome!

This sandbox requires Docker and Python 3.9 or greater. A virtual Python environment is recommended!

Install dependencies:
```bash
pip install -e '.[dev]'
```
Run the service:
```bash
uvicorn --app-dir service main:service --reload
```
Run the tests:
```bash
pytest service
```
Access the service from your browser:

http://localhost:8000

Build a Docker image:
```bash
docker build -t sample-backend:$(git rev-parse --short HEAD) -t sample-backend:latest .
```
Run a corresponding container:
```bash
docker run --rm -it -p 8001:8001 sample-backend
```
Access the Dockerized service from your browser:

http://localhost:8001

## Challenges

Please complete the following challenges. Once a challenge is completed, commit it with an appropriate comment so we can find your work. 

1. The service provides an http endpoint - use the provided self-signed certificate and key (in the `localhost-cert` directory) to create an https endoint for the service. Update the README to describe how to do this and how to test that it works.
 * This was done by adding two arguments to the Dockerfile startup command that read in the certificate and key files. `--ssl-keyfile service/cert/key.pem --ssl-certfile service/cert/cert.pem`. We know it works because when we run the newly generated image, the http endpoint no longer works and only https works. We can see the detailed certificate information like issuer, and also that we have TLS encrypted traffic to the page.
2. By default, Docker containers run as root. Following the principle of least privilege, update the Dockerfile to run the service as a non-root user. 
3. Create a GitHub Actions workflow to run tests on each commit to the main branch. 

4. In addition to the 3 challenges described in the README, please use a static vulnerability scanner of your choosing and summarize the findings (if any) and how you would approach remediation. 
 * https://docs.google.com/document/d/1HNGkP_OyvfZV4AG0uYdKavm7oixWtiiSD4a4e0fbTfM/edit?usp=sharing