# ⚡ PySpark Shell

Quickly get PySpark 2.4.1 running with Python 3.5 up and running locally via Docker.

## Usage

	$ make shell

### Options

If you want to alter the memory made available to PySpark from the default of 1GB
you can pass the `memory` parameter:

	$ make shell memory=8G

## Requirements

- Make
- Docker v17+
- AWS credentials set in environment variables if you want to read from S3 etc
